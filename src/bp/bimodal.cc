#include <vector>
#include "bimodal.h"

extern "C" {
#include "bp/bp.param.h"
#include "core.param.h"
#include "globals/assert.h"
#include "statistics.h"
}

#define BIMODAL_PHT_SIZE (1 << 10)
#define PHT_INIT_VALUE (0x1 << (PHT_CTR_BITS - 1))
#define PHT_MAX_VALUE ((1 << PHT_CTR_BITS) - 1)
#define DEBUG(proc_id, args...) _DEBUG(proc_id, DEBUG_BP_DIR, ##args)

namespace { 

struct Bimodal_State {
    std::vector<uns8> pht;
};

std::vector<Bimodal_State> bimodal_state_all_cores;

void bp_bimodal_timestamp(Op* op) {}
void bp_bimodal_recover(Recovery_Info* info) {}
void bp_bimodal_spec_update(Op* op) {}
uns8 bp_bimodal_full(uns proc_id) { return 0; } 

uns8 bp_bimodal_pred(Op* op) {
    const uns proc_id = op->proc_id;
    auto& pht = bimodal_state_all_cores.at(proc_id).pht;
    const Addr addr = op->oracle_info.pred_addr;
    const uns32 pht_index = addr & (BIMODAL_PHT_SIZE - 1);  // Use bitwise AND for faster indexing

    return (pht[pht_index] >= (1 << (PHT_CTR_BITS - 1))) ? 1 : 0;
}

void bp_bimodal_update(Op* op) {
    const uns proc_id = op->proc_id;
    auto& pht = bimodal_state_all_cores.at(proc_id).pht;
    const Addr addr = op->oracle_info.pred_addr;
    const uns32 pht_index = addr & (BIMODAL_PHT_SIZE - 1);  // Use bitwise AND for faster indexing

    bool actual_taken = (op->oracle_info.dir == TAKEN); 

    if (actual_taken) {
        if (pht[pht_index] < PHT_MAX_VALUE) {
            pht[pht_index]++;
        }
    } else {
        if (pht[pht_index] > 0) {
            pht[pht_index]--;
        }
    }
}

void bp_bimodal_init(void) {
    bimodal_state_all_cores.resize(NUM_CORES);
    for (auto& bimodal_state : bimodal_state_all_cores) {
        bimodal_state.pht.resize(BIMODAL_PHT_SIZE, PHT_INIT_VALUE);
    }
}

}  // namespace