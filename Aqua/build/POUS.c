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





void URGENCE_init__(URGENCE *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ST12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST14,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DEPART,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->URGENCES,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DRAINAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_1,__BOOL_LITERAL(FALSE),retain)
  UINT i;
  data__->__nb_steps = 4;
  static const STEP temp_step = {{0, 0}, 0, {0, 0}};
  for(i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i] = temp_step;
  }
  __SET_VAR(data__->,__step_list[0].X,,1);
  data__->__nb_actions = 4;
  static const ACTION temp_action = {0, {0, 0}, 0, 0, {0, 0}, {0, 0}};
  for(i = 0; i < data__->__nb_actions; i++) {
    data__->__action_list[i] = temp_action;
  }
  data__->__nb_transitions = 4;
  data__->__lasttick_time = __CURRENT_TIME;
}

// Steps definitions
#define S13 __step_list[0]
#define __SFC_S13 0
#define S14 __step_list[1]
#define __SFC_S14 1
#define S15 __step_list[2]
#define __SFC_S15 2
#define S16 __step_list[3]
#define __SFC_S16 3

// Actions definitions
#define __SFC_ST12 0
#define __SFC_ST13 1
#define __SFC_ST14 2
#define __SFC_ST15 3

// Code part
void URGENCE_body__(URGENCE *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  INT i;
  TIME elapsed_time, current_time;

  // Calculate elapsed_time
  current_time = __CURRENT_TIME;
  elapsed_time = __time_sub(current_time, data__->__lasttick_time);
  data__->__lasttick_time = current_time;
  // Transitions initialization
  if (__DEBUG) {
    for (i = 0; i < data__->__nb_transitions; i++) {
      data__->__transition_list[i] = data__->__debug_transition_list[i];
    }
  }
  // Steps initialization
  for (i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i].prev_state = __GET_VAR(data__->__step_list[i].X);
    if (__GET_VAR(data__->__step_list[i].X)) {
      data__->__step_list[i].T.value = __time_add(data__->__step_list[i].T.value, elapsed_time);
    }
  }
  // Actions initialization
  for (i = 0; i < data__->__nb_actions; i++) {
    __SET_VAR(data__->,__action_list[i].state,,0);
    data__->__action_list[i].set = 0;
    data__->__action_list[i].reset = 0;
    if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].set_remaining_time = __time_sub(data__->__action_list[i].set_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].set = 1;
      }
    }
    if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].reset_remaining_time = __time_sub(data__->__action_list[i].reset_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].reset = 1;
      }
    }
  }

  // Transitions fire test
  if (__GET_VAR(data__->S13.X)) {
    __SET_VAR(data__->,__transition_list[0],,(__GET_VAR(data__->DEPART,) && !(__GET_VAR(data__->URGENCES,))));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,__GET_VAR(data__->__transition_list[0]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,(__GET_VAR(data__->DEPART,) && !(__GET_VAR(data__->URGENCES,))));
    }
    __SET_VAR(data__->,__transition_list[0],,0);
  }
  if (__GET_VAR(data__->S14.X)) {
    __SET_VAR(data__->,__transition_list[1],,__GET_VAR(data__->M_DRAINAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,__GET_VAR(data__->__transition_list[1]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,__GET_VAR(data__->M_DRAINAGE,));
    }
    __SET_VAR(data__->,__transition_list[1],,0);
  }
  if (__GET_VAR(data__->S15.X)) {
    __SET_VAR(data__->,__transition_list[2],,__GET_VAR(data__->URGENCES,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->__transition_list[2]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->URGENCES,));
    }
    __SET_VAR(data__->,__transition_list[2],,0);
  }
  if (__GET_VAR(data__->S16.X)) {
    __SET_VAR(data__->,__transition_list[3],,__GET_VAR(data__->M_STEP_1,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->__transition_list[3]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->M_STEP_1,));
    }
    __SET_VAR(data__->,__transition_list[3],,0);
  }

  // Transitions reset steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,S13.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,S14.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,S15.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,S16.X,,0);
  }

  // Transitions set steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,S14.X,,1);
    data__->S14.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,S15.X,,1);
    data__->S15.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,S16.X,,1);
    data__->S16.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,S13.X,,1);
    data__->S13.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }

  // Steps association
  // S13 action associations
  {
    char active = __GET_VAR(data__->S13.X);
    char activated = active && !data__->S13.prev_state;
    char desactivated = !active && data__->S13.prev_state;

    if (active)       {__SET_VAR(data__->,ST12,,1);};
    if (desactivated) {__SET_VAR(data__->,ST12,,0);};

  }

  // S14 action associations
  {
    char active = __GET_VAR(data__->S14.X);
    char activated = active && !data__->S14.prev_state;
    char desactivated = !active && data__->S14.prev_state;

    if (active)       {__SET_VAR(data__->,ST13,,1);};
    if (desactivated) {__SET_VAR(data__->,ST13,,0);};

  }

  // S15 action associations
  {
    char active = __GET_VAR(data__->S15.X);
    char activated = active && !data__->S15.prev_state;
    char desactivated = !active && data__->S15.prev_state;

    if (active)       {__SET_VAR(data__->,ST14,,1);};
    if (desactivated) {__SET_VAR(data__->,ST14,,0);};

  }

  // S16 action associations
  {
    char active = __GET_VAR(data__->S16.X);
    char activated = active && !data__->S16.prev_state;
    char desactivated = !active && data__->S16.prev_state;

    if (active)       {__SET_VAR(data__->,ST15,,1);};
    if (desactivated) {__SET_VAR(data__->,ST15,,0);};

  }


  // Actions state evaluation
  for (i = 0; i < data__->__nb_actions; i++) {
    if (data__->__action_list[i].set) {
      data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 1;
    }
    if (data__->__action_list[i].reset) {
      data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 0;
    }
    __SET_VAR(data__->,__action_list[i].state,,__GET_VAR(data__->__action_list[i].state) | data__->__action_list[i].stored);
  }

  // Actions execution
  if (data__->__action_list[__SFC_ST12].reset) {
    __SET_VAR(data__->,ST12,,0);
  }
  else if (data__->__action_list[__SFC_ST12].set) {
    __SET_VAR(data__->,ST12,,1);
  }
  if (data__->__action_list[__SFC_ST13].reset) {
    __SET_VAR(data__->,ST13,,0);
  }
  else if (data__->__action_list[__SFC_ST13].set) {
    __SET_VAR(data__->,ST13,,1);
  }
  if (data__->__action_list[__SFC_ST14].reset) {
    __SET_VAR(data__->,ST14,,0);
  }
  else if (data__->__action_list[__SFC_ST14].set) {
    __SET_VAR(data__->,ST14,,1);
  }
  if (data__->__action_list[__SFC_ST15].reset) {
    __SET_VAR(data__->,ST15,,0);
  }
  else if (data__->__action_list[__SFC_ST15].set) {
    __SET_VAR(data__->,ST15,,1);
  }


  goto __end;

__end:
  return;
} // URGENCE_body__() 

// Steps undefinitions
#undef S13
#undef __SFC_S13
#undef S14
#undef __SFC_S14
#undef S15
#undef __SFC_S15
#undef S16
#undef __SFC_S16

