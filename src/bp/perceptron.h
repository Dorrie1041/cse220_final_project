
#ifndef __PERCEPTRON_H__
#define __PERCEPTRON_H__

#ifdef __cplusplus
extern "C"{
#endif

#include "bp/bp.h"

/*************Interface to Scarab***************/
void bp_perceptron_init();
void bp_perceptron_timestamp(Op* op);
uns8 bp_perceptron_pred(Op*);
void bp_perceptron_spec_update(Op* op);
void bp_perceptron_update(Op* op);
void bp_perceptron_retire(Op* op);
void bp_perceptron_recover(Recovery_Info*);
uns8 bp_perceptron_full(uns proc_id);

#ifdef __cplusplus
}

#endif

#endif