PROGRAM Wait_Busy_Protocol 
VAR
  state : INT := 0;
  request : BOOL;
  listen : BOOL;
  done : BOOL;
END_VAR

IF (state = 0) AND (request = False) THEN
  listen := True;
  state := 0;
END_IF;

IF (state = 0) AND request THEN
  listen := False;
  done := False;
  state := 1;
END_IF;

IF (state = 1) AND (done = False) THEN
  state := 1;
END_IF;

IF (state = 1) AND done THEN
  state := 0;
  listen := True;
END_IF;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Wait_Busy_Protocol;
  END_RESOURCE
END_CONFIGURATION