// Actions undefinitions
#undef __SFC_ST12
#undef __SFC_ST13
#undef __SFC_ST14
#undef __SFC_ST15





void PRINCIPAL_init__(PRINCIPAL *data__, BOOL retain) {
  __INIT_VAR(data__->EN,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ENO,__BOOL_LITERAL(TRUE),retain)
  __INIT_VAR(data__->ST1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST16,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST17,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->ST18,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_LAVAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_RINSE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_HOT_RINSE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_P_SAVON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_P_ASSAIN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DRAINAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DELAI_VIDANGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_FLOTTE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DEPART,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->WATER_SAVER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CYCLE_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->URGENCEZ,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BOOSTER_READY,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HEATER,__BOOL_LITERAL(FALSE),retain)
  UINT i;
  data__->__nb_steps = 14;
  static const STEP temp_step = {{0, 0}, 0, {0, 0}};
  for(i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i] = temp_step;
  }
  __SET_VAR(data__->,__step_list[0].X,,1);
  data__->__nb_actions = 14;
  static const ACTION temp_action = {0, {0, 0}, 0, 0, {0, 0}, {0, 0}};
  for(i = 0; i < data__->__nb_actions; i++) {
    data__->__action_list[i] = temp_action;
  }
  data__->__nb_transitions = 17;
  data__->__lasttick_time = __CURRENT_TIME;
}

// Steps definitions
#define S1 __step_list[0]
#define __SFC_S1 0
#define S2 __step_list[1]
#define __SFC_S2 1
#define S3 __step_list[2]
#define __SFC_S3 2
#define S4 __step_list[3]
#define __SFC_S4 3
#define S5 __step_list[4]
#define __SFC_S5 4
#define S6 __step_list[5]
#define __SFC_S6 5
#define S7 __step_list[6]
#define __SFC_S7 6
#define S8 __step_list[7]
#define __SFC_S8 7
#define S9 __step_list[8]
#define __SFC_S9 8
#define S10 __step_list[9]
#define __SFC_S10 9
#define S11 __step_list[10]
#define __SFC_S11 10
#define S16 __step_list[11]
#define __SFC_S16 11
#define S17 __step_list[12]
#define __SFC_S17 12
#define S18 __step_list[13]
#define __SFC_S18 13

// Actions definitions
#define __SFC_ST1 0
#define __SFC_ST2 1
#define __SFC_ST3 2
#define __SFC_ST4 3
#define __SFC_ST5 4
#define __SFC_ST6 5
#define __SFC_ST7 6
#define __SFC_ST8 7
#define __SFC_ST9 8
#define __SFC_ST10 9
#define __SFC_ST11 10
#define __SFC_ST16 11
#define __SFC_ST17 12
#define __SFC_ST18 13

