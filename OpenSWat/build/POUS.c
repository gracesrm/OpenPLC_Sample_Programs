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





void OPENSWAT_init__(OPENSWAT *data__, BOOL retain) {
  __INIT_VAR(data__->USENSOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SW,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PB,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT14,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT16,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT17,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT18,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT19,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT20,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT21,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT22,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT23,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT24,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT25,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT26,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT27,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT28,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT29,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT30,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT31,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT32,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SINPUT33,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->TEMPSENSOR1,0,retain)
  __INIT_VAR(data__->TEMPSENSOR2,0,retain)
  __INIT_VAR(data__->LED1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED14,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED16,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED17,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED18,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED19,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED20,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED21,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED22,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LED23,__BOOL_LITERAL(FALSE),retain)
  TOF_init__(&data__->TOF0,retain);
  TOF_init__(&data__->TOF1,retain);
  TOF_init__(&data__->TOF11,retain);
  TOF_init__(&data__->TOF2,retain);
  TOF_init__(&data__->TOF3,retain);
  TOF_init__(&data__->TOF5,retain);
  TOF_init__(&data__->TOF6,retain);
  TOF_init__(&data__->TOF7,retain);
  TOF_init__(&data__->TOF4,retain);
  TOF_init__(&data__->TOF9,retain);
  TOF_init__(&data__->TOF10,retain);
  TOF_init__(&data__->TOF8,retain);
  __INIT_VAR(data__->GE75_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LE99_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LT111_OUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->GE82_OUT,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void OPENSWAT_body__(OPENSWAT *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TOF0.,IN,,(__GET_VAR(data__->SINPUT1,) && __GET_VAR(data__->SW,)));
  __SET_VAR(data__->TOF0.,PT,,__time_to_timespec(1, 25, 0, 0, 0, 0));
  TOF_body__(&data__->TOF0);
  __SET_VAR(data__->,LED1,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->TOF1.,IN,,((__GET_VAR(data__->SINPUT4,) && __GET_VAR(data__->SINPUT2,)) || __GET_VAR(data__->PB,)));
  __SET_VAR(data__->TOF1.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF1);
  __SET_VAR(data__->,LED2,,__GET_VAR(data__->TOF1.Q,));
  __SET_VAR(data__->TOF11.,IN,,(__GET_VAR(data__->SINPUT5,) && __GET_VAR(data__->SINPUT3,)));
  __SET_VAR(data__->TOF11.,PT,,__time_to_timespec(1, 15, 0, 0, 0, 0));
  TOF_body__(&data__->TOF11);
  __SET_VAR(data__->,LED3,,__GET_VAR(data__->TOF11.Q,));
  __SET_VAR(data__->TOF5.,IN,,(__GET_VAR(data__->SINPUT8,) && __GET_VAR(data__->SINPUT6,)));
  __SET_VAR(data__->TOF5.,PT,,__time_to_timespec(1, 30, 0, 0, 0, 0));
  TOF_body__(&data__->TOF5);
  __SET_VAR(data__->,LED4,,__GET_VAR(data__->TOF5.Q,));
  __SET_VAR(data__->TOF6.,IN,,(__GET_VAR(data__->SINPUT9,) && __GET_VAR(data__->SINPUT7,)));
  __SET_VAR(data__->TOF6.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF6);
  __SET_VAR(data__->,LED5,,__GET_VAR(data__->TOF6.Q,));
  __SET_VAR(data__->TOF7.,IN,,__GET_VAR(data__->SINPUT10,));
  __SET_VAR(data__->TOF7.,PT,,__time_to_timespec(1, 20, 0, 0, 0, 0));
  TOF_body__(&data__->TOF7);
  __SET_VAR(data__->,LED6,,__GET_VAR(data__->TOF7.Q,));
  __SET_VAR(data__->TOF4.,IN,,(__GET_VAR(data__->SINPUT32,) && __GET_VAR(data__->SINPUT30,)));
  __SET_VAR(data__->TOF4.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF4);
  __SET_VAR(data__->,LED7,,__GET_VAR(data__->TOF4.Q,));
  __SET_VAR(data__->TOF9.,IN,,(__GET_VAR(data__->SINPUT31,) && __GET_VAR(data__->SINPUT11,)));
  __SET_VAR(data__->TOF9.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF9);
  __SET_VAR(data__->,LED8,,__GET_VAR(data__->TOF9.Q,));
  __SET_VAR(data__->TOF10.,IN,,__GET_VAR(data__->SINPUT12,));
  __SET_VAR(data__->TOF10.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF10);
  __SET_VAR(data__->,LED9,,__GET_VAR(data__->TOF10.Q,));
  __SET_VAR(data__->TOF8.,IN,,__GET_VAR(data__->SINPUT33,));
  __SET_VAR(data__->TOF8.,PT,,__time_to_timespec(1, 10, 0, 0, 0, 0));
  TOF_body__(&data__->TOF8);
  __SET_VAR(data__->,LED10,,__GET_VAR(data__->TOF8.Q,));
  __SET_VAR(data__->,LED11,,(__GET_VAR(data__->SINPUT13,) || __GET_VAR(data__->SINPUT14,)));
  __SET_VAR(data__->,LED12,,__GET_VAR(data__->SINPUT15,));
  __SET_VAR(data__->,LED13,,__GET_VAR(data__->SINPUT16,));
  __SET_VAR(data__->,LED14,,__GET_VAR(data__->SINPUT17,));
  __SET_VAR(data__->,LED15,,__GET_VAR(data__->SINPUT18,));
  __SET_VAR(data__->,LED16,,__GET_VAR(data__->SINPUT19,));
  __SET_VAR(data__->,LED17,,__GET_VAR(data__->SINPUT20,));
  __SET_VAR(data__->,LED18,,__GET_VAR(data__->SINPUT21,));
  __SET_VAR(data__->,LED19,,__GET_VAR(data__->SINPUT22,));
  __SET_VAR(data__->,LED20,,__GET_VAR(data__->SINPUT23,));
  __SET_VAR(data__->,LED21,,((__GET_VAR(data__->SINPUT26,) && __GET_VAR(data__->SINPUT24,)) || (__GET_VAR(data__->USENSOR,) && __GET_VAR(data__->SW,))));
  __SET_VAR(data__->,GE75_OUT,,GE__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->TEMPSENSOR1,),
    (UINT)22706));
  __SET_VAR(data__->,LE99_OUT,,LE__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->TEMPSENSOR1,),
    (UINT)22706));
  __SET_VAR(data__->TOF2.,IN,,((!(__GET_VAR(data__->SINPUT27,)) && __GET_VAR(data__->SW,)) && __GET_VAR(data__->LE99_OUT,)));
  __SET_VAR(data__->TOF2.,PT,,__time_to_timespec(1, 100, 0, 0, 0, 0));
  TOF_body__(&data__->TOF2);
  __SET_VAR(data__->,LED22,,(((__GET_VAR(data__->SINPUT25,) && __GET_VAR(data__->SW,)) && __GET_VAR(data__->GE75_OUT,)) || __GET_VAR(data__->TOF2.Q,)));
  __SET_VAR(data__->,LT111_OUT,,LT__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->TEMPSENSOR2,),
    (UINT)22706));
  __SET_VAR(data__->,GE82_OUT,,GE__BOOL__UINT(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (UINT)2,
    (UINT)__GET_VAR(data__->TEMPSENSOR2,),
    (UINT)22706));
  __SET_VAR(data__->TOF3.,IN,,((__GET_VAR(data__->SINPUT28,) && __GET_VAR(data__->SW,)) && __GET_VAR(data__->GE82_OUT,)));
  __SET_VAR(data__->TOF3.,PT,,__time_to_timespec(1, 100, 0, 0, 0, 0));
  TOF_body__(&data__->TOF3);
  __SET_VAR(data__->,LED23,,(((__GET_VAR(data__->SINPUT29,) && __GET_VAR(data__->SW,)) && __GET_VAR(data__->LT111_OUT,)) || __GET_VAR(data__->TOF3.Q,)));

  goto __end;

__end:
  return;
} // OPENSWAT_body__() 





