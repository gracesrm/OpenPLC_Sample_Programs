
PROGRAM main
VAR_INPUT i,j,k : INT; END_VAR
VAR_OUTPUT x,y,z : INT; END_VAR
VAR a,b,c :INT; END_VAR


(* //! region a
 *) 
 a:= 2*i+k;
 b:= a*a;
 x:= 1;
 y:= 2;
(* //! end_region
 *)
 z:=2*k;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : main;
  END_RESOURCE
END_CONFIGURATION
