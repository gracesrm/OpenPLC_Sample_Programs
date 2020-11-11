void LOGGER_init__(LOGGER *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MSG,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->LEVEL,LOGLEVEL__INFO,retain)
  __INIT_VAR(data__->TRIG0,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void LOGGER_body__(LOGGER *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->TRIG,) && !(__GET_VAR(data__->TRIG0,)))) {
    #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
    #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)

   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  
    #undef GetFbVar
    #undef SetFbVar
;
  };
  __SET_VAR(data__->,TRIG0,,__GET_VAR(data__->TRIG,));

  goto __end;

__end:
  return;
} // LOGGER_body__() 





void PYTHON_EVAL_init__(PYTHON_EVAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_EVAL_body__(PYTHON_EVAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_EVAL_body__() 





void PYTHON_POLL_init__(PYTHON_POLL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->BUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->PREBUFFER,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->TRIGM1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TRIGGED,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_POLL_body__(PYTHON_POLL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  #define GetFbVar(var,...) __GET_VAR(data__->var,__VA_ARGS__)
  #define SetFbVar(var,val,...) __SET_VAR(data__->,var,__VA_ARGS__,val)
extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);
  #undef GetFbVar
  #undef SetFbVar
;

  goto __end;

__end:
  return;
} // PYTHON_POLL_body__() 





void PYTHON_GEAR_init__(PYTHON_GEAR *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->N,0,retain)
  __INIT_VAR(data__->TRIG,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CODE,__STRING_LITERAL(0,""),retain)
  __INIT_VAR(data__->ACK,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RESULT,__STRING_LITERAL(0,""),retain)
  PYTHON_EVAL_init__(&data__->PY_EVAL,retain);
  __INIT_VAR(data__->COUNTER,0,retain)
  __INIT_VAR(data__->ADD10_OUT,0,retain)
  __INIT_VAR(data__->EQ13_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEL15_OUT,0,retain)
  __INIT_VAR(data__->AND7_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void PYTHON_GEAR_body__(PYTHON_GEAR *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,ADD10_OUT,,ADD__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->COUNTER,),
    (UINT)1));
  __SET_VAR(data__->,EQ13_OUT,,EQ__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->N,),
    (UINT)__GET_VAR(data__->ADD10_OUT,)));
  __SET_VAR(data__->,SEL15_OUT,,SEL__UINT__BOOL__UINT__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (UINT)__GET_VAR(data__->ADD10_OUT,),
    (UINT)0));
  __SET_VAR(data__->,COUNTER,,__GET_VAR(data__->SEL15_OUT,));
  __SET_VAR(data__->,AND7_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->EQ13_OUT,),
    (BOOL)__GET_VAR(data__->TRIG,)));
  __SET_VAR(data__->PY_EVAL.,TRIG,,__GET_VAR(data__->AND7_OUT,));
  __SET_VAR(data__->PY_EVAL.,CODE,,__GET_VAR(data__->CODE,));
  PYTHON_EVAL_body__(&data__->PY_EVAL);
  __SET_VAR(data__->,ACK,,__GET_VAR(data__->PY_EVAL.ACK,));
  __SET_VAR(data__->,RESULT,,__GET_VAR(data__->PY_EVAL.RESULT,));

  goto __end;

__end:
  return;
} // PYTHON_GEAR_body__() 





