TYPE
  LOGLEVEL : (CRITICAL, WARNING, INFO, DEBUG) := INFO;
END_TYPE

FUNCTION_BLOCK LOGGER
  VAR_INPUT
    TRIG : BOOL;
    MSG : STRING;
    LEVEL : LOGLEVEL := INFO;
  END_VAR
  VAR
    TRIG0 : BOOL;
  END_VAR

  IF TRIG AND NOT TRIG0 THEN
  {{
   LogMessage(GetFbVar(LEVEL),(char*)GetFbVar(MSG, .body),GetFbVar(MSG, .len));
  }}
  END_IF;
  TRIG0:=TRIG;
END_FUNCTION_BLOCK



FUNCTION_BLOCK python_eval
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(0, data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_poll
  VAR_INPUT
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    STATE : DWORD;
    BUFFER : STRING;
    PREBUFFER : STRING;
    TRIGM1 : BOOL;
    TRIGGED : BOOL;
  END_VAR

  {extern void __PythonEvalFB(int, PYTHON_EVAL*);__PythonEvalFB(1,(PYTHON_EVAL*)(void*)data__);}
END_FUNCTION_BLOCK

FUNCTION_BLOCK python_gear
  VAR_INPUT
    N : UINT;
    TRIG : BOOL;
    CODE : STRING;
  END_VAR
  VAR_OUTPUT
    ACK : BOOL;
    RESULT : STRING;
  END_VAR
  VAR
    py_eval : python_eval;
    COUNTER : UINT;
    ADD10_OUT : UINT;
    EQ13_OUT : BOOL;
    SEL15_OUT : UINT;
    AND7_OUT : BOOL;
  END_VAR

  ADD10_OUT := ADD(COUNTER, 1);
  EQ13_OUT := EQ(N, ADD10_OUT);
  SEL15_OUT := SEL(EQ13_OUT, ADD10_OUT, 0);
  COUNTER := SEL15_OUT;
  AND7_OUT := AND(EQ13_OUT, TRIG);
  py_eval(TRIG := AND7_OUT, CODE := CODE);
  ACK := py_eval.ACK;
  RESULT := py_eval.RESULT;
END_FUNCTION_BLOCK


PROGRAM UPDATE_PART
  VAR_EXTERNAL
    Update_Complete : BOOL;
    Part_Process : DWORD;
  END_VAR
  VAR_INPUT
    RFID_IO_Complete : BOOL;
  END_VAR
  VAR
    IO_Timer : TON;
  END_VAR

  (* Perform 15-step I/O operations on RFID *)
  IO_Timer(IN := NOT(Update_Complete), PT := DWORD_TO_TIME(Part_Process), Q => RFID_IO_Complete);

  IF RFID_IO_Complete THEN
      Update_Complete := True;
  END_IF;
END_PROGRAM

PROGRAM Cell1
  VAR_EXTERNAL
    Update_Complete : BOOL;
    Part_Process : DWORD;
  END_VAR
  VAR_INPUT
    Pallet_Sensor : BOOL;
    Part_Sensor : BOOL;
    CNC_Part_Ready : BOOL;
    Robot_Ready : BOOL;
    Part_AtConveyor : BOOL;
  END_VAR
  VAR_OUTPUT
    Retract_Stopper : BOOL;
    Deliver_Part : BOOL;
  END_VAR
  VAR
    Pallet_Arrival : BOOL;
    Update_Part_Process : BOOL;
  END_VAR

  Pallet_Arrival := False;
  Retract_Stopper := False;
  Deliver_Part := False;
  Update_Part_Process := False;

  IF Pallet_Sensor AND NOT(Part_Sensor) THEN
      Pallet_Arrival := True;
  END_IF;

  IF Part_Sensor THEN
      Retract_Stopper := True;
  END_IF;

  IF Pallet_Arrival AND CNC_Part_Ready AND Robot_Ready AND NOT(Part_AtConveyor) THEN
      Deliver_Part := True;
      Update_Part_Process := True;
      CNC_Part_Ready := False;
      Robot_Ready := False;
  END_IF;


  IF Update_Part_Process THEN
      Part_Process := INT_TO_DWORD(2);
  END_IF;


  IF Update_Complete AND Part_AtConveyor THEN
      Retract_Stopper := True;
      Update_Complete := False;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    VAR_GLOBAL
      Update_Complete : BOOL;
      Part_Process : DWORD;
    END_VAR
    TASK task0(INTERVAL := T#100ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#100ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Cell1;
    PROGRAM instance1 WITH task1 : UPDATE_PART;
  END_RESOURCE
END_CONFIGURATION
