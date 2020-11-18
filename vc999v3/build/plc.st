TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    ADD10_OUT : UINT;
    EQ13_OUT : BOOL;
    SEL15_OUT : UINT;
    AND7_OUT : BOOL;
  END_VAR

  ADD10_OUT := ADD(COUNTER, 1);
  EQ13_OUT := EQ(N, ADD10_OUT);
  SEL15_OUT := SEL(EQ13_OUT, ADD10_OUT, 0);
  COUNTER := SEL15_OUT;
  AND7_OUT := AND(EQ13_OUT, TRIG);
  py_eval(TRIG := AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM program0
  VAR
    TIMER : TIME := T#4s;
    TE : TIME := T#0s;
    reset : BOOL;
  END_VAR
  VAR
    V_Pump : BOOL;
    Lid : BOOL;
    Vent : BOOL;
    Bar : BOOL;
    Seal1 : BOOL;
    Seal2 : BOOL;
    Pump_Start : BOOL;
    Pump_stop : BOOL;
    START_CYCLE : BOOL;
  END_VAR
  VAR
    FINISH_CYCLE : BOOL;
    hold1I : BOOL;
    TOF0 : TOF;
    TOF1 : TOF;
    TOF2 : TOF;
    R_TRIG0 : R_TRIG;
    R_TRIG1 : R_TRIG;
    F_TRIG1 : F_TRIG;
  END_VAR

  V_Pump := Pump_stop AND (Pump_Start OR V_Pump);
  Lid := NOT(FINISH_CYCLE) AND (Lid OR START_CYCLE);
  Vent := NOT(FINISH_CYCLE) AND (Lid OR START_CYCLE);
  TOF2(IN := START_CYCLE, PT := TIMER);
  Bar := TOF2.Q;
  TE := TOF2.ET;
  R_TRIG0(CLK := NOT(Bar));
  TOF0(IN := R_TRIG0.Q, PT := TIMER);
  Seal1 := TOF0.Q;
  TE := TOF0.ET;
  R_TRIG1(CLK := NOT(Seal1));
  TOF1(IN := R_TRIG1.Q, PT := TIMER);
  Seal2 := TOF1.Q;
  TE := TOF1.ET;
  F_TRIG1(CLK := Seal2);
  FINISH_CYCLE := F_TRIG1.Q AND Lid;
END_PROGRAM

FUNCTION_BLOCK TP_WITH_RESET
  VAR_INPUT
    IN : BOOL;
    PT : TIME := T#4s;
    RESET : BOOL;
  END_VAR
  VAR_OUTPUT
    Q : BOOL;
    ET : TIME := T#0s;
  END_VAR
  VAR
    STATE : SINT := 0;
    PREV_IN : BOOL := FALSE;
    CURRENT_TIME : TIME;
    START_TIME : TIME;
  END_VAR

  (* Pragma to set current time *)
  {__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}

  (*Timer block code *)
  IF ((STATE = 0) AND NOT(PREV_IN) AND IN) THEN  (* found rising edge on IN *)
      (* start timer... *)
      STATE := 1;
      Q := TRUE;
      START_TIME := CURRENT_TIME;

  ELSIF (STATE = 1) THEN (* timer counting *)
      IF ((START_TIME + PT) <= CURRENT_TIME) THEN (* timer expired *)
          STATE := 2;
          Q := FALSE;
          ET := PT;
      ELSE (* continue counting *)
          ET := CURRENT_TIME - START_TIME;
      END_IF;
  END_IF;

  IF ((STATE = 2) AND NOT(IN)) THEN
      ET := T#0s;
      STATE := 0;
  END_IF;

  IF (RESET) THEN (* reset pressed *)
    ET := T#0s;
    STATE := 0;
    Q := FALSE;
  END_IF;

  PREV_IN := IN;
END_FUNCTION_BLOCK


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