void HYSTERESE2_init__(HYSTERESE2 *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->IN,0,retain)
  __INIT_VAR(data__->LOW,0,retain)
  __INIT_VAR(data__->HIGH,0,retain)
  __INIT_VAR(data__->OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void HYSTERESE2_body__(HYSTERESE2 *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  if ((__GET_VAR(data__->IN,) < __GET_VAR(data__->LOW,))) {
    __SET_VAR(data__->,OUT,,__BOOL_LITERAL(FALSE));
  } else if ((__GET_VAR(data__->IN,) > __GET_VAR(data__->HIGH,))) {
    __SET_VAR(data__->,OUT,,__BOOL_LITERAL(TRUE));
  };

  goto __end;

__end:
  return;
} // HYSTERESE2_body__() 





void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  HYSTERESE2_init__(&data__->HYSTERESE20,retain);
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  HYSTERESE2_body__(&data__->HYSTERESE20);

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





void TWO_STEPS_BURNER_PID_init__(TWO_STEPS_BURNER_PID *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->T_SET,0,retain)
  __INIT_VAR(data__->T_ACT,0,retain)
  __INIT_VAR(data__->XO,0.0,retain)
  __INIT_VAR(data__->KP,0,retain)
  __INIT_VAR(data__->TR,0,retain)
  __INIT_VAR(data__->TD,0,retain)
  __INIT_VAR(data__->CYCLE,__time_to_timespec(1, 0, 1, 0, 0, 0),retain)
  __INIT_VAR(data__->BURNER_ON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LEVEL_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LEVEL_2,__BOOL_LITERAL(FALSE),retain)
  PID_init__(&data__->PID0,retain);
  __INIT_VAR(data__->L_MIN,0,retain)
  __INIT_VAR(data__->L_MAX,1000,retain)
  HYSTERESE2_init__(&data__->HYSTERESE20,retain);
  HYSTERESE2_init__(&data__->HYSTERESE21,retain);
  __INIT_VAR(data__->LOW_ST1,450,retain)
  __INIT_VAR(data__->HIGH_ST1,500,retain)
  __INIT_VAR(data__->LOW_ST2,650,retain)
  __INIT_VAR(data__->HIGH_ST2,700,retain)
  __INIT_VAR(data__->REAL_TO_WORD11_OUT,0,retain)
  __INIT_VAR(data__->LIMIT10_OUT,0,retain)
  __INIT_VAR(data__->NOT22_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->AND20_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void TWO_STEPS_BURNER_PID_body__(TWO_STEPS_BURNER_PID *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,BURNER_ON,,__GET_VAR(data__->START,));
  __SET_VAR(data__->PID0.,AUTO,,__GET_VAR(data__->START,));
  __SET_VAR(data__->PID0.,PV,,__GET_VAR(data__->T_ACT,));
  __SET_VAR(data__->PID0.,SP,,__GET_VAR(data__->T_SET,));
  __SET_VAR(data__->PID0.,X0,,__GET_VAR(data__->XO,));
  __SET_VAR(data__->PID0.,KP,,__GET_VAR(data__->KP,));
  __SET_VAR(data__->PID0.,TR,,__GET_VAR(data__->TR,));
  __SET_VAR(data__->PID0.,TD,,__GET_VAR(data__->TD,));
  __SET_VAR(data__->PID0.,CYCLE,,__GET_VAR(data__->CYCLE,));
  PID_body__(&data__->PID0);
  __SET_VAR(data__->,REAL_TO_WORD11_OUT,,REAL_TO_WORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->PID0.XOUT,)));
  __SET_VAR(data__->,LIMIT10_OUT,,LIMIT__WORD__WORD__WORD__WORD(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (WORD)__GET_VAR(data__->L_MIN,),
    (WORD)__GET_VAR(data__->REAL_TO_WORD11_OUT,),
    (WORD)__GET_VAR(data__->L_MAX,)));
  __SET_VAR(data__->HYSTERESE20.,IN,,__GET_VAR(data__->LIMIT10_OUT,));
  __SET_VAR(data__->HYSTERESE20.,LOW,,__GET_VAR(data__->LOW_ST1,));
  __SET_VAR(data__->HYSTERESE20.,HIGH,,__GET_VAR(data__->HIGH_ST1,));
  HYSTERESE2_body__(&data__->HYSTERESE20);
  __SET_VAR(data__->HYSTERESE21.,IN,,__GET_VAR(data__->LIMIT10_OUT,));
  __SET_VAR(data__->HYSTERESE21.,LOW,,__GET_VAR(data__->LOW_ST2,));
  __SET_VAR(data__->HYSTERESE21.,HIGH,,__GET_VAR(data__->HIGH_ST2,));
  HYSTERESE2_body__(&data__->HYSTERESE21);
  __SET_VAR(data__->,NOT22_OUT,,!(__GET_VAR(data__->HYSTERESE21.OUT,)));
  __SET_VAR(data__->,AND20_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->HYSTERESE20.OUT,),
    (BOOL)__GET_VAR(data__->NOT22_OUT,)));
  __SET_VAR(data__->,LEVEL_1,,__GET_VAR(data__->AND20_OUT,));
  __SET_VAR(data__->,LEVEL_2,,__GET_VAR(data__->HYSTERESE21.OUT,));

  goto __end;

