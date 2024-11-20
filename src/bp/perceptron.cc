#include "perceptron.h"
#include <vector>
#include <cmath>
#include <iostream>

extern "C" {
#include "bp.param.h"
#include "core.param.h"
#include "globals/assert.h"
#include "table_info.h"
}

#define MAX_WT 127
#define MIN_WT -128
#define THETA floor(std::floor(1.93 * HIST_LENGTH + 14))

namespace{
    struct PerceptronState{
        std::vector<std::vector<int>> perceptron_table;
    };

    std::vector<PerceptronState> perceptron_state_all_cores;

    int compute_dot_product(const std::vector<int>& weights, const std::vector<int>& history){
        int dot_product = weights[0];
        for (size_t i = 0; i< history.size(); ++i){
            dot_product += weights[i+1] * history[i];
        }
        return dot_product;
    }
} //namespace

void bp_perceptron_init() {
    perceptron_state_all_cores.resize(NUM_CORES);
    for (auto& perceptron_state : perceptron_state_all_cores){
        perceptron_state.perceptron_table.resize(1 << HIST_LENGTH, std::vector<int>(HIST_LENGTH + 1, 0));
    }
}
void bp_perceptron_timestamp(Op* op) {}

uns8 bp_perceptron_pred(Op* op){
    const uns proc_id = op->proc_id;
    auto& perceptron_state = perceptron_state_all_cores.at(proc_id);
    const Addr  addr      = op->oracle_info.pred_addr;
    const uns32 hist      = op->oracle_info.pred_global_hist;

    const uns32 perceptron_index = addr & ((1 << HIST_LENGTH) - 1);
    const auto& weights = perceptron_state.perceptron_table[perceptron_index];

    std::vector<int> history(HIST_LENGTH);
    for (int i = 0; i < HIST_LENGTH; ++i){
        history[i] = (hist & (1 << i)) ? 1 : -1;
    }

    int result = compute_dot_product(weights, history);
    uns8 pred = (result > 0) ? 1 : 0;

    DEBUG(proc_id, "Perceptron prediction for op_num:%s index:%d result:%d pred:%d\n",
          unsstr64(op->op_num), perceptron_index, result, pred);

    return pred;

}
void bp_perceptron_spec_update(Op* op) {}
void bp_perceptron_update(Op* op) {
    const uns proc_id = op->proc_id;
    auto& perceptron_state = perceptron_state_all_cores.at(proc_id);
    const Addr  addr      = op->oracle_info.pred_addr;
    const uns32 hist      = op->oracle_info.pred_global_hist;
    const uns8 actual     = op->oracle_info.dir;

    const uns32 perceptron_index = addr & ((1 << HIST_LENGTH) - 1);
    auto& weights = perceptron_state.perceptron_table[perceptron_index];

    std::vector<int> history(HIST_LENGTH);
    for (int i = 0; i < HIST_LENGTH; ++i) {
        history[i] = (hist & (1 << i)) ? 1 : -1;
    }

    int result = compute_dot_product(weights, history);
    int prediction = (result > 0) ? 1 : 0;

    if (prediction != actual || abs(result) < THETA){
        weights[0] += (actual ? 1 : -1);
        weights[0] = std::clamp(weights[0], MIN_WT, MAX_WT);

        for (int i = 0; i < HIST_LENGTH; ++i){
            weights[i + 1] += (actual ? history[i] : -history[i]);
            weights[i + 1] = std::clamp(weights[i + 1], MIN_WT, MAX_WT);
        }
    }

}
void bp_perceptron_retire(Op* op) {}
void bp_perceptron_recover(Recovery_Info*) {}
uns8 bp_perceptron_full(uns proc_id) { return 0; }