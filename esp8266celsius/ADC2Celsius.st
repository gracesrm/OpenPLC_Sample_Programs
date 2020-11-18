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
    A0 AT %IW100 : UINT;
    Tc AT %QW100 : INT;
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
