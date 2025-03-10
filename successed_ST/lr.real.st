TYPE
  OpMode : (Op , Teach);
  TeachStatus :  (Ok, NoTeachPoints, Teaching, InvalidTeachPoints, InvalidInputValue);
END_TYPE


FUNCTION_BLOCK TON_B

VAR_INPUT
  IN : BOOL;
  PT : INT;
END_VAR

VAR_OUTPUT
  Q  : BOOL;
  ET : INT;
END_VAR

IF IN THEN
  Q:= ET = INT#0;
  IF ET > INT#0 THEN
      ET := ET - INT#1;
  ELSE
      ET := INT#0;
  END_IF;
ELSE
  Q  := FALSE;
  ET := PT;
END_IF;

END_FUNCTION_BLOCK


PROGRAM Analogsensor

VAR 
  SENSORINPUT_MIN : REAL := REAL#0.0;
  SENSORINPUT_MAX : REAL := REAL#4095.0;
  TEACHTIMEOUT : TIME := TIME#20s0ms;
END_VAR

VAR_INPUT
  TPSet : BOOL;
  SensorInput, TPy  : INT;
  OperationMode : OpMode;
END_VAR

VAR_OUTPUT
  SensorOutput : INT;
END_VAR

VAR
  initial          : BOOL;
  lastmode         : OpMode;
  Status           : TeachStatus;
  teachstep        : INT;
  x_temp, y_temp, t, m, x1, y1, x2, y2 : REAL;
  timeout          	: TON_B;
END_VAR

IF NOT initial THEN
  x1 := 0.0;
  y1 := 0.0;
  x2 := 0.0;
  y2 := 0.0;
  Status := TeachStatus#NoTeachPoints;
  initial := TRUE;
ELSE
  IF OperationMode = OpMode#Op THEN
    IF Status = TeachStatus#Ok AND INT_TO_REAL(SensorInput) >= SENSORINPUT_MIN AND INT_TO_REAL(SensorInput) <= SENSORINPUT_MAX THEN
      SensorOutput := REAL_TO_INT(m) * SensorInput + REAL_TO_INT(t);
    ELSE
      SensorOutput := 0;
    END_IF;
  ELSIF OperationMode = OpMode#Teach THEN
    IF lastmode <> OperationMode THEN
      teachstep := 0;
      timeout(IN := FALSE);
    END_IF;

    CASE teachstep OF
      0:
         Status := TeachStatus#Teaching;
         timeout(IN := TRUE, PT:=TIME_TO_INT(TEACHTIMEOUT));
         IF timeout.Q THEN
           OperationMode := OpMode#Op;
         END_IF;

         IF TPSet AND INT_TO_REAL(SensorInput) >= SENSORINPUT_MIN AND INT_TO_REAL(SensorInput) <= SENSORINPUT_MAX THEN
           y1 := INT_TO_REAL(TPy);
           x1 := INT_TO_REAL(SensorInput);
           teachstep := 1;
           timeout(IN := FALSE);
         END_IF;
      1:
         IF TPSet = FALSE THEN
           teachstep := 2;
         END_IF;
      2:
         timeout(IN := TRUE, PT:=TIME_TO_INT(TEACHTIMEOUT));

         IF timeout.Q THEN
           OperationMode := OpMode#Op;
         END_IF;

         IF TPSet AND INT_TO_REAL(SensorInput) >= SENSORINPUT_MIN
             AND INT_TO_REAL(SensorInput) <= SENSORINPUT_MAX THEN
           y2 := INT_TO_REAL(TPy);
           x2 := INT_TO_REAL(SensorInput);
           teachstep := 3;
           timeout(IN := FALSE);
         END_IF;
       3:
        IF x1 > x2 THEN
           x_temp := x1;
           y_temp := y1;
           x1 := x2;
           y1 := y2;
           x2 := x_temp;
           y2 := y_temp;
        END_IF;

        IF x2 - x1 <> 0.0 THEN
           m   := (y2 - y1) / (x2 - x1);
           t   := y1 - m * x1;
           Status := TeachStatus#Ok;
        ELSE
           Status := TeachStatus#InvalidTeachPoints;
           OperationMode := OpMode#Op;
         END_IF;
       END_CASE;
  END_IF;
END_IF;
  lastmode := OperationMode;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Analogsensor;
  END_RESOURCE
END_CONFIGURATION
