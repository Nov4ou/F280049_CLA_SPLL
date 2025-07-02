#ifndef SHARED_H
#define SHARED_H

#include "Solar_CLA.h"

#define GRID_FREQ 50
#define ISR_FREQUENCY 20000
#define PI 3.14159

extern float filterOut;
extern float filterIn;
extern SPLL_1ph_SOGI_CLA spll1;

__attribute__((interrupt)) void Cla1Task1(void);
__attribute__((interrupt)) void Cla1Task8(void);

#endif /* SHARED_H */