// Code part
void PRINCIPAL_body__(PRINCIPAL *data__) {
  // Control execution
  if (!__GET_VAR(data__->EN)) {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(FALSE));
    return;
  }
  else {
    __SET_VAR(data__->,ENO,,__BOOL_LITERAL(TRUE));
  }
  // Initialise TEMP variables

  INT i;
  TIME elapsed_time, current_time;

  // Calculate elapsed_time
  current_time = __CURRENT_TIME;
  elapsed_time = __time_sub(current_time, data__->__lasttick_time);
  data__->__lasttick_time = current_time;
  // Transitions initialization
  if (__DEBUG) {
    for (i = 0; i < data__->__nb_transitions; i++) {
      data__->__transition_list[i] = data__->__debug_transition_list[i];
    }
  }
  // Steps initialization
  for (i = 0; i < data__->__nb_steps; i++) {
    data__->__step_list[i].prev_state = __GET_VAR(data__->__step_list[i].X);
    if (__GET_VAR(data__->__step_list[i].X)) {
      data__->__step_list[i].T.value = __time_add(data__->__step_list[i].T.value, elapsed_time);
    }
  }
  // Actions initialization
  for (i = 0; i < data__->__nb_actions; i++) {
    __SET_VAR(data__->,__action_list[i].state,,0);
    data__->__action_list[i].set = 0;
    data__->__action_list[i].reset = 0;
    if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].set_remaining_time = __time_sub(data__->__action_list[i].set_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].set_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].set = 1;
      }
    }
    if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) > 0) {
      data__->__action_list[i].reset_remaining_time = __time_sub(data__->__action_list[i].reset_remaining_time, elapsed_time);
      if (__time_cmp(data__->__action_list[i].reset_remaining_time, __time_to_timespec(1, 0, 0, 0, 0, 0)) <= 0) {
        data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
        data__->__action_list[i].reset = 1;
      }
    }
  }

  // Transitions fire test
  if (__GET_VAR(data__->S1.X)) {
    __SET_VAR(data__->,__transition_list[0],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->URGENCEZ,)) && __GET_VAR(data__->DEPART,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,__GET_VAR(data__->__transition_list[0]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[0],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->URGENCEZ,)) && __GET_VAR(data__->DEPART,)));
    }
    __SET_VAR(data__->,__transition_list[0],,0);
  }
  if (__GET_VAR(data__->S2.X)) {
    __SET_VAR(data__->,__transition_list[1],,(__GET_VAR(data__->M_P_SAVON,) && __GET_VAR(data__->M_FLOTTE,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,__GET_VAR(data__->__transition_list[1]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[1],,(__GET_VAR(data__->M_P_SAVON,) && __GET_VAR(data__->M_FLOTTE,)));
    }
    __SET_VAR(data__->,__transition_list[1],,0);
  }
  if (__GET_VAR(data__->S3.X)) {
    __SET_VAR(data__->,__transition_list[2],,__GET_VAR(data__->M_LAVAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->__transition_list[2]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[2],,__GET_VAR(data__->M_LAVAGE,));
    }
    __SET_VAR(data__->,__transition_list[2],,0);
  }
  if (__GET_VAR(data__->S4.X)) {
    __SET_VAR(data__->,__transition_list[3],,__GET_VAR(data__->M_DRAINAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->__transition_list[3]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[3],,__GET_VAR(data__->M_DRAINAGE,));
    }
    __SET_VAR(data__->,__transition_list[3],,0);
  }
  if (__GET_VAR(data__->S5.X)) {
    __SET_VAR(data__->,__transition_list[4],,(__GET_VAR(data__->M_P_ASSAIN,) && __GET_VAR(data__->M_FLOTTE,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[4],,__GET_VAR(data__->__transition_list[4]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[4],,(__GET_VAR(data__->M_P_ASSAIN,) && __GET_VAR(data__->M_FLOTTE,)));
    }
    __SET_VAR(data__->,__transition_list[4],,0);
  }
  if (__GET_VAR(data__->S6.X)) {
    __SET_VAR(data__->,__transition_list[5],,__GET_VAR(data__->M_RINSE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[5],,__GET_VAR(data__->__transition_list[5]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[5],,__GET_VAR(data__->M_RINSE,));
    }
    __SET_VAR(data__->,__transition_list[5],,0);
  }
  if (__GET_VAR(data__->S7.X)) {
    __SET_VAR(data__->,__transition_list[6],,((!(__GET_VAR(data__->BOOSTER_READY,)) || !(__GET_VAR(data__->HEATER,))) && __GET_VAR(data__->M_DRAINAGE,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[6],,__GET_VAR(data__->__transition_list[6]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[6],,((!(__GET_VAR(data__->BOOSTER_READY,)) || !(__GET_VAR(data__->HEATER,))) && __GET_VAR(data__->M_DRAINAGE,)));
    }
    __SET_VAR(data__->,__transition_list[6],,0);
  }
  if (__GET_VAR(data__->S8.X)) {
    __SET_VAR(data__->,__transition_list[7],,__GET_VAR(data__->M_FLOTTE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[7],,__GET_VAR(data__->__transition_list[7]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[7],,__GET_VAR(data__->M_FLOTTE,));
    }
    __SET_VAR(data__->,__transition_list[7],,0);
  }
  if (__GET_VAR(data__->S9.X)) {
    __SET_VAR(data__->,__transition_list[8],,__GET_VAR(data__->M_HOT_RINSE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[8],,__GET_VAR(data__->__transition_list[8]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[8],,__GET_VAR(data__->M_HOT_RINSE,));
    }
    __SET_VAR(data__->,__transition_list[8],,0);
  }
  if (__GET_VAR(data__->S10.X)) {
    __SET_VAR(data__->,__transition_list[9],,((!(__GET_VAR(data__->CYCLE_3,)) && __GET_VAR(data__->WATER_SAVER,)) && __GET_VAR(data__->DEPART,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[9],,__GET_VAR(data__->__transition_list[9]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[9],,((!(__GET_VAR(data__->CYCLE_3,)) && __GET_VAR(data__->WATER_SAVER,)) && __GET_VAR(data__->DEPART,)));
    }
    __SET_VAR(data__->,__transition_list[9],,0);
  }
  if (__GET_VAR(data__->S10.X)) {
    __SET_VAR(data__->,__transition_list[10],,(__GET_VAR(data__->M_DELAI_VIDANGE,) || !(__GET_VAR(data__->WATER_SAVER,))));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[10],,__GET_VAR(data__->__transition_list[10]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[10],,(__GET_VAR(data__->M_DELAI_VIDANGE,) || !(__GET_VAR(data__->WATER_SAVER,))));
    }
    __SET_VAR(data__->,__transition_list[10],,0);
  }
  if (__GET_VAR(data__->S11.X)) {
    __SET_VAR(data__->,__transition_list[11],,__GET_VAR(data__->M_DRAINAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[11],,__GET_VAR(data__->__transition_list[11]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[11],,__GET_VAR(data__->M_DRAINAGE,));
    }
    __SET_VAR(data__->,__transition_list[11],,0);
  }
  if (__GET_VAR(data__->S10.X)) {
    __SET_VAR(data__->,__transition_list[12],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->WATER_SAVER,)) && __GET_VAR(data__->DEPART,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[12],,__GET_VAR(data__->__transition_list[12]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[12],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->WATER_SAVER,)) && __GET_VAR(data__->DEPART,)));
    }
    __SET_VAR(data__->,__transition_list[12],,0);
  }
  if (__GET_VAR(data__->S16.X)) {
    __SET_VAR(data__->,__transition_list[13],,(__GET_VAR(data__->M_P_SAVON,) && __GET_VAR(data__->M_FLOTTE,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[13],,__GET_VAR(data__->__transition_list[13]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[13],,(__GET_VAR(data__->M_P_SAVON,) && __GET_VAR(data__->M_FLOTTE,)));
    }
    __SET_VAR(data__->,__transition_list[13],,0);
  }
  if (__GET_VAR(data__->S17.X)) {
    __SET_VAR(data__->,__transition_list[14],,__GET_VAR(data__->M_LAVAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[14],,__GET_VAR(data__->__transition_list[14]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[14],,__GET_VAR(data__->M_LAVAGE,));
    }
    __SET_VAR(data__->,__transition_list[14],,0);
  }
  if (__GET_VAR(data__->S18.X)) {
    __SET_VAR(data__->,__transition_list[15],,__GET_VAR(data__->M_DRAINAGE,));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[15],,__GET_VAR(data__->__transition_list[15]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[15],,__GET_VAR(data__->M_DRAINAGE,));
    }
    __SET_VAR(data__->,__transition_list[15],,0);
  }
  if (__GET_VAR(data__->S1.X)) {
    __SET_VAR(data__->,__transition_list[16],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->URGENCEZ,)) && __GET_VAR(data__->DEPART,)));
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[16],,__GET_VAR(data__->__transition_list[16]));
    }
  }
  else {
    if (__DEBUG) {
      __SET_VAR(data__->,__debug_transition_list[16],,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->URGENCEZ,)) && __GET_VAR(data__->DEPART,)));
    }
    __SET_VAR(data__->,__transition_list[16],,0);
  }

  // Transitions reset steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,S1.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,S2.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,S3.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,S4.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[4])) {
    __SET_VAR(data__->,S5.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[5])) {
    __SET_VAR(data__->,S6.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[6])) {
    __SET_VAR(data__->,S7.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[7])) {
    __SET_VAR(data__->,S8.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[8])) {
    __SET_VAR(data__->,S9.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[9])) {
    __SET_VAR(data__->,S10.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[10])) {
    __SET_VAR(data__->,S10.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[11])) {
    __SET_VAR(data__->,S11.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[12])) {
    __SET_VAR(data__->,S10.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[13])) {
    __SET_VAR(data__->,S16.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[14])) {
    __SET_VAR(data__->,S17.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[15])) {
    __SET_VAR(data__->,S18.X,,0);
  }
  if (__GET_VAR(data__->__transition_list[16])) {
    __SET_VAR(data__->,S1.X,,0);
  }

  // Transitions set steps
  if (__GET_VAR(data__->__transition_list[0])) {
    __SET_VAR(data__->,S2.X,,1);
    data__->S2.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[1])) {
    __SET_VAR(data__->,S3.X,,1);
    data__->S3.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[2])) {
    __SET_VAR(data__->,S4.X,,1);
    data__->S4.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[3])) {
    __SET_VAR(data__->,S5.X,,1);
    data__->S5.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[4])) {
    __SET_VAR(data__->,S6.X,,1);
    data__->S6.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[5])) {
    __SET_VAR(data__->,S7.X,,1);
    data__->S7.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[6])) {
    __SET_VAR(data__->,S8.X,,1);
    data__->S8.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[7])) {
    __SET_VAR(data__->,S9.X,,1);
    data__->S9.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[8])) {
    __SET_VAR(data__->,S10.X,,1);
    data__->S10.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[9])) {
    __SET_VAR(data__->,S1.X,,1);
    data__->S1.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[10])) {
    __SET_VAR(data__->,S11.X,,1);
    data__->S11.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[11])) {
    __SET_VAR(data__->,S1.X,,1);
    data__->S1.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[12])) {
    __SET_VAR(data__->,S16.X,,1);
    data__->S16.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[13])) {
    __SET_VAR(data__->,S17.X,,1);
    data__->S17.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[14])) {
    __SET_VAR(data__->,S18.X,,1);
    data__->S18.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[15])) {
    __SET_VAR(data__->,S1.X,,1);
    data__->S1.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }
  if (__GET_VAR(data__->__transition_list[16])) {
    __SET_VAR(data__->,S16.X,,1);
    data__->S16.T.value = __time_to_timespec(1, 0, 0, 0, 0, 0);
  }

  // Steps association
  // S1 action associations
  {
    char active = __GET_VAR(data__->S1.X);
    char activated = active && !data__->S1.prev_state;
    char desactivated = !active && data__->S1.prev_state;

    if (active)       {__SET_VAR(data__->,ST1,,1);};
    if (desactivated) {__SET_VAR(data__->,ST1,,0);};

  }

  // S2 action associations
  {
    char active = __GET_VAR(data__->S2.X);
    char activated = active && !data__->S2.prev_state;
    char desactivated = !active && data__->S2.prev_state;

    if (active)       {__SET_VAR(data__->,ST2,,1);};
    if (desactivated) {__SET_VAR(data__->,ST2,,0);};

  }

  // S3 action associations
  {
    char active = __GET_VAR(data__->S3.X);
    char activated = active && !data__->S3.prev_state;
    char desactivated = !active && data__->S3.prev_state;

    if (active)       {__SET_VAR(data__->,ST3,,1);};
    if (desactivated) {__SET_VAR(data__->,ST3,,0);};

  }

  // S4 action associations
  {
    char active = __GET_VAR(data__->S4.X);
    char activated = active && !data__->S4.prev_state;
    char desactivated = !active && data__->S4.prev_state;

    if (active)       {__SET_VAR(data__->,ST4,,1);};
    if (desactivated) {__SET_VAR(data__->,ST4,,0);};

  }

  // S5 action associations
  {
    char active = __GET_VAR(data__->S5.X);
    char activated = active && !data__->S5.prev_state;
    char desactivated = !active && data__->S5.prev_state;

    if (active)       {__SET_VAR(data__->,ST5,,1);};
    if (desactivated) {__SET_VAR(data__->,ST5,,0);};

  }

  // S6 action associations
  {
    char active = __GET_VAR(data__->S6.X);
    char activated = active && !data__->S6.prev_state;
    char desactivated = !active && data__->S6.prev_state;

    if (active)       {__SET_VAR(data__->,ST6,,1);};
    if (desactivated) {__SET_VAR(data__->,ST6,,0);};

  }

  // S7 action associations
  {
    char active = __GET_VAR(data__->S7.X);
    char activated = active && !data__->S7.prev_state;
    char desactivated = !active && data__->S7.prev_state;

    if (active)       {__SET_VAR(data__->,ST7,,1);};
    if (desactivated) {__SET_VAR(data__->,ST7,,0);};

  }

  // S8 action associations
  {
    char active = __GET_VAR(data__->S8.X);
    char activated = active && !data__->S8.prev_state;
    char desactivated = !active && data__->S8.prev_state;

    if (active)       {__SET_VAR(data__->,ST8,,1);};
    if (desactivated) {__SET_VAR(data__->,ST8,,0);};

  }

  // S9 action associations
  {
    char active = __GET_VAR(data__->S9.X);
    char activated = active && !data__->S9.prev_state;
    char desactivated = !active && data__->S9.prev_state;

    if (active)       {__SET_VAR(data__->,ST9,,1);};
    if (desactivated) {__SET_VAR(data__->,ST9,,0);};

  }

  // S10 action associations
  {
    char active = __GET_VAR(data__->S10.X);
    char activated = active && !data__->S10.prev_state;
    char desactivated = !active && data__->S10.prev_state;

    if (active)       {__SET_VAR(data__->,ST10,,1);};
    if (desactivated) {__SET_VAR(data__->,ST10,,0);};

  }

  // S11 action associations
  {
    char active = __GET_VAR(data__->S11.X);
    char activated = active && !data__->S11.prev_state;
    char desactivated = !active && data__->S11.prev_state;

    if (active)       {__SET_VAR(data__->,ST11,,1);};
    if (desactivated) {__SET_VAR(data__->,ST11,,0);};

  }

  // S16 action associations
  {
    char active = __GET_VAR(data__->S16.X);
    char activated = active && !data__->S16.prev_state;
    char desactivated = !active && data__->S16.prev_state;

    if (active)       {__SET_VAR(data__->,ST16,,1);};
    if (desactivated) {__SET_VAR(data__->,ST16,,0);};

  }

  // S17 action associations
  {
    char active = __GET_VAR(data__->S17.X);
    char activated = active && !data__->S17.prev_state;
    char desactivated = !active && data__->S17.prev_state;

    if (active)       {__SET_VAR(data__->,ST17,,1);};
    if (desactivated) {__SET_VAR(data__->,ST17,,0);};

  }

  // S18 action associations
  {
    char active = __GET_VAR(data__->S18.X);
    char activated = active && !data__->S18.prev_state;
    char desactivated = !active && data__->S18.prev_state;

    if (active)       {__SET_VAR(data__->,ST18,,1);};
    if (desactivated) {__SET_VAR(data__->,ST18,,0);};

  }


  // Actions state evaluation
  for (i = 0; i < data__->__nb_actions; i++) {
    if (data__->__action_list[i].set) {
      data__->__action_list[i].set_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 1;
    }
    if (data__->__action_list[i].reset) {
      data__->__action_list[i].reset_remaining_time = __time_to_timespec(1, 0, 0, 0, 0, 0);
      data__->__action_list[i].stored = 0;
    }
    __SET_VAR(data__->,__action_list[i].state,,__GET_VAR(data__->__action_list[i].state) | data__->__action_list[i].stored);
  }

  // Actions execution
  if (data__->__action_list[__SFC_ST1].reset) {
    __SET_VAR(data__->,ST1,,0);
  }
  else if (data__->__action_list[__SFC_ST1].set) {
    __SET_VAR(data__->,ST1,,1);
  }
  if (data__->__action_list[__SFC_ST2].reset) {
    __SET_VAR(data__->,ST2,,0);
  }
  else if (data__->__action_list[__SFC_ST2].set) {
    __SET_VAR(data__->,ST2,,1);
  }
  if (data__->__action_list[__SFC_ST3].reset) {
    __SET_VAR(data__->,ST3,,0);
  }
  else if (data__->__action_list[__SFC_ST3].set) {
    __SET_VAR(data__->,ST3,,1);
  }
  if (data__->__action_list[__SFC_ST4].reset) {
    __SET_VAR(data__->,ST4,,0);
  }
  else if (data__->__action_list[__SFC_ST4].set) {
    __SET_VAR(data__->,ST4,,1);
  }
  if (data__->__action_list[__SFC_ST5].reset) {
    __SET_VAR(data__->,ST5,,0);
  }
  else if (data__->__action_list[__SFC_ST5].set) {
    __SET_VAR(data__->,ST5,,1);
  }
  if (data__->__action_list[__SFC_ST6].reset) {
    __SET_VAR(data__->,ST6,,0);
  }
  else if (data__->__action_list[__SFC_ST6].set) {
    __SET_VAR(data__->,ST6,,1);
  }
  if (data__->__action_list[__SFC_ST7].reset) {
    __SET_VAR(data__->,ST7,,0);
  }
  else if (data__->__action_list[__SFC_ST7].set) {
    __SET_VAR(data__->,ST7,,1);
  }
  if (data__->__action_list[__SFC_ST8].reset) {
    __SET_VAR(data__->,ST8,,0);
  }
  else if (data__->__action_list[__SFC_ST8].set) {
    __SET_VAR(data__->,ST8,,1);
  }
  if (data__->__action_list[__SFC_ST9].reset) {
    __SET_VAR(data__->,ST9,,0);
  }
  else if (data__->__action_list[__SFC_ST9].set) {
    __SET_VAR(data__->,ST9,,1);
  }
  if (data__->__action_list[__SFC_ST10].reset) {
    __SET_VAR(data__->,ST10,,0);
  }
  else if (data__->__action_list[__SFC_ST10].set) {
    __SET_VAR(data__->,ST10,,1);
  }
  if (data__->__action_list[__SFC_ST11].reset) {
    __SET_VAR(data__->,ST11,,0);
  }
  else if (data__->__action_list[__SFC_ST11].set) {
    __SET_VAR(data__->,ST11,,1);
  }
  if (data__->__action_list[__SFC_ST16].reset) {
    __SET_VAR(data__->,ST16,,0);
  }
  else if (data__->__action_list[__SFC_ST16].set) {
    __SET_VAR(data__->,ST16,,1);
  }
  if (data__->__action_list[__SFC_ST17].reset) {
    __SET_VAR(data__->,ST17,,0);
  }
  else if (data__->__action_list[__SFC_ST17].set) {
    __SET_VAR(data__->,ST17,,1);
  }
  if (data__->__action_list[__SFC_ST18].reset) {
    __SET_VAR(data__->,ST18,,0);
  }
  else if (data__->__action_list[__SFC_ST18].set) {
    __SET_VAR(data__->,ST18,,1);
  }


  goto __end;

