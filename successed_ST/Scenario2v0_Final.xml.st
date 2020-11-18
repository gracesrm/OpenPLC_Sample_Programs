TYPE
    MAGAZIN_STATES_T : (GREEN_LAMP , INIT , INTERSTEP , MAGAZIN_INIT , MAGAZIN_INIT_2 , SLIDER_MOVE_BACK , START_MAGAZIN , STEP0 , STEP1 , CONVEY);
    CRANE_STATES_T : (CRANE_INIT , CRANE_INIT_2 , CRANE_LIFT_CONVEYOR , CRANE_ON_CONVEYOR , CRANE_ON_CONVEYOR_METALLIC , CRANE_STOP , CRANE_TURN_LEFT_METALLIC , CRANE_TURN_LEFT_NOT_METALLIC , INIT , INTERSTEP , INTERSTEP_2 , INTERSTEP_CHECK_WORKPIECE , MAGAZIN_STOP , START_CRANE , STEP0 , TIMEDELAY , TURN_RIGHT , RELEASE);
END_TYPE

FUNCTION_BLOCK MAGAZIN
    VAR_INPUT  CRANEDOWN : BOOL; END_VAR 
    VAR_OUTPUT  CRANELOWER : BOOL; END_VAR 
    VAR_INPUT  CRANEONCONVEYOR : BOOL; END_VAR 
    VAR_INPUT  CRANEONMAGAZIN : BOOL; END_VAR 
    VAR_INPUT  CRANESUCKED : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCLOCKWISE : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
    VAR_INPUT  CRANEUP : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINGREENLAMP : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINSLIDER : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMOFF : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMON : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINWHITELAMP : BOOL; END_VAR 
    VAR  SFCINIT : BOOL; END_VAR 
    VAR_INPUT  SFCRESET : BOOL; END_VAR 
    VAR_INPUT  SLIDERMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  SLIDERNOTMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  STARTBUTTONMAGAZIN : BOOL; END_VAR 
    VAR_OUTPUT  STARTCOMMANDMAGAZIN : BOOL; END_VAR 
    VAR_INPUT  STARTVAR : BOOL; END_VAR 
    VAR_INPUT  WORKPIECEREADY : BOOL; END_VAR 
    VAR  _STATE : MAGAZIN_STATES_T; END_VAR 
    VAR  _TRANSIT : BOOL; END_VAR 
    VAR  INTERCONNECTMAGAZINSTARTCOMMAND : BOOL; END_VAR 
    
    CASE _STATE OF 
        MAGAZIN_STATES_T#GREEN_LAMP:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            MAGAZINGREENLAMP := TRUE;
            INTERCONNECTMAGAZINSTARTCOMMAND := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#MAGAZIN_INIT;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#INIT:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#START_MAGAZIN;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#INTERSTEP:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            STARTCOMMANDMAGAZIN := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF STARTVAR THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#CONVEY;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#MAGAZIN_INIT:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            MAGAZINSLIDER := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#MAGAZIN_INIT_2;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#MAGAZIN_INIT_2:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            MAGAZINSLIDER := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#INTERSTEP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#SLIDER_MOVE_BACK:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            IF ((SLIDERMOVEDOUT = TRUE) AND (SLIDERNOTMOVEDOUT = FALSE)) THEN
                MAGAZINSLIDER := FALSE;
            END_IF;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#STEP1;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#START_MAGAZIN:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            MAGAZINSLIDER := FALSE;
            MAGAZINGREENLAMP := FALSE;
            STARTVAR := FALSE;
            STARTCOMMANDMAGAZIN := FALSE;
            IF (STARTBUTTONMAGAZIN = TRUE) THEN
                INTERCONNECTMAGAZINSTARTCOMMAND := TRUE;
            END_IF;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF INTERCONNECTMAGAZINSTARTCOMMAND THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#GREEN_LAMP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#STEP0:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#SLIDER_MOVE_BACK;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#STEP1:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#INTERSTEP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        MAGAZIN_STATES_T#CONVEY:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            IF SLIDERNOTMOVEDOUT THEN
                MAGAZINSLIDER := TRUE;
            END_IF;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEONMAGAZIN THEN
                _TRANSIT := TRUE;
                _STATE := MAGAZIN_STATES_T#STEP0;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
            END_CASE;
END_FUNCTION_BLOCK

