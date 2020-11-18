TYPE
    S : (A ,B , C);
END_TYPE

FUNCTION SEL : BOOL
    VAR_INPUT A,B,C : BOOL; END_VAR
    IF A THEN SEL := B; ELSE SEL := C; END_IF;
END_FUNCTION

PROGRAM ABC
    VAR_INPUT
        TICK, TOCK : BOOL;
    END_VAR

    VAR_OUTPUT
        X, Y, Z : BOOL;
        W : INT;
    END_VAR

    VAR STATE : S; END_VAR

    CASE STATE OF
        S#A:
            X := NOT Y;
            Y := X;
            Z := X AND X OR Y;
            STATE := S#B;
        S#B:
            X := TRUE;
            STATE := S#C;
        S#C:
            Z := FALSE;
            STATE := S#A;
    END_CASE;
    W := SEL(X, 0, W+1);
    X := NOT X;

    IF TICK AND NOT TOCK THEN
      X := X AND X;
    END_IF;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : ABC;
  END_RESOURCE
END_CONFIGURATION
