#ifndef __BIMODAL_H__
#define __BIMODAL_H__

#ifdef __cplusplus
extern "C"{
#endif

#include "bp/bp.h"

void bp_bimodal_init(void);
void bp_bimodal_timestamp(Op*);
uns8 bp_bimodal_pred(Op*);
void bp_bimodal_spec_update(Op*);
void bp_bimodal_update(Op*);
void bp_bimodal_retire(Op*);
void bp_bimodal_recover(Recovery_Info*);
uns8 bp_bimodal_full(uns);


#ifdef __cplusplus

}
#endif

#endif
