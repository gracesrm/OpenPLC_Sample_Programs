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
      Update_Complete AT %MX0.3 : BOOL;
      Part_Process AT %ML50 : DWORD;
    END_VAR
    TASK task0(INTERVAL := T#100ms,PRIORITY := 0);
    TASK task1(INTERVAL := T#100ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Cell1;
    PROGRAM instance1 WITH task1 : UPDATE_PART;
  END_RESOURCE
END_CONFIGURATION
