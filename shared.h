#ifndef SHARED_H
#define SHARED_H

#include "Solar_CLA.h"

extern float filterOut;
extern float filterIn;

__attribute__((interrupt)) void Cla1Task1(void);
__attribute__((interrupt)) void Cla1Task8(void);

#endif /* SHARED_H */
