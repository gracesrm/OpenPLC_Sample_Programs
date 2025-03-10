TYPE
    MY_ENUM : (POSSIBLE, VALUES, ENUM);
END_TYPE

PROGRAM MY_STH
    VAR_INPUT
        ACTIVE : BOOL := TRUE;
        NUMBER : INT := 1;
        MY_ENUM_1 : MY_ENUM;
    END_VAR

    VAR_OUTPUT
        MY_OUTPUT : MY_ENUM;
        SERIOUSLY : BOOL;
    END_VAR

    VAR
        MY_ENUM_LOCAL : MY_ENUM;
    END_VAR

    VAR_IN_OUT
        ACTIVE_INOUT : BOOL;
    END_VAR

   SERIOUSLY := NOT FALSE;
   NUMBER := (- 19);
   NUMBER := 1 + 2;


END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MY_STH;
  END_RESOURCE
END_CONFIGURATION
