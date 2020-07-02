#ifndef ASSOCIATIVE_MEMORY_H_
#define ASSOCIATIVE_MEMORY_H_

#include "init.h"

#ifdef HOST
#include "host_only.h"
#else
#include "global_dpu.h"
#endif

int associative_memory_32bit(uint32_t q_32[bit_dim + 1], uint32_t * aM_32);

#endif
