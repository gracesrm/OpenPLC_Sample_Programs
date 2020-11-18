FUNCTION_BLOCK MaxMin
VAR_INPUT
	T_Inputs : ARRAY [1..5] OF REAL;
END_VAR
VAR
	i: INT:=1;
END_VAR
VAR_OUTPUT
	MAXnum : REAL := 0.0;
	MINnum : REAL := 2000.0;
END_VAR

WHILE i<=5 DO
	IF T_Inputs[i] > MAXNum
		THEN MAXnum := T_Inputs[i];
	END_IF;
	IF T_Inputs[i] < MinNum
		THEN Minnum := T_Inputs[i];
	END_IF;
	i := i+1;
END_WHILE;

END_FUNCTION_BLOCK

PROGRAM Main
VAR
	PP : MaxMin;
	i: INT:=1;
END_VAR
VAR_OUTPUT
	MAXnum : REAL;
	MINnum : REAL;
END_VAR
VAR_INPUT
	T_Inputs1 : ARRAY [1..5] OF REAL;
END_VAR

(* PP(T_Inputs:=T_Inputs1); *)
WHILE i<=5 DO
	PP.T_Inputs[1] := T_Inputs1[i];
	i := i+1;
END_WHILE;


MAXnum := PP.MAXnum;
MINnum := PP.MINnum;

END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Main;
  END_RESOURCE
END_CONFIGURATION