TYPE
  OPERATIONMODE : (LEARN , ACTIVE);
END_TYPE

FUNCTION SEL : INT
VAR_INPUT
        G : BOOL;
        A,B : INT;
END_VAR

IF G THEN SEL := A;
     ELSE SEL := B; END_IF;

END_FUNCTION


FUNCTION MAX : INT
VAR_INPUT
        IN0 : INT;
        IN1 : INT;
END_VAR

MAX := SEL(IN0>=IN1, IN0, IN1);

END_FUNCTION

FUNCTION MIN : INT
VAR_INPUT
        IN0 : INT;
        IN1 : INT;
END_VAR

MIN := SEL(IN0<=IN1, IN0, IN1);

END_FUNCTION


PROGRAM MINMAX

VAR CONSTANT
    WAIT_BEFORE_WARNING : INT := 3; (*   AMOUNT OF CYCLES OUTSIDE  BEFORE GIVEN A WARNING.*)
    WAIT_AFTER_WARNING  : INT := 3; (*   AMOUNT OF CYCLES INSIDE, BEFORE WITHDRAW WARNING.*)
END_VAR

VAR_INPUT
  MODE     : OPERATIONMODE; (* LEARNING OR ACTIVE MODE *)
  LEARN    : BOOL;          (* TRUE IFF CURRENT SIGNAL SHOULD BE LEARNT *)
   I        : INT;           (* INPUT SIGNAL*)
 END_VAR

VAR_OUTPUT
        W       : BOOL;     (* WARNING FLAG, IFF _I \NOT\IN [LOWER,UPPER]_*)
        Q       : INT;      (* TRUNCATED INPUT SIGNAL*)
END_VAR

VAR
        LOWER : INT :=  32766;  (* MINIMAL TEACHED VALUE*)
        UPPER : INT := -32767;  (* MAXIMAL TEACH VALUE*)
        CNTQUENCH : INT := 3;   (* REMAINING CYCLES FOR WITHDRAW WARNING*)
        CNTHEAT   : INT := 3;   (* REMAINING CYCLES TO SIGNAL WARNING*)
 END_VAR


IF MODE = OPERATIONMODE#LEARN THEN (* GO INTO LEARNING*)
        IF LEARN THEN
                LOWER := MIN(LOWER, I);
                UPPER := MAX(UPPER, I);
        END_IF;
        Q := 0;
        W := FALSE;
ELSE
        IF UPPER < LOWER THEN
                Q := 0;
                W := TRUE;
        ELSE
                Q := MIN( UPPER, MAX( LOWER, I) );
                IF I <> Q THEN
                        CNTHEAT := CNTHEAT - 1;
                        CNTQUENCH := WAIT_AFTER_WARNING;
                        IF CNTHEAT = 0 THEN
                                W := TRUE;
                        END_IF;
                ELSE
                        CNTQUENCH := CNTQUENCH - 1;
                        CNTHEAT := WAIT_BEFORE_WARNING;
                        IF CNTQUENCH = 0 THEN
                                W := FALSE;
                        END_IF;
                END_IF;
         END_IF;
END_IF;

END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MINMAX;
  END_RESOURCE
END_CONFIGURATION
