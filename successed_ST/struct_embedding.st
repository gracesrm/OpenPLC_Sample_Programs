TYPE
  A1: STRUCT
    X : INT;
    Y : INT;
  END_STRUCT;
END_TYPE

FUNCTION G : INT
  VAR_INPUT
    A : A1;
  END_VAR

  G := A.X + A.Y;
END_FUNCTION

FUNCTION A_F : INT
  VAR_INPUT
    _SELF : A1;
    Z : INT;
  END_VAR

  IF (_SELF.X > Z) THEN
    A_F := _SELF.Y;
  ELSE
    A_F := Z;
  END_IF;
END_FUNCTION

PROGRAM MY_PROGRAM
  VAR_INPUT
    Z : INT;
  END_VAR
  VAR
    A : A1 := (X := 42, Y := 333);
  END_VAR
  VAR_OUTPUT
    NEW_Z : INT;
  END_VAR

  NEW_Z := A_F(_SELF := A, Z := Z) + G(A);
END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MY_PROGRAM;
  END_RESOURCE
END_CONFIGURATION