__end:
  return;
} // TWO_STEPS_BURNER_PID_body__() 





inline REAL __PT_CALC_MOVE__REAL__REAL1(BOOL EN,
  REAL IN,
  PT_CALC *data__)
{
  REAL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->MOVE74_ENO,);
  __res = MOVE__REAL__REAL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->MOVE74_ENO,,__TMP_ENO);
  return __res;
}

inline REAL __PT_CALC_MOVE__REAL__REAL2(BOOL EN,
  REAL IN,
  PT_CALC *data__)
{
  REAL __res;
  BOOL __TMP_ENO = __GET_VAR(data__->MOVE79_ENO,);
  __res = MOVE__REAL__REAL(EN,
    &__TMP_ENO,
    IN);
  __SET_VAR(,data__->MOVE79_ENO,,__TMP_ENO);
  return __res;
}

void PT_CALC_init__(PT_CALC *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->RTD,0,retain)
  __INIT_VAR(data__->R_0_GRAD,0,retain)
  __INIT_VAR(data__->R_0_NORM,0,retain)
  __INIT_VAR(data__->R_REF,0,retain)
  __INIT_VAR(data__->RATIO,0,retain)
  __INIT_VAR(data__->R_IST,0,retain)
  __INIT_VAR(data__->K_32768,32768.0,retain)
  __INIT_VAR(data__->A,3.9083E-03,retain)
  __INIT_VAR(data__->B,-5.7750E-07,retain)
  __INIT_VAR(data__->C,-4.1830E-12,retain)
  __INIT_VAR(data__->K_2,2.0,retain)
  __INIT_VAR(data__->K_3,3.0,retain)
  __INIT_VAR(data__->K_4,4.0,retain)
  __INIT_VAR(data__->K_5,5.0,retain)
  __INIT_VAR(data__->K_100,100.0,retain)
  __INIT_VAR(data__->K_MIN1,-1.0,retain)
  __INIT_VAR(data__->TEMP,0,retain)
  __INIT_VAR(data__->K_A_KL0,2.2228,retain)
  __INIT_VAR(data__->K_B_KL0,2.5859E-3,retain)
  __INIT_VAR(data__->K_C_KL0,4.8260E-6,retain)
  __INIT_VAR(data__->K_D_KL0,2.8183E-8,retain)
  __INIT_VAR(data__->K_E_KL0,1.5243E-10,retain)
  __INIT_VAR(data__->K_242_02,242.02,retain)
  __INIT_VAR(data__->DIV3_OUT,0,retain)
  __INIT_VAR(data__->MUL8_OUT,0,retain)
  __INIT_VAR(data__->DIV41_OUT,0,retain)
  __INIT_VAR(data__->MUL42_OUT,0,retain)
  __INIT_VAR(data__->GE78_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MUL29_OUT,0,retain)
  __INIT_VAR(data__->MUL30_OUT,0,retain)
  __INIT_VAR(data__->EXPT22_OUT,0,retain)
  __INIT_VAR(data__->EXPT19_OUT,0,retain)
  __INIT_VAR(data__->MUL12_OUT,0,retain)
  __INIT_VAR(data__->SUB11_OUT,0,retain)
  __INIT_VAR(data__->MUL13_OUT,0,retain)
  __INIT_VAR(data__->MUL15_OUT,0,retain)
  __INIT_VAR(data__->MUL16_OUT,0,retain)
  __INIT_VAR(data__->SUB25_OUT,0,retain)
  __INIT_VAR(data__->SQRT26_OUT,0,retain)
  __INIT_VAR(data__->ADD32_OUT,0,retain)
  __INIT_VAR(data__->MUL34_OUT,0,retain)
  __INIT_VAR(data__->MUL33_OUT,0,retain)
  __INIT_VAR(data__->DIV38_OUT,0,retain)
  __INIT_VAR(data__->MOVE74_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOVE74_OUT,0,retain)
  __INIT_VAR(data__->NOT81_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EXPT46_OUT,0,retain)
  __INIT_VAR(data__->MUL49_OUT,0,retain)
  __INIT_VAR(data__->EXPT50_OUT,0,retain)
  __INIT_VAR(data__->MUL54_OUT,0,retain)
  __INIT_VAR(data__->SUB55_OUT,0,retain)
  __INIT_VAR(data__->EXPT57_OUT,0,retain)
  __INIT_VAR(data__->MUL61_OUT,0,retain)
  __INIT_VAR(data__->SUB56_OUT,0,retain)
  __INIT_VAR(data__->EXPT62_OUT,0,retain)
  __INIT_VAR(data__->MUL66_OUT,0,retain)
  __INIT_VAR(data__->ADD67_OUT,0,retain)
  __INIT_VAR(data__->MUL72_OUT,0,retain)
  __INIT_VAR(data__->ADD68_OUT,0,retain)
  __INIT_VAR(data__->SUB69_OUT,0,retain)
  __INIT_VAR(data__->MOVE79_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOVE79_OUT,0,retain)
}

