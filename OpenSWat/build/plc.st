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


PROGRAM OpenSWat
  VAR
    uSensor : BOOL;
    sw : BOOL;
    pb : BOOL;
    sinput1 : BOOL;
    sinput2 : BOOL;
    sinput3 : BOOL;
    sinput4 : BOOL;
    sinput5 : BOOL;
    sinput6 : BOOL;
    sinput7 : BOOL;
    sinput8 : BOOL;
    sinput9 : BOOL;
    sinput10 : BOOL;
    sinput11 : BOOL;
    sinput12 : BOOL;
    sinput13 : BOOL;
    sinput14 : BOOL;
    sinput15 : BOOL;
    sinput16 : BOOL;
    sinput17 : BOOL;
    sinput18 : BOOL;
    sinput19 : BOOL;
    sinput20 : BOOL;
    sinput21 : BOOL;
    sinput22 : BOOL;
    sinput23 : BOOL;
    sinput24 : BOOL;
    sinput25 : BOOL;
    sinput26 : BOOL;
    sinput27 : BOOL;
    sinput28 : BOOL;
    sinput29 : BOOL;
    sinput30 : BOOL;
    sinput31 : BOOL;
    sinput32 : BOOL;
    sinput33 : BOOL;
    tempSensor1 : UINT;
    tempSensor2 : UINT;
    led1 : BOOL;
    led2 : BOOL;
    led3 : BOOL;
    led4 : BOOL;
    led5 : BOOL;
    led6 : BOOL;
    led7 : BOOL;
    led8 : BOOL;
    led9 : BOOL;
    led10 : BOOL;
    led11 : BOOL;
    led12 : BOOL;
    led13 : BOOL;
    led14 : BOOL;
    led15 : BOOL;
    led16 : BOOL;
    led17 : BOOL;
    led18 : BOOL;
    led19 : BOOL;
    led20 : BOOL;
    led21 : BOOL;
    led22 : BOOL;
    led23 : BOOL;
  END_VAR
  VAR
    TOF0 : TOF;
    TOF1 : TOF;
    TOF11 : TOF;
    TOF2 : TOF;
    TOF3 : TOF;
    TOF5 : TOF;
    TOF6 : TOF;
    TOF7 : TOF;
    TOF4 : TOF;
    TOF9 : TOF;
    TOF10 : TOF;
    TOF8 : TOF;
    GE75_OUT : BOOL;
    LE99_OUT : BOOL;
    LT111_OUT : BOOL;
    GE82_OUT : BOOL;
  END_VAR

  TOF0(IN := sinput1 AND sw, PT := T#25ms);
  led1 := TOF0.Q;
  TOF1(IN := sinput4 AND sinput2 OR pb, PT := T#10ms);
  led2 := TOF1.Q;
  TOF11(IN := sinput5 AND sinput3, PT := T#15ms);
  led3 := TOF11.Q;
  TOF5(IN := sinput8 AND sinput6, PT := T#30ms);
  led4 := TOF5.Q;
  TOF6(IN := sinput9 AND sinput7, PT := T#10ms);
  led5 := TOF6.Q;
  TOF7(IN := sinput10, PT := T#20ms);
  led6 := TOF7.Q;
  TOF4(IN := sinput32 AND sinput30, PT := T#10ms);
  led7 := TOF4.Q;
  TOF9(IN := sinput31 AND sinput11, PT := T#10ms);
  led8 := TOF9.Q;
  TOF10(IN := sinput12, PT := T#10ms);
  led9 := TOF10.Q;
  TOF8(IN := sinput33, PT := T#10ms);
  led10 := TOF8.Q;
  led11 := sinput13 OR sinput14;
  led12 := sinput15;
  led13 := sinput16;
  led14 := sinput17;
  led15 := sinput18;
  led16 := sinput19;
  led17 := sinput20;
  led18 := sinput21;
  led19 := sinput22;
  led20 := sinput23;
  led21 := sinput26 AND sinput24 OR uSensor AND sw;
  GE75_OUT := GE(tempSensor1, 22706);
  LE99_OUT := LE(tempSensor1, 22706);
  TOF2(IN := NOT(sinput27) AND sw AND LE99_OUT, PT := T#100ms);
  led22 := sinput25 AND sw AND GE75_OUT OR TOF2.Q;
  LT111_OUT := LT(tempSensor2, 22706);
  GE82_OUT := GE(tempSensor2, 22706);
  TOF3(IN := sinput28 AND sw AND GE82_OUT, PT := T#100ms);
  led23 := sinput29 AND sw AND LT111_OUT OR TOF3.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK TaskMain(INTERVAL := T#50ms,PRIORITY := 0);
    PROGRAM Inst0 WITH TaskMain : OpenSWat;
  END_RESOURCE
END_CONFIGURATION
