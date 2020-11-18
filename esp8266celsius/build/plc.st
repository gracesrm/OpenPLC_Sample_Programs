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


FUNCTION_BLOCK ADC2Celsius
  VAR_INPUT
    A0 : UINT;
  END_VAR
  VAR
    ADC : REAL;
    Offset : REAL := 2240.0;
    Rntc : REAL;
    Rseries : REAL := 9970.0;
    ADCmax : REAL := 65535.0;
    Stein : REAL;
    T0 : REAL := 298.15;
    B : REAL := 4050.0;
    R0 : REAL := 10000.0;
    Temp : REAL;
    Tk : REAL := 273.15;
    Tcal : REAL := 0.0;
  END_VAR
  VAR_OUTPUT
    Tc : INT;
  END_VAR

  (* ADC to Celsius with voltage divider 10k and NTC 10k at esp8266 *)

  (* Conversion *)
  ADC := UINT_TO_REAL(A0);

  (* NTC Resistance *)
  Rntc := Rseries / ((ADCmax / (ADC - Offset)) - 1.0);

  (* Steinhart Equation *)
  Stein := (1.0 / T0) + (1.0 / B) * LN((Rntc / R0));

  (* Temperature in Kelvin *)
  Temp := (1.0 / Stein);

  (* Temperature in Celsius *)
  Temp := (Temp - Tk);

  (* Offset Calibration *)
  Temp := (Temp + Tcal);

  (* To preserve 2 decimals after REAL_TO_INT*)
  Temp := (Temp * 100.0);

  (* Conversion *)
  Tc := REAL_TO_INT(Temp);
END_FUNCTION_BLOCK

PROGRAM program0
  VAR
    A0 : UINT;
    Tc : INT;
  END_VAR
  VAR
    ADC2Celsius0 : ADC2Celsius;
  END_VAR

  ADC2Celsius0(A0 := A0);
  Tc := ADC2Celsius0.Tc;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK TaskMain(INTERVAL := T#250ms,PRIORITY := 0);
    PROGRAM Inst0 WITH TaskMain : program0;
  END_RESOURCE
END_CONFIGURATION