// Code part
void PT_CALC_body__(PT_CALC *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,DIV3_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->RTD,),
    (REAL)__GET_VAR(data__->K_32768,)));
  __SET_VAR(data__->,RATIO,,__GET_VAR(data__->DIV3_OUT,));
  __SET_VAR(data__->,MUL8_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->RATIO,),
    (REAL)__GET_VAR(data__->R_REF,)));
  __SET_VAR(data__->,R_IST,,__GET_VAR(data__->MUL8_OUT,));
  __SET_VAR(data__->,DIV41_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_IST,),
    (REAL)__GET_VAR(data__->R_0_GRAD,)));
  __SET_VAR(data__->,MUL42_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->DIV41_OUT,),
    (REAL)__GET_VAR(data__->K_100,)));
  __SET_VAR(data__->,R_0_NORM,,__GET_VAR(data__->MUL42_OUT,));
  __SET_VAR(data__->,GE78_OUT,,GE__BOOL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_100,)));
  __SET_VAR(data__->,MUL29_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->R_0_GRAD,),
    (REAL)__GET_VAR(data__->K_MIN1,)));
  __SET_VAR(data__->,MUL30_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->A,),
    (REAL)__GET_VAR(data__->MUL29_OUT,)));
  __SET_VAR(data__->,EXPT22_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->A,),
    (REAL)__GET_VAR(data__->K_2,)));
  __SET_VAR(data__->,EXPT19_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_GRAD,),
    (REAL)__GET_VAR(data__->K_2,)));
  __SET_VAR(data__->,MUL12_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->EXPT22_OUT,),
    (REAL)__GET_VAR(data__->EXPT19_OUT,)));
  __SET_VAR(data__->,SUB11_OUT,,SUB__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_GRAD,),
    (REAL)__GET_VAR(data__->R_IST,)));
  __SET_VAR(data__->,MUL13_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->SUB11_OUT,),
    (REAL)__GET_VAR(data__->B,)));
  __SET_VAR(data__->,MUL15_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->MUL13_OUT,),
    (REAL)__GET_VAR(data__->R_0_GRAD,)));
  __SET_VAR(data__->,MUL16_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->MUL15_OUT,),
    (REAL)__GET_VAR(data__->K_4,)));
  __SET_VAR(data__->,SUB25_OUT,,SUB__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->MUL12_OUT,),
    (REAL)__GET_VAR(data__->MUL16_OUT,)));
  __SET_VAR(data__->,SQRT26_OUT,,SQRT__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->SUB25_OUT,)));
  __SET_VAR(data__->,ADD32_OUT,,ADD__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->MUL30_OUT,),
    (REAL)__GET_VAR(data__->SQRT26_OUT,)));
  __SET_VAR(data__->,MUL34_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->R_0_GRAD,),
    (REAL)__GET_VAR(data__->K_2,)));
  __SET_VAR(data__->,MUL33_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->B,),
    (REAL)__GET_VAR(data__->MUL34_OUT,)));
  __SET_VAR(data__->,DIV38_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->ADD32_OUT,),
    (REAL)__GET_VAR(data__->MUL33_OUT,)));
  __SET_VAR(data__->,MOVE74_OUT,,__PT_CALC_MOVE__REAL__REAL1(
    (BOOL)__GET_VAR(data__->GE78_OUT,),
    (REAL)__GET_VAR(data__->DIV38_OUT,),
    data__));
  if (__GET_VAR(data__->MOVE74_ENO,)) {
    __SET_VAR(data__->,TEMP,,__GET_VAR(data__->MOVE74_OUT,));
  };
  __SET_VAR(data__->,NOT81_OUT,,!(__GET_VAR(data__->GE78_OUT,)));
  __SET_VAR(data__->,EXPT46_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_5,)));
  __SET_VAR(data__->,MUL49_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->EXPT46_OUT,),
    (REAL)__GET_VAR(data__->K_E_KL0,)));
  __SET_VAR(data__->,EXPT50_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_4,)));
  __SET_VAR(data__->,MUL54_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->EXPT50_OUT,),
    (REAL)__GET_VAR(data__->K_D_KL0,)));
  __SET_VAR(data__->,SUB55_OUT,,SUB__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->MUL49_OUT,),
    (REAL)__GET_VAR(data__->MUL54_OUT,)));
  __SET_VAR(data__->,EXPT57_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_3,)));
  __SET_VAR(data__->,MUL61_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->EXPT57_OUT,),
    (REAL)__GET_VAR(data__->K_C_KL0,)));
  __SET_VAR(data__->,SUB56_OUT,,SUB__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->SUB55_OUT,),
    (REAL)__GET_VAR(data__->MUL61_OUT,)));
  __SET_VAR(data__->,EXPT62_OUT,,EXPT__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_2,)));
  __SET_VAR(data__->,MUL66_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->EXPT62_OUT,),
    (REAL)__GET_VAR(data__->K_B_KL0,)));
  __SET_VAR(data__->,ADD67_OUT,,ADD__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->SUB56_OUT,),
    (REAL)__GET_VAR(data__->MUL66_OUT,)));
  __SET_VAR(data__->,MUL72_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->R_0_NORM,),
    (REAL)__GET_VAR(data__->K_A_KL0,)));
  __SET_VAR(data__->,ADD68_OUT,,ADD__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->ADD67_OUT,),
    (REAL)__GET_VAR(data__->MUL72_OUT,)));
  __SET_VAR(data__->,SUB69_OUT,,SUB__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->ADD68_OUT,),
    (REAL)__GET_VAR(data__->K_242_02,)));
  __SET_VAR(data__->,MOVE79_OUT,,__PT_CALC_MOVE__REAL__REAL2(
    (BOOL)__GET_VAR(data__->NOT81_OUT,),
    (REAL)__GET_VAR(data__->SUB69_OUT,),
    data__));
  if (__GET_VAR(data__->MOVE79_ENO,)) {
    __SET_VAR(data__->,TEMP,,__GET_VAR(data__->MOVE79_OUT,));
  };

  goto __end;

