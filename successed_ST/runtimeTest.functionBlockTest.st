FUNCTION_BLOCK TON_B

VAR_INPUT
    IN : BOOL;
    IN2 : BOOL;
END_VAR

VAR_OUTPUT
    Q  : BOOL := TRUE;
END_VAR

    Q := IN AND IN2;

END_FUNCTION_BLOCK

PROGRAM  Analogsensor

    VAR
      timeout          	: TON_B;
      e : BOOL;
    END_VAR

    timeout(IN := TRUE, IN2 := TRUE);

    e := timeout.Q;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Analogsensor;
  END_RESOURCE
END_CONFIGURATION
