PROGRAM my_sth
    VAR_INPUT
        number : INT := 1;
        n2 : INT;
        active : BOOL := True;
    END_VAR

   number := 3;

   if number = 3 THEN
    number :=300;
   END_IF;

   if active THEN
    n2 := 4;
    END_IF;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : my_sth;
  END_RESOURCE
END_CONFIGURATION