__end:
  return;
} // PT_CALC_body__() 





inline INT __WELL_PAK_STEU_ADD__INT__INT1(BOOL EN,
  UINT __PARAM_COUNT,
  INT IN1,
  INT IN2,
  WELL_PAK_STEU *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->ADD35_ENO,);
  __res = ADD__INT__INT(EN,
    &__TMP_ENO,
    __PARAM_COUNT,
    IN1,
    IN2);
  __SET_VAR(,data__->ADD35_ENO,,__TMP_ENO);
  return __res;
}

inline INT __WELL_PAK_STEU_SUB__INT__INT__INT2(BOOL EN,
  INT IN1,
  INT IN2,
  WELL_PAK_STEU *data__)
{
  INT __res;
  BOOL __TMP_ENO = __GET_VAR(data__->SUB11_ENO,);
  __res = SUB__INT__INT__INT(EN,
    &__TMP_ENO,
    IN1,
    IN2);
  __SET_VAR(,data__->SUB11_ENO,,__TMP_ENO);
  return __res;
}

void WELL_PAK_STEU_init__(WELL_PAK_STEU *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  TP_init__(&data__->TP0,retain);
  RS_init__(&data__->RS0,retain);
  F_TRIG_init__(&data__->F_TRIG0,retain);
  F_TRIG_init__(&data__->F_TRIG1,retain);
  __INIT_VAR(data__->SUMME,0,retain)
  __INIT_VAR(data__->K_100,100,retain)
  __INIT_VAR(data__->SSR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->K_T_02,__time_to_timespec(1, 20, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->PERCENT_POWER,0,retain)
  __INIT_VAR(data__->GE8_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ADD35_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ADD35_OUT,0,retain)
  __INIT_VAR(data__->AND38_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SUB11_ENO,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SUB11_OUT,0,retain)
}

// Code part
void WELL_PAK_STEU_body__(WELL_PAK_STEU *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,GE8_OUT,,GE__BOOL__INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (INT)__GET_VAR(data__->SUMME,),
    (INT)__GET_VAR(data__->K_100,)));
  __SET_VAR(data__->,SSR,,__GET_VAR(data__->GE8_OUT,));
  __SET_VAR(data__->F_TRIG0.,CLK,,__GET_VAR(data__->TP0.Q,));
  F_TRIG_body__(&data__->F_TRIG0);
  __SET_VAR(data__->RS0.,S,,__GET_VAR(data__->START,));
  __SET_VAR(data__->RS0.,R1,,__GET_VAR(data__->F_TRIG0.Q,));
  RS_body__(&data__->RS0);
  __SET_VAR(data__->TP0.,IN,,__GET_VAR(data__->RS0.Q1,));
  __SET_VAR(data__->TP0.,PT,,__GET_VAR(data__->K_T_02,));
  TP_body__(&data__->TP0);
  __SET_VAR(data__->F_TRIG1.,CLK,,__GET_VAR(data__->TP0.Q,));
  F_TRIG_body__(&data__->F_TRIG1);
  __SET_VAR(data__->,ADD35_OUT,,__WELL_PAK_STEU_ADD__INT__INT1(
    (BOOL)__GET_VAR(data__->F_TRIG1.Q,),
    (UINT)2,
    (INT)__GET_VAR(data__->SUMME,),
    (INT)__GET_VAR(data__->PERCENT_POWER,),
    data__));
  if (__GET_VAR(data__->ADD35_ENO,)) {
    __SET_VAR(data__->,SUMME,,__GET_VAR(data__->ADD35_OUT,));
  };
  __SET_VAR(data__->,AND38_OUT,,AND__BOOL__BOOL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (BOOL)__GET_VAR(data__->GE8_OUT,),
    (BOOL)__GET_VAR(data__->F_TRIG1.Q,)));
  __SET_VAR(data__->,SUB11_OUT,,__WELL_PAK_STEU_SUB__INT__INT__INT2(
    (BOOL)__GET_VAR(data__->AND38_OUT,),
    (INT)__GET_VAR(data__->SUMME,),
    (INT)__GET_VAR(data__->K_100,),
    data__));
  if (__GET_VAR(data__->SUB11_ENO,)) {
    __SET_VAR(data__->,SUMME,,__GET_VAR(data__->SUB11_OUT,));
  };

  goto __end;

