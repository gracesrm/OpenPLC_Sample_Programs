PROGRAM constantprogram
    VAR_INPUT
        i : INT;
    END_VAR

    VAR
        a,b,c,d : INT;
    END_VAR

    VAR_OUTPUT
        o : INT;
    END_VAR

    o := d;
    d := c;
    c := b;
    b := a;
    a := i;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : constantprogram;
  END_RESOURCE
END_CONFIGURATION
