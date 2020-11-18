TYPE
    abc : (a, b, c);
END_TYPE


FUNCTION SEL_FB : abc
    VAR_INPUT
        a : BOOL;
        b,c : abc;
    END_VAR

    IF a THEN
        SEL_FB := b;
    ELSE
        SEL_FB := c;
    END_IF;
END_FUNCTION



PROGRAM ppp
    VAR i : INT; END_VAR
    VAR_OUTPUT o : abc; END_VAR

    o := SEL_FB(i = 0, abc#a, SEL_FB(i = 1, abc#b, abc#c));
    i := i + 1;
    i := SEL(i>2, 0, i);
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : ppp;
  END_RESOURCE
END_CONFIGURATION
