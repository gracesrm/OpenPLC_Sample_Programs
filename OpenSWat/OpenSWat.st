PROGRAM OpenSWat
  VAR
    uSensor AT %IX0.0 : BOOL;
    sw AT %IX0.1 : BOOL;
    pb AT %IX0.2 : BOOL;
    sinput1 AT %IX0.3 : BOOL;
    sinput2 AT %IX0.4 : BOOL;
    sinput3 AT %IX0.5 : BOOL;
    sinput4 AT %IX0.6 : BOOL;
    sinput5 AT %IX0.7 : BOOL;
    sinput6 AT %IX1.0 : BOOL;
    sinput7 AT %IX1.1 : BOOL;
    sinput8 AT %IX1.2 : BOOL;
    sinput9 AT %IX1.3 : BOOL;
    sinput10 AT %IX1.4 : BOOL;
    sinput11 AT %IX1.5 : BOOL;
    sinput12 AT %IX1.6 : BOOL;
    sinput13 AT %IX1.7 : BOOL;
    sinput14 AT %IX2.0 : BOOL;
    sinput15 AT %IX2.1 : BOOL;
    sinput16 AT %IX2.2 : BOOL;
    sinput17 AT %IX2.3 : BOOL;
    sinput18 AT %IX2.4 : BOOL;
    sinput19 AT %IX2.5 : BOOL;
    sinput20 AT %IX2.6 : BOOL;
    sinput21 AT %IX2.7 : BOOL;
    sinput22 AT %IX3.0 : BOOL;
    sinput23 AT %IX3.1 : BOOL;
    sinput24 AT %IX3.2 : BOOL;
    sinput25 AT %IX3.3 : BOOL;
    sinput26 AT %IX3.4 : BOOL;
    sinput27 AT %IX3.5 : BOOL;
    sinput28 AT %IX3.6 : BOOL;
    sinput29 AT %IX3.7 : BOOL;
    sinput30 AT %IX4.0 : BOOL;
    sinput31 AT %IX4.1 : BOOL;
    sinput32 AT %IX4.2 : BOOL;
    sinput33 AT %IX4.3 : BOOL;
    tempSensor1 AT %IW0.0 : UINT;
    tempSensor2 AT %IW0.1 : UINT;
    led1 AT %QX0.0 : BOOL;
    led2 AT %QX0.1 : BOOL;
    led3 AT %QX0.2 : BOOL;
    led4 AT %QX0.3 : BOOL;
    led5 AT %QX0.4 : BOOL;
    led6 AT %QX0.5 : BOOL;
    led7 AT %QX0.6 : BOOL;
    led8 AT %QX0.7 : BOOL;
    led9 AT %QX1.0 : BOOL;
    led10 AT %QX1.1 : BOOL;
    led11 AT %QX1.2 : BOOL;
    led12 AT %QX1.3 : BOOL;
    led13 AT %QX1.4 : BOOL;
    led14 AT %QX1.5 : BOOL;
    led15 AT %QX1.6 : BOOL;
    led16 AT %QX1.7 : BOOL;
    led17 AT %QX2.0 : BOOL;
    led18 AT %QX2.1 : BOOL;
    led19 AT %QX2.2 : BOOL;
    led20 AT %QX2.3 : BOOL;
    led21 AT %QX2.4 : BOOL;
    led22 AT %QX2.5 : BOOL;
    led23 AT %QX2.6 : BOOL;
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
