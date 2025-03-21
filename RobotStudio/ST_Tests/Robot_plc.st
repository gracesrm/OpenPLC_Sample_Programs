TYPE
  datatype1 : STRUCT
    pp : DINT;
    qq : DINT;
  END_STRUCT;
  datatype0 : REAL := 1.0;
END_TYPE

FUNCTION_BLOCK FB0
  VAR
    LocalVar0 : DINT;
  END_VAR
  VAR_OUTPUT
    output2 : DINT;
  END_VAR

  LocalVar0 := 0;
  output2 := LocalVar0;
END_FUNCTION_BLOCK

PROGRAM program0
  VAR
    LocalVar0 : DINT;
  END_VAR
  VAR_INPUT
    input1 : BOOL;
  END_VAR
  VAR_OUTPUT
    output2 : BOOL;
  END_VAR
  VAR_IN_OUT
    inout : REAL;
  END_VAR

  LocalVar0 := 1;
  output2 := input1;
END_PROGRAM

PROGRAM program1
  VAR
    LocalVar0 : DINT;
  END_VAR
  VAR_INPUT
    input2 : DINT;
  END_VAR
  VAR_OUTPUT
    output3 : DINT;
  END_VAR
  VAR_IN_OUT
    inout : DINT;
  END_VAR

  LocalVar0 := -1;
  output3 := input2;
END_PROGRAM

FUNCTION fun0 : INT
  VAR
    LocalVar0 : DINT;
  END_VAR
  VAR_OUTPUT
    output : DINT;
  END_VAR

  LocalVar0 := 2;
  output := LocalVar0;
END_FUNCTION


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    VAR_GLOBAL
      LocalVar0 : DINT;
      LocalVar1 : BOOL;
    END_VAR
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    TASK task1(INTERVAL := T#50ms, PRIORITY := 7);
    PROGRAM instance0 WITH task0 : program0;
    PROGRAM instance1 WITH task1 : program1;
  END_RESOURCE
END_CONFIGURATION
