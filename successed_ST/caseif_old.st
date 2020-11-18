PROGRAM abc
VAR_INPUT  i : INT; END_VAR
VAR_OUTPUT o : INT; END_VAR

IF i = 0 THEN
    o := 0;
ELSIF i > 0 AND i <= 5 THEN
    o := i * i;
ELSIF i > 4 AND i <= 10 THEN
    o := i+i*2;
ELSE
    o := -1;
END_IF;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : abc;
  END_RESOURCE
END_CONFIGURATION