FUNCTION_BLOCK CRANE_FB
    VAR_INPUT  CRANEDOWN : BOOL; END_VAR 
    VAR_OUTPUT  CRANELOWER : BOOL; END_VAR 
    VAR_INPUT  CRANEONCONVEYOR : BOOL; END_VAR 
    VAR_INPUT  CRANEONMAGAZIN : BOOL; END_VAR 
    VAR_INPUT  CRANESUCKED : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCLOCKWISE : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
    VAR_INPUT  CRANEUP : BOOL; END_VAR 
    VAR_INPUT  MAGAZINCAPACITIVESENSOR : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMOFF : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMON : BOOL; END_VAR 
    VAR  SFCINIT : BOOL; END_VAR 
    VAR_INPUT  SFCRESET : BOOL; END_VAR 
    VAR_INPUT  SLIDERMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  SLIDERNOTMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  STARTBUTTONMAGAZIN : BOOL; END_VAR 
    VAR_OUTPUT  STARTCOMMANDCRANE : BOOL; END_VAR 
    VAR_INPUT  STARTVAR : BOOL; END_VAR 
    VAR  TIMEDELAY_TIMER : TON; END_VAR 
    VAR  TIMEDELAY_TIMER_DURATION : TIME := TIME#50MS; END_VAR 
    VAR  TIMEDELAY_TIMER_INTERCONNECT : BOOL; END_VAR 
    VAR_INPUT  WORKPIECEREADY : BOOL; END_VAR 
    VAR  _STATE : CRANE_STATES_T; END_VAR 
    VAR  _TRANSIT : BOOL; END_VAR 
    VAR  INTERCONNECTCRANESTARTCOMMAND : BOOL; END_VAR 
    
    CASE _STATE OF 
        CRANE_STATES_T#CRANE_INIT:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANELOWER := TRUE;
            INTERCONNECTCRANESTARTCOMMAND := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_INIT_2;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_INIT_2:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANELOWER := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_LIFT_CONVEYOR:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANELOWER := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_STOP:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#START_CRANE;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#INIT:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#START_CRANE;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#INTERSTEP:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            STARTCOMMANDCRANE := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF STARTVAR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP_2;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#INTERSTEP_2:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF SLIDERMOVEDOUT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TIMEDELAY;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#INTERSTEP_CHECK_WORKPIECE:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#MAGAZIN_STOP;
            ELSIF NOT WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_STOP;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#MAGAZIN_STOP:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCLOCKWISE := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            MAGAZINVACUUMON := TRUE;
            MAGAZINVACUUMOFF := FALSE;
            CRANELOWER := TRUE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANESUCKED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP0;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#START_CRANE:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANELOWER := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            STARTVAR := FALSE;
            STARTCOMMANDCRANE := FALSE;
            IF (STARTBUTTONMAGAZIN = TRUE) THEN
                INTERCONNECTCRANESTARTCOMMAND := TRUE;
            END_IF;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF INTERCONNECTCRANESTARTCOMMAND THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_INIT;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#STEP0:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANELOWER := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF (CRANEUP AND MAGAZINCAPACITIVESENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC;
            ELSIF (CRANEUP AND NOT MAGAZINCAPACITIVESENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#TIMEDELAY:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            TIMEDELAY_TIMER(IN := TRUE, PT := TIMEDELAY_TIMER_DURATION);
            TIMEDELAY_TIMER_INTERCONNECT := TIMEDELAY_TIMER.Q;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TIMEDELAY_TIMER_INTERCONNECT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TURN_RIGHT;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#TURN_RIGHT:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF CRANEONMAGAZIN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP_CHECK_WORKPIECE;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
        CRANE_STATES_T#RELEASE:
            (* BEGIN(STATE) *)
            (* BEGIN(ONENTRY) *)
            _TRANSIT := FALSE;
            (* END(ONENTRY) *)
            (* BEGIN(ONACTIVE) *)
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            (* END(ONACTIVE) *)
            (* BEGIN(TRANSITION) *)
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_CONVEYOR;
            END_IF;
            (* END(TRANSITION) *)
            (* BEGIN(ONEXIT) *)
            (* END(ONEXIT) *)
            (* END(STATE) *)
        
            END_CASE;
END_FUNCTION_BLOCK

PROGRAM MAIN

VAR  ACTUATOR_CRANELOWER : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINGREENLAMP : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINSLIDER : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMOFF : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMON : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINWHITELAMP : BOOL; END_VAR 
VAR  CRANE : CRANE_FB; END_VAR 
VAR  MAG : MAGAZIN; END_VAR 
VAR  SENSOR_CRANEDOWN : BOOL; END_VAR 
VAR  SENSOR_CRANEONCONVEYOR : BOOL; END_VAR 
VAR  SENSOR_CRANEONMAGAZIN : BOOL; END_VAR 
VAR  SENSOR_CRANEPOSITION : BOOL; END_VAR 
VAR  SENSOR_CRANEPOSITIONSTAMP : BOOL; END_VAR 
VAR  SENSOR_CRANESUCKED : BOOL; END_VAR 
VAR  SENSOR_CRANEUP : BOOL; END_VAR 
VAR  SENSOR_MAGAZINCAPACITIVESENSOR : BOOL; END_VAR 
VAR  SENSOR_MAGAZINEMERGENCYSTOP : BOOL; END_VAR 
VAR  SENSOR_MAGAZINOPTICALSENSOR : BOOL; END_VAR 
VAR  SENSOR_MAGAZINSWITCHMANUELLAUTOMATIC : BOOL; END_VAR 
VAR  SENSOR_SLIDERMOVEDOUT : BOOL; END_VAR 
VAR  SENSOR_SLIDERNOTMOVEDOUT : BOOL; END_VAR 
VAR  SENSOR_STARTBUTTONMAGAZIN : BOOL; END_VAR 
VAR  SENSOR_WORKPIECEREADY : BOOL; END_VAR 
MAG.SLIDERNOTMOVEDOUT := SENSOR_SLIDERNOTMOVEDOUT;
MAG.SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
MAG.CRANEONMAGAZIN := SENSOR_CRANEONMAGAZIN;
MAG.CRANEDOWN := SENSOR_CRANEDOWN;
MAG.CRANEUP := SENSOR_CRANEUP;
MAG.CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
MAG.WORKPIECEREADY := SENSOR_WORKPIECEREADY;
MAG.STARTBUTTONMAGAZIN := SENSOR_STARTBUTTONMAGAZIN;
ACTUATOR_MAGAZINSLIDER := MAG.MAGAZINSLIDER;
ACTUATOR_MAGAZINGREENLAMP := MAG.MAGAZINGREENLAMP;
CRANE.WORKPIECEREADY := SENSOR_WORKPIECEREADY;
CRANE.CRANEUP := SENSOR_CRANEUP;
CRANE.CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
CRANE.CRANEDOWN := SENSOR_CRANEDOWN;
CRANE.CRANESUCKED := SENSOR_CRANESUCKED;
CRANE.CRANEONMAGAZIN := SENSOR_CRANEONMAGAZIN;
CRANE.MAGAZINCAPACITIVESENSOR := SENSOR_MAGAZINCAPACITIVESENSOR;
CRANE.SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
CRANE.STARTBUTTONMAGAZIN := SENSOR_STARTBUTTONMAGAZIN;
ACTUATOR_CRANETURNCOUNTERCLOCKWISE := CRANE.CRANETURNCOUNTERCLOCKWISE;
ACTUATOR_CRANETURNCLOCKWISE := CRANE.CRANETURNCLOCKWISE;
ACTUATOR_CRANELOWER := CRANE.CRANELOWER;
ACTUATOR_MAGAZINVACUUMOFF := CRANE.MAGAZINVACUUMOFF;
ACTUATOR_MAGAZINVACUUMON := CRANE.MAGAZINVACUUMON;
IF SENSOR_MAGAZINEMERGENCYSTOP THEN
    MAG();
    CRANE();
    IF ACTUATOR_MAGAZINGREENLAMP THEN
        IF (CRANE.STARTCOMMANDCRANE AND MAG.STARTCOMMANDMAGAZIN) THEN
            CRANE.STARTVAR := TRUE;
            MAG.STARTVAR := TRUE;
        END_IF;
    END_IF;
    CRANE.SFCRESET := FALSE;
    MAG.SFCRESET := FALSE;
ELSIF NOT SENSOR_MAGAZINEMERGENCYSTOP THEN
    ACTUATOR_MAGAZINSLIDER := FALSE;
    ACTUATOR_CRANELOWER := FALSE;
    ACTUATOR_MAGAZINVACUUMON := FALSE;
    ACTUATOR_MAGAZINVACUUMOFF := TRUE;
    ACTUATOR_MAGAZINGREENLAMP := FALSE;
    ACTUATOR_CRANETURNCOUNTERCLOCKWISE := FALSE;
    ACTUATOR_CRANETURNCLOCKWISE := FALSE;
    CRANE.SFCRESET := TRUE;
    MAG.SFCRESET := TRUE;
    CRANE.STARTVAR := FALSE;
    MAG.STARTVAR := FALSE;
END_IF;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MAIN;
  END_RESOURCE
END_CONFIGURATION
