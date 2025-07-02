// #############################################################################
//
//  FILE:   empty_driverlib_main.c
//
//! \addtogroup driver_example_list
//! <h1>Empty Project Example</h1>
//!
//! This example is an empty project setup for Driverlib development.
//!
//
// #############################################################################
//
//
// $Copyright:
// Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
//   Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
//   Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the
//   distribution.
//
//   Neither the name of Texas Instruments Incorporated nor the names of
//   its contributors may be used to endorse or promote products derived
//   from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// $
// #############################################################################

//
// Included Files
//
#include "Solar_CLA.h"
#include "board.h"
#include "c2000ware_libraries.h"
#include "device.h"
#include "driverlib.h"

// NOTE: Graph buffers
#define ADC_BUF_LEN 500
float AdcBuf[ADC_BUF_LEN];  // ADC buffer allocation
float* AdcBufPtr = AdcBuf;
#define SPLL_BUF_LEN 500
float spllBuf[SPLL_BUF_LEN];  // ADC buffer allocation
static float* spllBufPtr = spllBuf;

#pragma DATA_SECTION(filterOut, "cla_shared");
float filterOut;

#pragma DATA_SECTION(filterIn, "cla_shared");
float filterIn;

#pragma DATA_SECTION(spll1, "cla_shared");
SPLL_1ph_SOGI_CLA spll1;

__interrupt void INT_myCPUTIMER0_ISR(void);

//
// Main
//
void main(void) {
  //
  // Initialize device clock and peripherals
  //
  Device_init();

  //
  // Disable pin locks and enable internal pull-ups.
  //
  Device_initGPIO();

  //
  // Initialize PIE and clear PIE registers. Disables CPU interrupts.
  //
  Interrupt_initModule();

  //
  // Initialize the PIE vector table with pointers to the shell Interrupt
  // Service Routines (ISR).
  //
  Interrupt_initVectorTable();

  //
  // PinMux and Peripheral Initialization
  //
  Board_init();

  //
  // C2000Ware Library initialization
  //
  C2000Ware_libraries_init();

  //
  // Enable Global Interrupt (INTM) and real time interrupt (DBGM)
  //
  EINT;
  ERTM;

  DEVICE_DELAY_US(500000);
  CLA_forceTasks(CLA1_BASE, CLA_TASKFLAG_8);

  while (1) {
  }
}

__interrupt void INT_myCPUTIMER0_ISR(void) {  
  Interrupt_clearACKGroup(INT_myCPUTIMER0_INTERRUPT_ACK_GROUP);
}

__interrupt void cla1Isr1(void) {
  // Clear interrupt flags.
  Interrupt_clearACKGroup(INT_myCLA01_INTERRUPT_ACK_GROUP);
  ADC_clearInterruptStatus(myADCA_BASE, ADC_INT_NUMBER1);

  *AdcBufPtr++ = filterOut;
  // Brute Force the circular buffer
  if (AdcBufPtr == (AdcBuf + ADC_BUF_LEN)) AdcBufPtr = AdcBuf;

  GPIO_togglePin(ZC_OUOT);
  *spllBufPtr++ = spll1.sin;
  // Brute Force the circular buffer
  if (spllBufPtr == (spllBuf + SPLL_BUF_LEN)) spllBufPtr = spllBuf;

  float duty3 = (spll1.u[0] + 1.0f) * 0.5f;  // [0,1]
  uint16_t cmpa3 = (uint16_t)(duty3 * 1249.0f + 0.5f);
  EPWM_setCounterCompareValue(myEPWM3_BASE, EPWM_COUNTER_COMPARE_A, cmpa3);

  float duty2 = (spll1.sin + 1.0f) * 0.5f;  // [0,1]
  uint16_t cmpa2 = (uint16_t)(duty2 * 1249.0f + 0.5f);
  EPWM_setCounterCompareValue(myEPWM2_BASE, EPWM_COUNTER_COMPARE_A, cmpa2);
}

//
// End of File
//
