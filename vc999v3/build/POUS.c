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

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
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

  __IL_DEFVAR_T __IL_DEFVAR;
  __IL_DEFVAR_T __IL_DEFVAR_BACK;
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





void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_VAR(data__->TIMER,__time_to_timespec(1, 0, 4, 0, 0, 0),retain)
  __INIT_VAR(data__->TE,__time_to_timespec(1, 0, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->RESET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->V_PUMP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LID,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->VENT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BAR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEAL1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SEAL2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUMP_START,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PUMP_STOP,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->START_CYCLE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->FINISH_CYCLE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HOLD1I,__BOOL_LITERAL(FALSE),retain)
  TOF_init__(&data__->TOF0,retain);
  TOF_init__(&data__->TOF1,retain);
  TOF_init__(&data__->TOF2,retain);
  R_TRIG_init__(&data__->R_TRIG0,retain);
  R_TRIG_init__(&data__->R_TRIG1,retain);
  F_TRIG_init__(&data__->F_TRIG1,retain);
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,V_PUMP,,(__GET_VAR(data__->PUMP_STOP,) && (__GET_VAR(data__->PUMP_START,) || __GET_VAR(data__->V_PUMP,))));
  __SET_VAR(data__->,LID,,(!(__GET_VAR(data__->FINISH_CYCLE,)) && (__GET_VAR(data__->LID,) || __GET_VAR(data__->START_CYCLE,))));
  __SET_VAR(data__->,VENT,,(!(__GET_VAR(data__->FINISH_CYCLE,)) && (__GET_VAR(data__->LID,) || __GET_VAR(data__->START_CYCLE,))));
  __SET_VAR(data__->TOF2.,IN,,__GET_VAR(data__->START_CYCLE,));
  __SET_VAR(data__->TOF2.,PT,,__GET_VAR(data__->TIMER,));
  TOF_body__(&data__->TOF2);
  __SET_VAR(data__->,BAR,,__GET_VAR(data__->TOF2.Q,));
  __SET_VAR(data__->,TE,,__GET_VAR(data__->TOF2.ET,));
  __SET_VAR(data__->R_TRIG0.,CLK,,!(__GET_VAR(data__->BAR,)));
  R_TRIG_body__(&data__->R_TRIG0);
  __SET_VAR(data__->TOF0.,IN,,__GET_VAR(data__->R_TRIG0.Q,));
  __SET_VAR(data__->TOF0.,PT,,__GET_VAR(data__->TIMER,));
  TOF_body__(&data__->TOF0);
  __SET_VAR(data__->,SEAL1,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->,TE,,__GET_VAR(data__->TOF0.ET,));
  __SET_VAR(data__->R_TRIG1.,CLK,,!(__GET_VAR(data__->SEAL1,)));
  R_TRIG_body__(&data__->R_TRIG1);
  __SET_VAR(data__->TOF1.,IN,,__GET_VAR(data__->R_TRIG1.Q,));
  __SET_VAR(data__->TOF1.,PT,,__GET_VAR(data__->TIMER,));
  TOF_body__(&data__->TOF1);
  __SET_VAR(data__->,SEAL2,,__GET_VAR(data__->TOF1.Q,));
  __SET_VAR(data__->,TE,,__GET_VAR(data__->TOF1.ET,));
  __SET_VAR(data__->F_TRIG1.,CLK,,__GET_VAR(data__->SEAL2,));
  F_TRIG_body__(&data__->F_TRIG1);
  __SET_VAR(data__->,FINISH_CYCLE,,(__GET_VAR(data__->F_TRIG1.Q,) && __GET_VAR(data__->LID,)));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





void TP_WITH_RESET_init__(TP_WITH_RESET *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->IN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PT,__time_to_timespec(1, 0, 4, 0, 0, 0),retain)
  __INIT_VAR(data__->RESET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->Q,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ET,__time_to_timespec(1, 0, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->STATE,0,retain)
  __INIT_VAR(data__->PREV_IN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CURRENT_TIME,__time_to_timespec(1, 0, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->START_TIME,__time_to_timespec(1, 0, 0, 0, 0, 0),retain)
}

// Code part
void TP_WITH_RESET_body__(TP_WITH_RESET *data__) {
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
__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)
  #undef GetFbVar
  #undef SetFbVar
;
  if ((((__GET_VAR(data__->STATE,) == 0) && !(__GET_VAR(data__->PREV_IN,))) && __GET_VAR(data__->IN,))) {
    __SET_VAR(data__->,STATE,,1);
    __SET_VAR(data__->,Q,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,START_TIME,,__GET_VAR(data__->CURRENT_TIME,));
  } else if ((__GET_VAR(data__->STATE,) == 1)) {
    if (LE_TIME(__BOOL_LITERAL(TRUE), NULL, 2, __time_add(__GET_VAR(data__->START_TIME,), __GET_VAR(data__->PT,)), __GET_VAR(data__->CURRENT_TIME,))) {
      __SET_VAR(data__->,STATE,,2);
      __SET_VAR(data__->,Q,,__BOOL_LITERAL(FALSE));
      __SET_VAR(data__->,ET,,__GET_VAR(data__->PT,));
    } else {
      __SET_VAR(data__->,ET,,__time_sub(__GET_VAR(data__->CURRENT_TIME,), __GET_VAR(data__->START_TIME,)));
    };
  };
  if (((__GET_VAR(data__->STATE,) == 2) && !(__GET_VAR(data__->IN,)))) {
    __SET_VAR(data__->,ET,,__time_to_timespec(1, 0, 0, 0, 0, 0));
    __SET_VAR(data__->,STATE,,0);
  };
  if (__GET_VAR(data__->RESET,)) {
    __SET_VAR(data__->,ET,,__time_to_timespec(1, 0, 0, 0, 0, 0));
    __SET_VAR(data__->,STATE,,0);
    __SET_VAR(data__->,Q,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->,PREV_IN,,__GET_VAR(data__->IN,));

  goto __end;

__end:
  return;
} // TP_WITH_RESET_body__() 