__end:
  return;
} // PRINCIPAL_body__() 

// Steps undefinitions
#undef S1
#undef __SFC_S1
#undef S2
#undef __SFC_S2
#undef S3
#undef __SFC_S3
#undef S4
#undef __SFC_S4
#undef S5
#undef __SFC_S5
#undef S6
#undef __SFC_S6
#undef S7
#undef __SFC_S7
#undef S8
#undef __SFC_S8
#undef S9
#undef __SFC_S9
#undef S10
#undef __SFC_S10
#undef S11
#undef __SFC_S11
#undef S16
#undef __SFC_S16
#undef S17
#undef __SFC_S17
#undef S18
#undef __SFC_S18

// Actions undefinitions
#undef __SFC_ST1
#undef __SFC_ST2
#undef __SFC_ST3
#undef __SFC_ST4
#undef __SFC_ST5
#undef __SFC_ST6
#undef __SFC_ST7
#undef __SFC_ST8
#undef __SFC_ST9
#undef __SFC_ST10
#undef __SFC_ST11
#undef __SFC_ST16
#undef __SFC_ST17
#undef __SFC_ST18





void GENERAL_init__(GENERAL *data__, BOOL retain) {
  TON_init__(&data__->TAMPON_CHAUFFAGE,retain);
  TON_init__(&data__->T_OVERFLOW,retain);
  TON_init__(&data__->T_POMPE_SAVON,retain);
  TON_init__(&data__->T_DRAIN,retain);
  TON_init__(&data__->T_POMPE_SAVON_3_EXTRA,retain);
  TON_init__(&data__->T_POMPE_SANI,retain);
  TON_init__(&data__->T_LAVAGE,retain);
  TON_init__(&data__->T_PRE_WASH,retain);
  TON_init__(&data__->T_DELAI_VIDANGE,retain);
  TON_init__(&data__->T_HOT_RINSE,retain);
  TON_init__(&data__->T_ASSAIN,retain);
  TON_init__(&data__->DELAI_MOTEUR,retain);
  TON_init__(&data__->T_BRAS_LAVAGE_1,retain);
  TON_init__(&data__->T_BRAS_LAVAGE_3,retain);
  TON_init__(&data__->T_BRAS_LAVAGE_2,retain);
  TON_init__(&data__->T_BRAS_PRE_LAVAGE_3,retain);
  TON_init__(&data__->T_BRAS_ASSAIN_1,retain);
  TON_init__(&data__->T_BRAS_ASSAIN_2,retain);
  TON_init__(&data__->T_BRAS_ASSAIN_3,retain);
  TON_init__(&data__->T_BRAS_HOT_RINCE_1,retain);
  TON_init__(&data__->T_BRAS_HOT_RINCE_2,retain);
  TON_init__(&data__->T_BRAS_HOT_RINCE_3,retain);
  TON_init__(&data__->T_ALARME_FIN_DE_CYCLE,retain);
  URGENCE_init__(&data__->URGENCE0,retain);
  PRINCIPAL_init__(&data__->PRINCIPAL0,retain);
  __INIT_VAR(data__->STEP_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_14,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_16,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_17,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->STEP_18,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DEPART,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CYCLE_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->WATER_SAVER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CYCLE_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->URGENCEL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->COUVERT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->FLOTTE_BASSIN_BAS,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->FLOTTE_BOOSTER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->FLOTTE_BASSIN_HAUT,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SELECTEUR_LO_LEVEL,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BOOSTER_READY,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->HEATER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->MOTEUR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->DRAIN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BUZZER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->CHAUFFAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EAU_BOOSTER,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->EAU_FRAICHE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->POMPE_SAVON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->POMPE_ASSAIN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LUMIERE_VERTE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->LUMIERE_JAUNE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->BRAS_DE_LAVAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->UNUSED0,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->UNUSED1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->UNUSED2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_LAVAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_RINSE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_HOT_RINSE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_P_SAVON,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_P_ASSAIN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DRAINAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_1,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DRAIN,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_FICTIVE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_4,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_5,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_6,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_7,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_8,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_9,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_10,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_11,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_12,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_13,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_14,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_15,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_16,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DELAI_VIDANGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_DELAI_MOTEUR,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_17,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_18,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_TAMPON_CHAUFFAGE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_BRAS,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_BRAS_2,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_STEP_22,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_OVERFLOW,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_ALARM_OVERFLOW,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_FIN_DE_CYCLE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_FLOTTE,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->M_BRAS_3,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_INTERGRAFCET,__BOOL_LITERAL(FALSE),retain)
  __INIT_VAR(data__->SB_FIRSTRUN,__BOOL_LITERAL(FALSE),retain)
}