__end:
  return;
} // WELL_PAK_STEU_body__() 





void ANALOG_IN_REALTEMP_OUT_init__(ANALOG_IN_REALTEMP_OUT *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->RES_IN,1023,retain)
  __INIT_VAR(data__->PT_RANGE,150,retain)
  __INIT_VAR(data__->MW_ACT,0,retain)
  __INIT_VAR(data__->MW_IST0,0,retain)
  __INIT_VAR(data__->WORD_TO_REAL8_OUT,0,retain)
  __INIT_VAR(data__->WORD_TO_REAL2_OUT,0,retain)
  __INIT_VAR(data__->WORD_TO_REAL3_OUT,0,retain)
  __INIT_VAR(data__->DIV1_OUT,0,retain)
  __INIT_VAR(data__->DIV6_OUT,0,retain)
}

// Code part
void ANALOG_IN_REALTEMP_OUT_body__(ANALOG_IN_REALTEMP_OUT *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,WORD_TO_REAL8_OUT,,WORD_TO_REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (WORD)__GET_VAR(data__->MW_ACT,)));
  __SET_VAR(data__->,WORD_TO_REAL2_OUT,,WORD_TO_REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (WORD)__GET_VAR(data__->RES_IN,)));
  __SET_VAR(data__->,WORD_TO_REAL3_OUT,,WORD_TO_REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (WORD)__GET_VAR(data__->PT_RANGE,)));
  __SET_VAR(data__->,DIV1_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->WORD_TO_REAL2_OUT,),
    (REAL)__GET_VAR(data__->WORD_TO_REAL3_OUT,)));
  __SET_VAR(data__->,DIV6_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->WORD_TO_REAL8_OUT,),
    (REAL)__GET_VAR(data__->DIV1_OUT,)));
  __SET_VAR(data__->,MW_IST0,,__GET_VAR(data__->DIV6_OUT,));

  goto __end;

