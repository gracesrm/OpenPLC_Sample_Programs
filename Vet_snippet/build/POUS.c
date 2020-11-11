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





void UPDATE_PART_init__(UPDATE_PART *data__, BOOL retain) {
  __INIT_EXTERNAL(BOOL,UPDATE_COMPLETE,data__->UPDATE_COMPLETE,retain)
  __INIT_EXTERNAL(DWORD,PART_PROCESS,data__->PART_PROCESS,retain)
  __INIT_VAR(data__->RFID_IO_COMPLETE,__BOOL_LITERAL(FALSE),retain)
  TON_init__(&data__->IO_TIMER,retain);
}

// Code part
void UPDATE_PART_body__(UPDATE_PART *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->IO_TIMER.,IN,,!(__GET_EXTERNAL(data__->UPDATE_COMPLETE,)));
  __SET_VAR(data__->IO_TIMER.,PT,,DWORD_TO_TIME(
    (BOOL)__BOOL_LITERAL(TRUE),
    NULL,
    (DWORD)__GET_EXTERNAL(data__->PART_PROCESS,)));
  TON_body__(&data__->IO_TIMER);
  __SET_VAR(data__->,RFID_IO_COMPLETE,,__GET_VAR(data__->IO_TIMER.Q));
  if (__GET_VAR(data__->RFID_IO_COMPLETE,)) {
    __SET_EXTERNAL(data__->,UPDATE_COMPLETE,,__BOOL_LITERAL(TRUE));
  };

  goto __end;

__end:
  return;
} // UPDATE_PART_body__() 





void CELL1_init__(CELL1 *data__, BOOL retain) {
  __INIT_EXTERNAL(BOOL,UPDATE_COMPLETE,data__->UPDATE_COMPLETE,retain)
  __INIT_EXTERNAL(DWORD,PART_PROCESS,data__->PART_PROCESS,retain)
  __INIT_VAR(data__->PALLET_SENSOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PART_SENSOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CNC_PART_READY,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ROBOT_READY,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PART_ATCONVEYOR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->RETRACT_STOPPER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DELIVER_PART,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->PALLET_ARRIVAL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->UPDATE_PART_PROCESS,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void CELL1_body__(CELL1 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->,PALLET_ARRIVAL,,__BOOL_LITERAL(FALSE));
  __SET_VAR(data__->,RETRACT_STOPPER,,__BOOL_LITERAL(FALSE));
  __SET_VAR(data__->,DELIVER_PART,,__BOOL_LITERAL(FALSE));
  __SET_VAR(data__->,UPDATE_PART_PROCESS,,__BOOL_LITERAL(FALSE));
  if ((__GET_VAR(data__->PALLET_SENSOR,) && !(__GET_VAR(data__->PART_SENSOR,)))) {
    __SET_VAR(data__->,PALLET_ARRIVAL,,__BOOL_LITERAL(TRUE));
  };
  if (__GET_VAR(data__->PART_SENSOR,)) {
    __SET_VAR(data__->,RETRACT_STOPPER,,__BOOL_LITERAL(TRUE));
  };
  if ((((__GET_VAR(data__->PALLET_ARRIVAL,) && __GET_VAR(data__->CNC_PART_READY,)) && __GET_VAR(data__->ROBOT_READY,)) && !(__GET_VAR(data__->PART_ATCONVEYOR,)))) {
    __SET_VAR(data__->,DELIVER_PART,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,UPDATE_PART_PROCESS,,__BOOL_LITERAL(TRUE));
    __SET_VAR(data__->,CNC_PART_READY,,__BOOL_LITERAL(FALSE));
    __SET_VAR(data__->,ROBOT_READY,,__BOOL_LITERAL(FALSE));
  };
  if (__GET_VAR(data__->UPDATE_PART_PROCESS,)) {
    __SET_EXTERNAL(data__->,PART_PROCESS,,INT_TO_DWORD(
      (BOOL)__BOOL_LITERAL(TRUE),
      NULL,
      (INT)2));
  };
  if ((__GET_EXTERNAL(data__->UPDATE_COMPLETE,) && __GET_VAR(data__->PART_ATCONVEYOR,))) {
    __SET_VAR(data__->,RETRACT_STOPPER,,__BOOL_LITERAL(TRUE));
    __SET_EXTERNAL(data__->,UPDATE_COMPLETE,,__BOOL_LITERAL(FALSE));
  };

  goto __end;

__end:
  return;
} // CELL1_body__() 