// Code part
void GENERAL_body__(GENERAL *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->PRINCIPAL0.,M_LAVAGE,,__GET_VAR(data__->M_LAVAGE,));
  __SET_VAR(data__->PRINCIPAL0.,M_RINSE,,__GET_VAR(data__->M_RINSE,));
  __SET_VAR(data__->PRINCIPAL0.,M_HOT_RINSE,,__GET_VAR(data__->M_HOT_RINSE,));
  __SET_VAR(data__->PRINCIPAL0.,M_P_SAVON,,__GET_VAR(data__->M_P_SAVON,));
  __SET_VAR(data__->PRINCIPAL0.,M_P_ASSAIN,,__GET_VAR(data__->M_P_ASSAIN,));
  __SET_VAR(data__->PRINCIPAL0.,M_DRAINAGE,,__GET_VAR(data__->M_DRAINAGE,));
  __SET_VAR(data__->PRINCIPAL0.,M_DELAI_VIDANGE,,__GET_VAR(data__->M_DELAI_VIDANGE,));
  __SET_VAR(data__->PRINCIPAL0.,M_FLOTTE,,__GET_VAR(data__->M_FLOTTE,));
  __SET_VAR(data__->PRINCIPAL0.,DEPART,,__GET_VAR(data__->DEPART,));
  __SET_VAR(data__->PRINCIPAL0.,WATER_SAVER,,__GET_VAR(data__->WATER_SAVER,));
  __SET_VAR(data__->PRINCIPAL0.,CYCLE_3,,__GET_VAR(data__->CYCLE_3,));
  __SET_VAR(data__->PRINCIPAL0.,URGENCEZ,,__GET_VAR(data__->URGENCEL,));
  __SET_VAR(data__->PRINCIPAL0.,BOOSTER_READY,,__GET_VAR(data__->BOOSTER_READY,));
  __SET_VAR(data__->PRINCIPAL0.,HEATER,,__GET_VAR(data__->HEATER,));
  PRINCIPAL_body__(&data__->PRINCIPAL0);
  __SET_VAR(data__->,STEP_1,,__GET_VAR(data__->PRINCIPAL0.ST1,));
  __SET_VAR(data__->,STEP_2,,__GET_VAR(data__->PRINCIPAL0.ST2,));
  __SET_VAR(data__->,STEP_3,,__GET_VAR(data__->PRINCIPAL0.ST3,));
  __SET_VAR(data__->,STEP_4,,__GET_VAR(data__->PRINCIPAL0.ST4,));
  __SET_VAR(data__->,STEP_5,,__GET_VAR(data__->PRINCIPAL0.ST5,));
  __SET_VAR(data__->,STEP_6,,__GET_VAR(data__->PRINCIPAL0.ST6,));
  __SET_VAR(data__->,STEP_7,,__GET_VAR(data__->PRINCIPAL0.ST7,));
  __SET_VAR(data__->,STEP_8,,__GET_VAR(data__->PRINCIPAL0.ST8,));
  __SET_VAR(data__->,STEP_9,,__GET_VAR(data__->PRINCIPAL0.ST9,));
  __SET_VAR(data__->,STEP_10,,__GET_VAR(data__->PRINCIPAL0.ST10,));
  __SET_VAR(data__->,STEP_11,,__GET_VAR(data__->PRINCIPAL0.ST11,));
  __SET_VAR(data__->,STEP_16,,__GET_VAR(data__->PRINCIPAL0.ST16,));
  __SET_VAR(data__->,STEP_17,,__GET_VAR(data__->PRINCIPAL0.ST17,));
  __SET_VAR(data__->,STEP_18,,__GET_VAR(data__->PRINCIPAL0.ST18,));
  __SET_VAR(data__->URGENCE0.,DEPART,,__GET_VAR(data__->DEPART,));
  __SET_VAR(data__->URGENCE0.,URGENCES,,__GET_VAR(data__->URGENCEL,));
  __SET_VAR(data__->URGENCE0.,M_DRAINAGE,,__GET_VAR(data__->M_DRAINAGE,));
  __SET_VAR(data__->URGENCE0.,M_STEP_1,,__GET_VAR(data__->M_STEP_1,));
  URGENCE_body__(&data__->URGENCE0);
  __SET_VAR(data__->,STEP_12,,__GET_VAR(data__->URGENCE0.ST12,));
  __SET_VAR(data__->,STEP_13,,__GET_VAR(data__->URGENCE0.ST13,));
  __SET_VAR(data__->,STEP_14,,__GET_VAR(data__->URGENCE0.ST14,));
  __SET_VAR(data__->,STEP_15,,__GET_VAR(data__->URGENCE0.ST15,));
  __SET_VAR(data__->,SB_INTERGRAFCET,,(__GET_VAR(data__->SB_FIRSTRUN,) || __GET_VAR(data__->STEP_15,)));
  if ((__GET_VAR(data__->M_STEP_16,) || __GET_VAR(data__->M_STEP_2,))) {
    __SET_VAR(data__->,LUMIERE_VERTE,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,EAU_FRAICHE,,((!(__GET_VAR(data__->M_OVERFLOW,)) && !(__GET_VAR(data__->M_FLOTTE,))) && ((__GET_VAR(data__->M_STEP_16,) || __GET_VAR(data__->M_STEP_2,)) || __GET_VAR(data__->M_STEP_5,))));
  __SET_VAR(data__->,POMPE_SAVON,,(!(__GET_VAR(data__->M_P_SAVON,)) && (__GET_VAR(data__->M_STEP_16,) || __GET_VAR(data__->M_STEP_2,))));
  __SET_VAR(data__->,MOTEUR,,(((((!(__GET_VAR(data__->M_LAVAGE,)) || !(__GET_VAR(data__->M_HOT_RINSE,))) || !(__GET_VAR(data__->M_RINSE,))) || !(__GET_VAR(data__->M_DRAINAGE,))) && __GET_VAR(data__->COUVERT,)) && (((((__GET_VAR(data__->M_DELAI_MOTEUR,) && ((((__GET_VAR(data__->M_STEP_11,) || __GET_VAR(data__->M_STEP_13,)) || __GET_VAR(data__->M_STEP_18,)) || __GET_VAR(data__->M_STEP_4,)) || __GET_VAR(data__->M_STEP_7,))) || __GET_VAR(data__->M_DELAI_VIDANGE,)) || __GET_VAR(data__->M_DRAIN,)) || __GET_VAR(data__->M_STEP_6,)) || __GET_VAR(data__->M_STEP_9,))));
  __SET_VAR(data__->,M_DRAIN,,((__GET_VAR(data__->M_DRAINAGE,) && __GET_VAR(data__->COUVERT,)) && ((((__GET_VAR(data__->M_STEP_11,) || __GET_VAR(data__->M_STEP_13,)) || __GET_VAR(data__->M_STEP_18,)) || __GET_VAR(data__->M_STEP_4,)) || __GET_VAR(data__->M_STEP_7,))));
  __SET_VAR(data__->,POMPE_ASSAIN,,(!(__GET_VAR(data__->M_P_ASSAIN,)) && __GET_VAR(data__->M_STEP_5,)));
  __SET_VAR(data__->,EAU_BOOSTER,,(__GET_VAR(data__->M_OVERFLOW,) && ((!(__GET_VAR(data__->M_FLOTTE,)) && __GET_VAR(data__->M_STEP_8,)) || __GET_VAR(data__->FLOTTE_BOOSTER,))));
  if ((__GET_VAR(data__->M_TAMPON_CHAUFFAGE,) && (!(__GET_VAR(data__->FLOTTE_BOOSTER,)) || !(__GET_VAR(data__->HEATER,))))) {
    __SET_VAR(data__->,CHAUFFAGE,,__BOOL_LITERAL(FALSE));
  };
  __SET_VAR(data__->TAMPON_CHAUFFAGE.,IN,,!(__GET_VAR(data__->FLOTTE_BOOSTER,)));
  __SET_VAR(data__->TAMPON_CHAUFFAGE.,PT,,__time_to_timespec(1, 0, 4, 0, 0, 0));
  TON_body__(&data__->TAMPON_CHAUFFAGE);
  __SET_VAR(data__->,M_TAMPON_CHAUFFAGE,,__GET_VAR(data__->TAMPON_CHAUFFAGE.Q,));
  __SET_VAR(data__->,M_ALARM_OVERFLOW,,(__GET_VAR(data__->M_OVERFLOW,) && __GET_VAR(data__->DEPART,)));
  __SET_VAR(data__->T_OVERFLOW.,IN,,(!(__GET_VAR(data__->M_ALARM_OVERFLOW,)) && (((__GET_VAR(data__->M_STEP_16,) || __GET_VAR(data__->M_STEP_2,)) || __GET_VAR(data__->M_STEP_5,)) || __GET_VAR(data__->M_STEP_8,))));
  __SET_VAR(data__->T_OVERFLOW.,PT,,__time_to_timespec(1, 0, 180, 0, 0, 0));
  TON_body__(&data__->T_OVERFLOW);
  __SET_VAR(data__->,M_OVERFLOW,,__GET_VAR(data__->T_OVERFLOW.Q,));
  __SET_VAR(data__->T_POMPE_SAVON.,IN,,__GET_VAR(data__->M_STEP_2,));
  __SET_VAR(data__->T_POMPE_SAVON.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_POMPE_SAVON);
  __SET_VAR(data__->T_POMPE_SAVON_3_EXTRA.,IN,,__GET_VAR(data__->M_STEP_16,));
  __SET_VAR(data__->T_POMPE_SAVON_3_EXTRA.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_POMPE_SAVON_3_EXTRA);
  __SET_VAR(data__->,M_P_SAVON,,(__GET_VAR(data__->T_POMPE_SAVON.Q,) || __GET_VAR(data__->T_POMPE_SAVON_3_EXTRA.Q,)));
  __SET_VAR(data__->T_POMPE_SANI.,IN,,__GET_VAR(data__->M_STEP_5,));
  __SET_VAR(data__->T_POMPE_SANI.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_POMPE_SANI);
  __SET_VAR(data__->,M_P_ASSAIN,,__GET_VAR(data__->T_POMPE_SANI.Q,));
  __SET_VAR(data__->T_LAVAGE.,IN,,(__GET_VAR(data__->COUVERT,) && __GET_VAR(data__->M_DRAIN,)));
  __SET_VAR(data__->T_LAVAGE.,PT,,__time_to_timespec(1, 0, 20, 0, 0, 0));
  TON_body__(&data__->T_LAVAGE);
  __SET_VAR(data__->T_PRE_WASH.,IN,,(__GET_VAR(data__->COUVERT,) && __GET_VAR(data__->M_DELAI_VIDANGE,)));
  __SET_VAR(data__->T_PRE_WASH.,PT,,__time_to_timespec(1, 0, 120, 0, 0, 0));
  TON_body__(&data__->T_PRE_WASH);
  __SET_VAR(data__->,M_LAVAGE,,(__GET_VAR(data__->T_LAVAGE.Q,) || __GET_VAR(data__->T_PRE_WASH.Q,)));
  __SET_VAR(data__->T_DRAIN.,IN,,(__GET_VAR(data__->COUVERT,) && ((((__GET_VAR(data__->M_STEP_11,) || __GET_VAR(data__->M_STEP_13,)) || __GET_VAR(data__->M_STEP_18,)) || __GET_VAR(data__->M_STEP_4,)) || __GET_VAR(data__->M_STEP_7,))));
  __SET_VAR(data__->T_DRAIN.,PT,,__time_to_timespec(1, 0, 25, 0, 0, 0));
  TON_body__(&data__->T_DRAIN);
  __SET_VAR(data__->,M_DRAINAGE,,__GET_VAR(data__->T_DRAIN.Q,));
  __SET_VAR(data__->T_DELAI_VIDANGE.,IN,,__GET_VAR(data__->M_STEP_10,));
  __SET_VAR(data__->T_DELAI_VIDANGE.,PT,,__time_to_timespec(1, 0, 600, 0, 0, 0));
  TON_body__(&data__->T_DELAI_VIDANGE);
  __SET_VAR(data__->,M_DELAI_VIDANGE,,__GET_VAR(data__->T_DELAI_VIDANGE.Q,));
  __SET_VAR(data__->T_HOT_RINSE.,IN,,(__GET_VAR(data__->COUVERT,) && __GET_VAR(data__->M_STEP_9,)));
  __SET_VAR(data__->T_HOT_RINSE.,PT,,__time_to_timespec(1, 0, 15, 0, 0, 0));
  TON_body__(&data__->T_HOT_RINSE);
  __SET_VAR(data__->,M_HOT_RINSE,,__GET_VAR(data__->T_HOT_RINSE.Q,));
  __SET_VAR(data__->T_ASSAIN.,IN,,(__GET_VAR(data__->COUVERT,) && __GET_VAR(data__->M_STEP_6,)));
  __SET_VAR(data__->T_ASSAIN.,PT,,__time_to_timespec(1, 0, 20, 0, 0, 0));
  TON_body__(&data__->T_ASSAIN);
  __SET_VAR(data__->,M_RINSE,,__GET_VAR(data__->T_ASSAIN.Q,));
  __SET_VAR(data__->,BUZZER,,(((((!(__GET_VAR(data__->COUVERT,)) && !(__GET_VAR(data__->M_STEP_10,))) && __GET_VAR(data__->M_STEP_1,)) || (!(__GET_VAR(data__->M_FIN_DE_CYCLE,)) && __GET_VAR(data__->M_STEP_10,))) || __GET_VAR(data__->M_OVERFLOW,)) || __GET_VAR(data__->M_STEP_14,)));
  __SET_VAR(data__->,M_STEP_1,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_1,)));
  __SET_VAR(data__->,M_STEP_2,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_2,)));
  __SET_VAR(data__->,M_DRAIN,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_DRAIN,)));
  __SET_VAR(data__->,M_STEP_4,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_4,)));
  __SET_VAR(data__->,M_STEP_5,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_5,)));
  __SET_VAR(data__->,M_STEP_6,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_6,)));
  __SET_VAR(data__->,M_STEP_7,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_7,)));
  __SET_VAR(data__->,M_STEP_8,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_8,)));
  __SET_VAR(data__->,M_STEP_9,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_9,)));
  __SET_VAR(data__->,M_STEP_10,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_10,)));
  __SET_VAR(data__->,M_STEP_11,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_11,)));
  __SET_VAR(data__->,M_STEP_12,,__GET_VAR(data__->M_STEP_12,));
  __SET_VAR(data__->,M_STEP_13,,__GET_VAR(data__->M_STEP_13,));
  __SET_VAR(data__->,M_STEP_14,,__GET_VAR(data__->M_STEP_14,));
  __SET_VAR(data__->,M_STEP_15,,__GET_VAR(data__->M_STEP_15,));
  __SET_VAR(data__->,M_STEP_16,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_16,)));
  __SET_VAR(data__->,M_DELAI_VIDANGE,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_DELAI_VIDANGE,)));
  __SET_VAR(data__->,M_STEP_18,,(!(__GET_VAR(data__->URGENCEL,)) && __GET_VAR(data__->M_STEP_18,)));
  if (__GET_VAR(data__->M_DRAIN,)) {
    __SET_VAR(data__->,DRAIN,,__BOOL_LITERAL(FALSE));
  };
  if (!(__GET_VAR(data__->M_DRAIN,))) {
    __SET_VAR(data__->,DRAIN,,__BOOL_LITERAL(TRUE));
  };
  __SET_VAR(data__->,LUMIERE_JAUNE,,__GET_VAR(data__->M_STEP_10,));
  __SET_VAR(data__->DELAI_MOTEUR.,IN,,__GET_VAR(data__->M_DRAIN,));
  __SET_VAR(data__->DELAI_MOTEUR.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->DELAI_MOTEUR);
  __SET_VAR(data__->,M_DELAI_MOTEUR,,__GET_VAR(data__->DELAI_MOTEUR.Q,));
  __SET_VAR(data__->,BRAS_DE_LAVAGE,,(((!(__GET_VAR(data__->M_BRAS,)) && (__GET_VAR(data__->M_DELAI_VIDANGE,) || __GET_VAR(data__->M_DRAIN,))) || (!(__GET_VAR(data__->M_BRAS_2,)) && __GET_VAR(data__->M_STEP_6,))) || (!(__GET_VAR(data__->M_STEP_22,)) && __GET_VAR(data__->M_STEP_9,))));
  __SET_VAR(data__->T_BRAS_LAVAGE_1.,IN,,((__GET_VAR(data__->CYCLE_1,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_DRAIN,)));
  __SET_VAR(data__->T_BRAS_LAVAGE_1.,PT,,__time_to_timespec(1, 0, 10, 0, 0, 0));
  TON_body__(&data__->T_BRAS_LAVAGE_1);
  __SET_VAR(data__->T_BRAS_LAVAGE_3.,IN,,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_DRAIN,)));
  __SET_VAR(data__->T_BRAS_LAVAGE_3.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_BRAS_LAVAGE_3);
  __SET_VAR(data__->T_BRAS_LAVAGE_2.,IN,,(((!(__GET_VAR(data__->CYCLE_3,)) && !(__GET_VAR(data__->CYCLE_1,))) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_DRAIN,)));
  __SET_VAR(data__->T_BRAS_LAVAGE_2.,PT,,__time_to_timespec(1, 0, 40, 0, 0, 0));
  TON_body__(&data__->T_BRAS_LAVAGE_2);
  __SET_VAR(data__->T_BRAS_PRE_LAVAGE_3.,IN,,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_DELAI_VIDANGE,)));
  __SET_VAR(data__->T_BRAS_PRE_LAVAGE_3.,PT,,__time_to_timespec(1, 0, 30, 0, 0, 0));
  TON_body__(&data__->T_BRAS_PRE_LAVAGE_3);
  __SET_VAR(data__->,M_BRAS,,(((__GET_VAR(data__->T_BRAS_LAVAGE_1.Q,) || __GET_VAR(data__->T_BRAS_LAVAGE_2.Q,)) || __GET_VAR(data__->T_BRAS_LAVAGE_3.Q,)) || __GET_VAR(data__->T_BRAS_PRE_LAVAGE_3.Q,)));
  __SET_VAR(data__->T_BRAS_ASSAIN_1.,IN,,((__GET_VAR(data__->CYCLE_1,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_6,)));
  __SET_VAR(data__->T_BRAS_ASSAIN_1.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_BRAS_ASSAIN_1);
  __SET_VAR(data__->T_BRAS_ASSAIN_2.,IN,,(((!(__GET_VAR(data__->CYCLE_3,)) && !(__GET_VAR(data__->CYCLE_1,))) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_6,)));
  __SET_VAR(data__->T_BRAS_ASSAIN_2.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_BRAS_ASSAIN_2);
  __SET_VAR(data__->T_BRAS_ASSAIN_3.,IN,,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_6,)));
  __SET_VAR(data__->T_BRAS_ASSAIN_3.,PT,,__time_to_timespec(1, 0, 5, 0, 0, 0));
  TON_body__(&data__->T_BRAS_ASSAIN_3);
  __SET_VAR(data__->,M_BRAS_2,,((__GET_VAR(data__->T_BRAS_ASSAIN_1.Q,) || __GET_VAR(data__->T_BRAS_ASSAIN_2.Q,)) || __GET_VAR(data__->T_BRAS_ASSAIN_3.Q,)));
  __SET_VAR(data__->T_BRAS_HOT_RINCE_1.,IN,,((__GET_VAR(data__->CYCLE_1,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_9,)));
  __SET_VAR(data__->T_BRAS_HOT_RINCE_1.,PT,,__time_to_timespec(1, 0, 10, 0, 0, 0));
  TON_body__(&data__->T_BRAS_HOT_RINCE_1);
  __SET_VAR(data__->T_BRAS_HOT_RINCE_2.,IN,,(((!(__GET_VAR(data__->CYCLE_3,)) && !(__GET_VAR(data__->CYCLE_1,))) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_9,)));
  __SET_VAR(data__->T_BRAS_HOT_RINCE_2.,PT,,__time_to_timespec(1, 0, 10, 0, 0, 0));
  TON_body__(&data__->T_BRAS_HOT_RINCE_2);
  __SET_VAR(data__->T_BRAS_HOT_RINCE_3.,IN,,((__GET_VAR(data__->CYCLE_3,) && __GET_VAR(data__->COUVERT,)) && __GET_VAR(data__->M_STEP_9,)));
  __SET_VAR(data__->T_BRAS_HOT_RINCE_3.,PT,,__time_to_timespec(1, 0, 10, 0, 0, 0));
  TON_body__(&data__->T_BRAS_HOT_RINCE_3);
  __SET_VAR(data__->,M_STEP_22,,((__GET_VAR(data__->T_BRAS_HOT_RINCE_1.Q,) || __GET_VAR(data__->T_BRAS_HOT_RINCE_2.Q,)) || __GET_VAR(data__->T_BRAS_HOT_RINCE_3.Q,)));
  __SET_VAR(data__->T_ALARME_FIN_DE_CYCLE.,IN,,__GET_VAR(data__->M_STEP_10,));
  __SET_VAR(data__->T_ALARME_FIN_DE_CYCLE.,PT,,__time_to_timespec(1, 0, 1, 0, 0, 0));
  TON_body__(&data__->T_ALARME_FIN_DE_CYCLE);
  __SET_VAR(data__->,M_FIN_DE_CYCLE,,__GET_VAR(data__->T_ALARME_FIN_DE_CYCLE.Q,));
  __SET_VAR(data__->,M_FLOTTE,,(((__GET_VAR(data__->SELECTEUR_LO_LEVEL,) && __GET_VAR(data__->FLOTTE_BASSIN_BAS,)) && __GET_VAR(data__->CYCLE_1,)) || __GET_VAR(data__->FLOTTE_BASSIN_HAUT,)));

  goto __end;

__end:
  return;
} // GENERAL_body__() 