__end:
  return;
} // ANALOG_IN_REALTEMP_OUT_body__() 





void RND_ANY_DECPT_init__(RND_ANY_DECPT *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->IN_REAL,0,retain)
  __INIT_VAR(data__->OUT_REAL_ROUNDED,0,retain)
  __INIT_VAR(data__->DEC_PT,0,retain)
  __INIT_VAR(data__->INT_TO_REAL5_OUT,0,retain)
  __INIT_VAR(data__->MUL11_OUT,0,retain)
  __INIT_VAR(data__->EXP3_OUT,0,retain)
  __INIT_VAR(data__->MUL2_OUT,0,retain)
  __INIT_VAR(data__->REAL_TO_INT6_OUT,0,retain)
  __INIT_VAR(data__->INT_TO_REAL7_OUT,0,retain)
  __INIT_VAR(data__->DIV8_OUT,0,retain)
}

// Code part
void RND_ANY_DECPT_body__(RND_ANY_DECPT *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  __SET_VAR(data__->,INT_TO_REAL5_OUT,,INT_TO_REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_VAR(data__->DEC_PT,)));
  __SET_VAR(data__->,MUL11_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)2.30258509299405,
    (REAL)__GET_VAR(data__->INT_TO_REAL5_OUT,)));
  __SET_VAR(data__->,EXP3_OUT,,EXP__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->MUL11_OUT,)));
  __SET_VAR(data__->,MUL2_OUT,,MUL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (REAL)__GET_VAR(data__->IN_REAL,),
    (REAL)__GET_VAR(data__->EXP3_OUT,)));
  __SET_VAR(data__->,REAL_TO_INT6_OUT,,REAL_TO_INT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->MUL2_OUT,)));
  __SET_VAR(data__->,INT_TO_REAL7_OUT,,INT_TO_REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (INT)__GET_VAR(data__->REAL_TO_INT6_OUT,)));
  __SET_VAR(data__->,DIV8_OUT,,DIV__REAL__REAL__REAL(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (REAL)__GET_VAR(data__->INT_TO_REAL7_OUT,),
    (REAL)__GET_VAR(data__->EXP3_OUT,)));
  __SET_VAR(data__->,OUT_REAL_ROUNDED,,__GET_VAR(data__->DIV8_OUT,));

  goto __end;

__end:
  return;
} // RND_ANY_DECPT_body__() 





