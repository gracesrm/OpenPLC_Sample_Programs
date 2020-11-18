TYPE
    MAGAZIN_STATES_T : (GREEN_LAMP , INIT , INTERSTEP , MAGAZIN_INIT , MAGAZIN_INIT_2 , SLIDER_MOVE_BACK , START_MAGAZIN , STEP0 , STEP1 , CONVEY);
    CONVEYOR_STATES_T : (CONVEYOR_INIT , CONVEYOR_TOWARDS_STACKER , CONVEYOR_INIT_2 , GREEN_LAMP , INIT , INTERSTEP , START_CONVEYOR);
    STAMP_STATES_T : (GREEN_LAMP , INIT , INTERSTEP , INTERSTEP_2 , STAMPPROCESS , STAMPSLIDERBACK , STAMPSLIDERFORWARD , STAMP_INIT_1 , STAMP_INIT_2 , STAMP_INIT_3 , STAMP_INIT_4 , START_STAMP , STEP0 , STEP1 , STEP2);
    CRANE_STATES_T : (CRANE_GO_UP , CRANE_GO_UP_WHITE , CRANE_INIT , CRANE_INIT_2 , CRANE_LIFT_AT_STAMP , CRANE_LIFT_AT_STAMP2 , CRANE_LIFT_CONVEYOR , CRANE_LIFT_CONVEYOR2 , CRANE_LIFT_CONVEYOR_BLACK , CRANE_LIFT_MAGAZIN , CRANE_LIFT_MAGAZIN_METALLIC , CRANE_LIFT_MAGAZIN_WHITE , CRANE_LIFT_NOT_METALLIC_BLACK , CRANE_LOWER , CRANE_ON_CONVEYOR , CRANE_ON_CONVEYOR_METALLIC , CRANE_ON_CONVEYOR_METALLIC2 , CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK , CRANE_ON_STAMP_METALLIC , CRANE_ON_STAMP_METALLIC2 , CRANE_ON_STAMP_METALLIC2_LOWER , CRANE_ON_STAMP_STOP_BLACK , CRANE_ON_STAMP_WHITE , CRANE_TURN_LEFT_BACK_TO_STAMP , CRANE_TURN_LEFT_FROM_STAMP , CRANE_TURN_LEFT_METALLIC , CRANE_TURN_LEFT_METALLIC2 , CRANE_TURN_LEFT_NOT_METALLIC , CRANE_TURN_LEFT_NOT_METALLIC_BLACK , CRANE_TURN_LEFT_WHITE , CRANE_TURN_RIGHT_FROM_STAMP , INIT , INTERSTEP , INTERSTEP_2 , INTERSTEP_3 , INTERSTEP_4 , LOWER_CRANE , MAGAZIN_STOP , MAGAZIN_STOP_BLACK , MAGAZIN_STOP_FINAL , NO_WORKPIECE_READY , RESET_INTERCONNECT , STAMP_PRESSURE_PROFILE_SET_METALLIC , STAMP_PRESSURE_PROFILE_SET_WHITE , START_CRANE , STEP0 , STEP2 , STEP3 , STEP4 , SUCK_AT_STAMP , SUCK_AT_STAMP2 , TIMEDELAY , TURN_RIGHT , TURN_RIGHT_BLACK , TURN_RIGHT_FINAL , PAUSE , RELEASE , RELEASE2 , RELEASE_BLACK , RELEASE_WORKPIECE , RELEASE_WORKPIECE_WHITE);
END_TYPE


FUNCTION_BLOCK CRANE_FB
    VAR_OUTPUT  ANALOGCRANEPRESSURE : INT; END_VAR 
    VAR_INPUT  CRANEDOWN : BOOL; END_VAR 
    VAR_OUTPUT  CRANELOWER : BOOL; END_VAR 
    VAR_INPUT  CRANEONCONVEYOR : BOOL; END_VAR 
    VAR_INPUT  CRANEONMAGAZIN : BOOL; END_VAR 
    VAR_INPUT  CRANEPOSITIONSTAMP : BOOL; END_VAR 
    VAR_INPUT  CRANESUCKED : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCLOCKWISE : BOOL; END_VAR 
    VAR_OUTPUT  CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
    VAR_INPUT  CRANEUP : BOOL; END_VAR 
    VAR  DURATION1 : TIME := TIME#1S500MS; END_VAR 
    VAR_INPUT  MAGAZINCAPACITIVESENSOR : BOOL; END_VAR 
    VAR_INPUT  MAGAZINOPTICALSENSOR : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMOFF : BOOL; END_VAR 
    VAR_OUTPUT  MAGAZINVACUUMON : BOOL; END_VAR 
    VAR  SFCINIT : BOOL; END_VAR 
    VAR_INPUT  SFCRESET : BOOL; END_VAR 
    VAR_INPUT  SLIDERMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  SLIDERNOTMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  STAMPLOWERED : BOOL; END_VAR 
    VAR_INPUT  STAMPSLIDERFILLED : BOOL; END_VAR 
    VAR_INPUT  STAMPSLIDERSENSORMOVEDOUT : BOOL; END_VAR 
    VAR_INPUT  STARTBUTTONMAGAZIN : BOOL; END_VAR 
    VAR_OUTPUT  STARTCOMMANDCRANE : BOOL; END_VAR 
    VAR_INPUT  STARTVAR : BOOL; END_VAR 
    VAR  TIMEDELAY_TIMER : TON; END_VAR 
    VAR  TIMEDELAY_TIMER_DURATION : TIME := TIME#50MS; END_VAR 
    VAR  TIMEDELAY_TIMER_INTERCONNECT : BOOL; END_VAR 
    VAR  TIMER1 : TON; END_VAR 
    VAR_INPUT  WORKPIECEREADY : BOOL; END_VAR 
    VAR  _STATE : CRANE_STATES_T; END_VAR 
    VAR  _TRANSIT : BOOL; END_VAR 
    VAR  ACTUALTIME1 : TIME; END_VAR 
    VAR  INTERCONNECT : BOOL; END_VAR 
    VAR  INTERCONNECTCRANESTARTCOMMAND : BOOL; END_VAR 
    
    CASE _STATE OF 
        CRANE_STATES_T#CRANE_GO_UP:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP3;
            END_IF;
        
        CRANE_STATES_T#CRANE_GO_UP_WHITE:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP3;
            END_IF;
        
        CRANE_STATES_T#CRANE_INIT:
            _TRANSIT := FALSE;
            CRANELOWER := TRUE;
            INTERCONNECTCRANESTARTCOMMAND := FALSE;
            ANALOGCRANEPRESSURE := INT#6000;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_INIT_2;
            END_IF;
        
        CRANE_STATES_T#CRANE_INIT_2:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_AT_STAMP:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_FROM_STAMP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_AT_STAMP2:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_RIGHT_FROM_STAMP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_CONVEYOR:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_CONVEYOR2:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_CONVEYOR_BLACK:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_BACK_TO_STAMP;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_MAGAZIN:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_MAGAZIN_METALLIC:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_MAGAZIN_WHITE:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_WHITE;
            END_IF;
        
        CRANE_STATES_T#CRANE_LIFT_NOT_METALLIC_BLACK:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            IF CRANEUP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC_BLACK;
            END_IF;
        
        CRANE_STATES_T#CRANE_LOWER:
            _TRANSIT := FALSE;
            MAGAZINVACUUMON := TRUE;
            MAGAZINVACUUMOFF := FALSE;
            CRANELOWER := TRUE;
            ANALOGCRANEPRESSURE := INT#0;
            IF CRANESUCKED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP0;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC2:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE2;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE_BLACK;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_STAMP_METALLIC:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE_WORKPIECE;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_STAMP_METALLIC2:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            IF STAMPLOWERED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP_4;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_STAMP_METALLIC2_LOWER:
            _TRANSIT := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#SUCK_AT_STAMP2;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_STAMP_STOP_BLACK:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RESET_INTERCONNECT;
            END_IF;
        
        CRANE_STATES_T#CRANE_ON_STAMP_WHITE:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RELEASE_WORKPIECE_WHITE;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_BACK_TO_STAMP:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEPOSITIONSTAMP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_STAMP_STOP_BLACK;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_FROM_STAMP:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEPOSITIONSTAMP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_STAMP_METALLIC;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC2:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEPOSITIONSTAMP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_STAMP_METALLIC2;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_NOT_METALLIC_BLACK:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_LEFT_WHITE:
            _TRANSIT := FALSE;
            CRANETURNCOUNTERCLOCKWISE := TRUE;
            CRANETURNCLOCKWISE := FALSE;
            IF CRANEPOSITIONSTAMP THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_STAMP_WHITE;
            END_IF;
        
        CRANE_STATES_T#CRANE_TURN_RIGHT_FROM_STAMP:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF CRANEONCONVEYOR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_CONVEYOR_METALLIC2;
            END_IF;
        
        CRANE_STATES_T#INIT:
            _TRANSIT := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#START_CRANE;
            END_IF;
        
        CRANE_STATES_T#INTERSTEP:
            _TRANSIT := FALSE;
            STARTCOMMANDCRANE := TRUE;
            IF STARTVAR THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP_2;
            END_IF;
        
        CRANE_STATES_T#INTERSTEP_2:
            _TRANSIT := FALSE;
            IF SLIDERMOVEDOUT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TIMEDELAY;
            END_IF;
        
        CRANE_STATES_T#INTERSTEP_3:
            _TRANSIT := FALSE;
            IF NOT WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#NO_WORKPIECE_READY;
            ELSIF WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TURN_RIGHT;
            END_IF;
        
        CRANE_STATES_T#INTERSTEP_4:
            _TRANSIT := FALSE;
            IF STAMPSLIDERSENSORMOVEDOUT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_ON_STAMP_METALLIC2_LOWER;
            END_IF;
        
        CRANE_STATES_T#LOWER_CRANE:
            _TRANSIT := FALSE;
            CRANELOWER := TRUE;
            IF CRANEDOWN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#SUCK_AT_STAMP;
            END_IF;
        
        CRANE_STATES_T#MAGAZIN_STOP:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LOWER;
            END_IF;
        
        CRANE_STATES_T#MAGAZIN_STOP_BLACK:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            MAGAZINVACUUMON := TRUE;
            MAGAZINVACUUMOFF := FALSE;
            CRANELOWER := TRUE;
            IF CRANESUCKED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_NOT_METALLIC_BLACK;
            END_IF;
        
        CRANE_STATES_T#MAGAZIN_STOP_FINAL:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#START_CRANE;
            END_IF;
        
        CRANE_STATES_T#NO_WORKPIECE_READY:
            _TRANSIT := FALSE;
            MAGAZINVACUUMON := FALSE;
            MAGAZINVACUUMOFF := FALSE;
            CRANELOWER := FALSE;
            IF STAMPSLIDERFILLED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_TURN_LEFT_METALLIC2;
            ELSIF NOT STAMPSLIDERFILLED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TURN_RIGHT_FINAL;
            END_IF;
        
        CRANE_STATES_T#RESET_INTERCONNECT:
            _TRANSIT := FALSE;
            INTERCONNECT := FALSE;
            TIMER1(IN := FALSE, PT := TIME#1MS);
            IF SLIDERMOVEDOUT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#LOWER_CRANE;
            END_IF;
        
        CRANE_STATES_T#STAMP_PRESSURE_PROFILE_SET_METALLIC:
            _TRANSIT := FALSE;
            ANALOGCRANEPRESSURE := INT#7000;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_MAGAZIN_METALLIC;
            END_IF;
        
        CRANE_STATES_T#STAMP_PRESSURE_PROFILE_SET_WHITE:
            _TRANSIT := FALSE;
            ANALOGCRANEPRESSURE := INT#6000;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_MAGAZIN_WHITE;
            END_IF;
        
        CRANE_STATES_T#START_CRANE:
            _TRANSIT := FALSE;
            CRANELOWER := FALSE;
            MAGAZINVACUUMOFF := FALSE;
            MAGAZINVACUUMON := FALSE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            CRANETURNCLOCKWISE := FALSE;
            ANALOGCRANEPRESSURE := INT#0;
            STARTVAR := FALSE;
            STARTCOMMANDCRANE := FALSE;
            IF (STARTBUTTONMAGAZIN = TRUE) THEN
                INTERCONNECTCRANESTARTCOMMAND := TRUE;
            END_IF;
            IF INTERCONNECTCRANESTARTCOMMAND THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_INIT;
            END_IF;
        
        CRANE_STATES_T#STEP0:
            _TRANSIT := FALSE;
            IF (NOT MAGAZINCAPACITIVESENSOR AND MAGAZINOPTICALSENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STAMP_PRESSURE_PROFILE_SET_WHITE;
            ELSIF (NOT MAGAZINCAPACITIVESENSOR AND NOT MAGAZINOPTICALSENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_MAGAZIN;
            ELSIF (MAGAZINCAPACITIVESENSOR AND MAGAZINOPTICALSENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STAMP_PRESSURE_PROFILE_SET_METALLIC;
            END_IF;
        
        CRANE_STATES_T#STEP2:
            _TRANSIT := FALSE;
            IF (NOT MAGAZINCAPACITIVESENSOR AND NOT MAGAZINOPTICALSENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#TURN_RIGHT_BLACK;
            ELSIF (MAGAZINCAPACITIVESENSOR OR MAGAZINOPTICALSENSOR) THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#PAUSE;
            END_IF;
        
        CRANE_STATES_T#STEP3:
            _TRANSIT := FALSE;
            IF WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP2;
            ELSIF NOT WORKPIECEREADY THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#STEP4;
            END_IF;
        
        CRANE_STATES_T#STEP4:
            _TRANSIT := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP;
            END_IF;
        
        CRANE_STATES_T#SUCK_AT_STAMP:
            _TRANSIT := FALSE;
            MAGAZINVACUUMON := TRUE;
            MAGAZINVACUUMOFF := FALSE;
            IF CRANESUCKED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_AT_STAMP;
            END_IF;
        
        CRANE_STATES_T#SUCK_AT_STAMP2:
            _TRANSIT := FALSE;
            MAGAZINVACUUMON := TRUE;
            MAGAZINVACUUMOFF := FALSE;
            IF CRANESUCKED THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_AT_STAMP2;
            END_IF;
        
        CRANE_STATES_T#TIMEDELAY:
            _TRANSIT := FALSE;
            TIMEDELAY_TIMER(IN := TRUE, PT := TIMEDELAY_TIMER_DURATION);
            TIMEDELAY_TIMER_INTERCONNECT := TIMEDELAY_TIMER.Q;
            IF TIMEDELAY_TIMER_INTERCONNECT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#INTERSTEP_3;
            END_IF;
        
        CRANE_STATES_T#TURN_RIGHT:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF CRANEONMAGAZIN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#MAGAZIN_STOP;
            END_IF;
        
        CRANE_STATES_T#TURN_RIGHT_BLACK:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            IF CRANEONMAGAZIN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#MAGAZIN_STOP_BLACK;
            END_IF;
        
        CRANE_STATES_T#TURN_RIGHT_FINAL:
            _TRANSIT := FALSE;
            CRANETURNCLOCKWISE := TRUE;
            CRANETURNCOUNTERCLOCKWISE := FALSE;
            ANALOGCRANEPRESSURE := INT#0;
            IF CRANEONMAGAZIN THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#MAGAZIN_STOP_FINAL;
            END_IF;
        
        CRANE_STATES_T#PAUSE:
            _TRANSIT := FALSE;
            TIMER1(IN := CRANEUP, PT := DURATION1);
            INTERCONNECT := TIMER1.Q;
            IF INTERCONNECT THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#RESET_INTERCONNECT;
            END_IF;
        
        CRANE_STATES_T#RELEASE:
            _TRANSIT := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_CONVEYOR;
            END_IF;
        
        CRANE_STATES_T#RELEASE2:
            _TRANSIT := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_CONVEYOR2;
            END_IF;
        
        CRANE_STATES_T#RELEASE_BLACK:
            _TRANSIT := FALSE;
            MAGAZINVACUUMON := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_LIFT_CONVEYOR_BLACK;
            END_IF;
        
        CRANE_STATES_T#RELEASE_WORKPIECE:
            _TRANSIT := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_GO_UP;
            END_IF;
        
        CRANE_STATES_T#RELEASE_WORKPIECE_WHITE:
            _TRANSIT := FALSE;
            MAGAZINVACUUMOFF := TRUE;
            MAGAZINVACUUMON := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CRANE_STATES_T#CRANE_GO_UP_WHITE;
            END_IF;
        
            END_CASE;
END_FUNCTION_BLOCK




FUNCTION_BLOCK Magazin
    VAR CraneDown : BOOL; END_VAR  
    VAR CraneLower : BOOL; END_VAR  
    VAR CraneOnConveyor : BOOL; END_VAR  
    VAR CraneOnMagazin : BOOL; END_VAR  
    VAR CraneSucked : BOOL; END_VAR  
    VAR CraneTurnClockwise : BOOL; END_VAR  
    VAR CraneTurnCounterclockwise : BOOL; END_VAR  
    VAR CraneUp : BOOL; END_VAR  
    VAR MagazinGreenLamp : BOOL; END_VAR  
    VAR MagazinSlider : BOOL; END_VAR  
    VAR MagazinVacuumOff : BOOL; END_VAR  
    VAR MagazinVacuumOn : BOOL; END_VAR  
    VAR MagazinWhiteLamp : BOOL; END_VAR  
    VAR SFCInit : BOOL; END_VAR 
    VAR SFCReset : BOOL; END_VAR  
    VAR SliderMovedOut : BOOL; END_VAR  
    VAR SliderNotMovedOut : BOOL; END_VAR  
    VAR StartButtonMagazin : BOOL; END_VAR  
    VAR StartCommandMagazin : BOOL; END_VAR  
    VAR StartVar : BOOL; END_VAR  
    VAR WorkpieceReady : BOOL; END_VAR  
    VAR _state : Magazin_states_t; END_VAR 
    VAR _transit : BOOL; END_VAR 
    VAR interconnectMagazinStartCommand : BOOL; END_VAR 
    
    CASE _state OF 
        Magazin_states_t#Green_Lamp:
            _transit := FALSE;
            MagazinGreenLamp := TRUE;
            interconnectMagazinStartCommand := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Magazin_states_t#Magazin_Init;
            END_IF;
        
        Magazin_states_t#Init:
            _transit := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Magazin_states_t#Start_Magazin;
            END_IF;
        
        Magazin_states_t#Interstep:
            _transit := FALSE;
            StartCommandMagazin := TRUE;
            IF StartVar THEN
                _transit := TRUE;
                _state := Magazin_states_t#convey;
            END_IF;
        
        Magazin_states_t#Magazin_Init:
            _transit := FALSE;
            MagazinSlider := TRUE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Magazin_states_t#Magazin_Init_2;
            END_IF;
        
        Magazin_states_t#Magazin_Init_2:
            _transit := FALSE;
            MagazinSlider := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Magazin_states_t#Interstep;
            END_IF;
        
        Magazin_states_t#Slider_Move_Back:
            _transit := FALSE;
            IF ((SliderMovedOut = TRUE) AND (SliderNotMovedOut = FALSE)) THEN
                MagazinSlider := FALSE;
            END_IF;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Magazin_states_t#Step1;
            END_IF;
        
        Magazin_states_t#Start_Magazin:
            _transit := FALSE;
            MagazinSlider := FALSE;
            MagazinGreenLamp := FALSE;
            StartVar := FALSE;
            StartCommandMagazin := FALSE;
            IF (StartButtonMagazin = TRUE) THEN
                interconnectMagazinStartCommand := TRUE;
            END_IF;
            IF interconnectMagazinStartCommand THEN
                _transit := TRUE;
                _state := Magazin_states_t#Green_Lamp;
            END_IF;
        
        Magazin_states_t#Step0:
            _transit := FALSE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Magazin_states_t#Slider_Move_Back;
            END_IF;
        
        Magazin_states_t#Step1:
            _transit := FALSE;
            IF CraneOnConveyor THEN
                _transit := TRUE;
                _state := Magazin_states_t#Interstep;
            END_IF;
        
        Magazin_states_t#convey:
            _transit := FALSE;
            IF SliderNotMovedOut THEN
                MagazinSlider := TRUE;
            END_IF;
            IF CraneOnMagazin THEN
                _transit := TRUE;
                _state := Magazin_states_t#Step0;
            END_IF;
        
            END_CASE;
END_FUNCTION_BLOCK

FUNCTION_BLOCK Stamp_FB
    VAR_INPUT  CraneDown : BOOL; END_VAR  
    VAR_INPUT  CraneOnConveyor : BOOL; END_VAR  
    VAR_INPUT  CranePositionStamp : BOOL; END_VAR  
    VAR_INPUT  CraneSucked : BOOL; END_VAR  
    VAR_INPUT  CraneUp : BOOL; END_VAR  
    VAR  Duration : TIME := TIME#500.0ms; END_VAR  
    VAR  SFCInit : BOOL; END_VAR  
    VAR_INPUT  SFCReset : BOOL; END_VAR  
    VAR_OUTPUT  StampGreenLamp : BOOL; END_VAR  
    VAR_INPUT  StampLowered : BOOL; END_VAR  
    VAR_OUTPUT  StampPressure : BOOL; END_VAR  
    VAR_OUTPUT  StampPusher : BOOL; END_VAR  
    VAR_INPUT  StampSliderFilled : BOOL; END_VAR  
    VAR_OUTPUT  StampSliderMovedIn : BOOL; END_VAR  
    VAR_OUTPUT  StampSliderMovedOut : BOOL; END_VAR  
    VAR_INPUT  StampSliderSensorMovedIn : BOOL; END_VAR  
    VAR_INPUT  StampSliderSensorMovedOut : BOOL; END_VAR  
    VAR_INPUT  StampStartButton : BOOL; END_VAR  
    VAR_INPUT  StampUp : BOOL; END_VAR  
    VAR_OUTPUT  StampWhiteLamp : BOOL; END_VAR  
    VAR_OUTPUT  StartCommandStamp : BOOL; END_VAR  
    VAR_INPUT  StartVar : BOOL; END_VAR  
    VAR  Timer : TON; END_VAR  
    VAR  _state : Stamp_states_t; END_VAR  
    VAR  _transit : BOOL; END_VAR  
    VAR  interconnect : BOOL; END_VAR  
    VAR  interconnectStampStartCommand : BOOL; END_VAR  
    
    CASE _state OF 
        Stamp_states_t#Green_Lamp:
            _transit := FALSE;
            StampGreenLamp := TRUE;
            interconnectStampStartCommand := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Stamp_states_t#Stamp_Init_1;
            END_IF;
        
        Stamp_states_t#Init:
            _transit := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Stamp_states_t#Start_Stamp;
            END_IF;
        
        Stamp_states_t#Interstep:
            _transit := FALSE;
            StartCommandStamp := TRUE;
            IF StartVar THEN
                _transit := TRUE;
                _state := Stamp_states_t#Interstep_2;
            END_IF;
        
        Stamp_states_t#Interstep_2:
            _transit := FALSE;
            IF StampSliderFilled THEN
                _transit := TRUE;
                _state := Stamp_states_t#Step0;
            END_IF;
        
        Stamp_states_t#StampProcess:
            _transit := FALSE;
            StampSliderMovedIn := FALSE;
            StampPusher := TRUE;
            IF StampLowered THEN
                _transit := TRUE;
                _state := Stamp_states_t#Step1;
            END_IF;
        
        Stamp_states_t#StampSliderBack:
            _transit := FALSE;
            StampSliderMovedIn := TRUE;
            StampSliderMovedOut := FALSE;
            IF StampSliderSensorMovedIn THEN
                _transit := TRUE;
                _state := Stamp_states_t#StampProcess;
            END_IF;
        
        Stamp_states_t#StampSliderForward:
            _transit := FALSE;
            StampPusher := FALSE;
            StampSliderMovedOut := TRUE;
            IF ((StampLowered = FALSE) AND (StampUp = TRUE)) THEN
                interconnect := FALSE;
            END_IF;
            Timer(IN := FALSE, PT := TIME#1ms);
            IF StampSliderMovedOut THEN
                _transit := TRUE;
                _state := Stamp_states_t#Step2;
            END_IF;
        
        Stamp_states_t#Stamp_Init_1:
            _transit := FALSE;
            StampSliderMovedIn := TRUE;
            StampSliderMovedOut := FALSE;
            IF StampSliderSensorMovedIn THEN
                _transit := TRUE;
                _state := Stamp_states_t#Stamp_Init_2;
            END_IF;
        
        Stamp_states_t#Stamp_Init_2:
            _transit := FALSE;
            StampSliderMovedIn := FALSE;
            StampSliderMovedOut := TRUE;
            IF StampSliderSensorMovedOut THEN
                _transit := TRUE;
                _state := Stamp_states_t#Stamp_Init_3;
            END_IF;
        
        Stamp_states_t#Stamp_Init_3:
            _transit := FALSE;
            StampPusher := TRUE;
            IF StampLowered THEN
                _transit := TRUE;
                _state := Stamp_states_t#Stamp_Init_4;
            END_IF;
        
        Stamp_states_t#Stamp_Init_4:
            _transit := FALSE;
            StampPusher := FALSE;
            IF StampUp THEN
                _transit := TRUE;
                _state := Stamp_states_t#Interstep;
            END_IF;
        
        Stamp_states_t#Start_Stamp:
            _transit := FALSE;
            StampSliderMovedOut := FALSE;
            StampSliderMovedIn := FALSE;
            StampPusher := FALSE;
            StampGreenLamp := FALSE;
            StampPressure := FALSE;
            StartCommandStamp := FALSE;
            IF (StampStartButton = TRUE) THEN
                interconnectStampStartCommand := TRUE;
            END_IF;
            IF interconnectStampStartCommand THEN
                _transit := TRUE;
                _state := Stamp_states_t#Green_Lamp;
            END_IF;
        
        Stamp_states_t#Step0:
            _transit := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Stamp_states_t#StampSliderBack;
            END_IF;
        
        Stamp_states_t#Step1:
            _transit := FALSE;
            Timer(IN := StampLowered, PT := TIME#12ms);
            interconnect := Timer.Q;
            IF interconnect THEN
                _transit := TRUE;
                _state := Stamp_states_t#StampSliderForward;
            END_IF;
        
        Stamp_states_t#Step2:
            _transit := FALSE;
            IF (CraneOnConveyor AND NOT StampSliderFilled) THEN
                _transit := TRUE;
                _state := Stamp_states_t#Interstep;
            END_IF;
        
            END_CASE;
END_FUNCTION_BLOCK



FUNCTION_BLOCK CONVEYOR_FB
    VAR  DURATION_CONVEYOR_TEST : TIME := TIME#1S; END_VAR 
    VAR  SFCINIT : BOOL; END_VAR 
    VAR_INPUT  SFCRESET : BOOL; END_VAR 
    VAR_OUTPUT  SORTERCONVEYORTOWARDSCRANE : BOOL; END_VAR 
    VAR_OUTPUT  SORTERCONVEYORTOWARDSSTACKER : BOOL; END_VAR 
    VAR_OUTPUT  SORTERGREENLAMPCONVEYOR : BOOL; END_VAR 
    VAR_INPUT  SORTERSTARTBUTTON : BOOL; END_VAR 
    VAR_INPUT  SORTERSWITCHMANUELLAUTOMATIC : BOOL; END_VAR 
    VAR_OUTPUT  SORTERWHITELAMPCONVEYOR : BOOL; END_VAR 
    VAR_OUTPUT  STARTCOMMANDCONVEYOR : BOOL; END_VAR 
    VAR_INPUT  STARTVAR : BOOL; END_VAR 
    VAR  TIMER_CONVEYOR_TEST : TON; END_VAR 
    VAR  _STATE : CONVEYOR_STATES_T; END_VAR 
    VAR  _TRANSIT : BOOL; END_VAR 
    VAR  INTERCONNECTCONVEYORSTARTCOMMAND : BOOL; END_VAR 
    VAR  INTERCONNECTCONVEYORTERMINATIONCOMMAND : BOOL; END_VAR 
    VAR  INTERCONNECT_CONVEYOR_TEST : BOOL; END_VAR 
    
    CASE _STATE OF 
        CONVEYOR_STATES_T#CONVEYOR_INIT:
            _TRANSIT := FALSE;
            SORTERCONVEYORTOWARDSSTACKER := TRUE;
            SORTERCONVEYORTOWARDSCRANE := FALSE;
            TIMER_CONVEYOR_TEST(IN := TRUE, PT := DURATION_CONVEYOR_TEST);
            INTERCONNECT_CONVEYOR_TEST := TIMER_CONVEYOR_TEST.Q;
            IF INTERCONNECT_CONVEYOR_TEST THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#CONVEYOR_INIT_2;
            END_IF;
        
        CONVEYOR_STATES_T#CONVEYOR_TOWARDS_STACKER:
            _TRANSIT := FALSE;
            SORTERCONVEYORTOWARDSSTACKER := TRUE;
            SORTERCONVEYORTOWARDSCRANE := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#INTERSTEP;
            END_IF;
        
        CONVEYOR_STATES_T#CONVEYOR_INIT_2:
            _TRANSIT := FALSE;
            SORTERCONVEYORTOWARDSSTACKER := FALSE;
            SORTERCONVEYORTOWARDSCRANE := FALSE;
            INTERCONNECT_CONVEYOR_TEST := FALSE;
            TIMER_CONVEYOR_TEST(IN := FALSE, PT := TIME#1s);
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#INTERSTEP;
            END_IF;
        
        CONVEYOR_STATES_T#GREEN_LAMP:
            _TRANSIT := FALSE;
            SORTERGREENLAMPCONVEYOR := TRUE;
            INTERCONNECTCONVEYORSTARTCOMMAND := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#CONVEYOR_INIT;
            END_IF;
        
        CONVEYOR_STATES_T#INIT:
            _TRANSIT := FALSE;
            IF TRUE THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#START_CONVEYOR;
            END_IF;
        
        CONVEYOR_STATES_T#INTERSTEP:
            _TRANSIT := FALSE;
            STARTCOMMANDCONVEYOR := TRUE;
            IF STARTVAR THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#CONVEYOR_TOWARDS_STACKER;
            END_IF;
        
        CONVEYOR_STATES_T#START_CONVEYOR:
            _TRANSIT := FALSE;
            INTERCONNECTCONVEYORTERMINATIONCOMMAND := FALSE;
            SORTERCONVEYORTOWARDSSTACKER := FALSE;
            SORTERCONVEYORTOWARDSCRANE := FALSE;
            SORTERGREENLAMPCONVEYOR := FALSE;
            INTERCONNECT_CONVEYOR_TEST := FALSE;
            TIMER_CONVEYOR_TEST(IN := FALSE, PT := TIME#1s);
            STARTVAR := FALSE;
            STARTCOMMANDCONVEYOR := FALSE;
            IF (SORTERSTARTBUTTON = TRUE) THEN
                INTERCONNECTCONVEYORSTARTCOMMAND := TRUE;
            END_IF;
            IF INTERCONNECTCONVEYORSTARTCOMMAND THEN
                _TRANSIT := TRUE;
                _STATE := CONVEYOR_STATES_T#GREEN_LAMP;
            END_IF;
        
            END_CASE;
END_FUNCTION_BLOCK




PROGRAM MAIN

VAR  ACTUATOR_ANALOGCRANEPRESSURE : INT; END_VAR 
VAR  ACTUATOR_CRANELOWER : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINGREENLAMP : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINSLIDER : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMOFF : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMON : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINWHITELAMP : BOOL; END_VAR 
VAR  ACTUATOR_SORTERCONVEYORTOWARDSCRANE : BOOL; END_VAR 
VAR  ACTUATOR_SORTERCONVEYORTOWARDSSTACKER : BOOL; END_VAR 
VAR  ACTUATOR_SORTERGREENLAMPCONVEYOR : BOOL; END_VAR 
VAR  ACTUATOR_SORTERWHITELAMPCONVEYOR : BOOL; END_VAR 
VAR  ACTUATOR_STAMPGREENLAMP : BOOL; END_VAR 
VAR  ACTUATOR_STAMPPUSHER : BOOL; END_VAR 
VAR  ACTUATOR_STAMPSLIDERMOVEDIN : BOOL; END_VAR 
VAR  ACTUATOR_STAMPSLIDERMOVEDOUT : BOOL; END_VAR 
VAR  ACTUATOR_STAMPWHITELAMP : BOOL; END_VAR 
VAR  CONVEYOR : CONVEYOR_FB; END_VAR 
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
VAR  SENSOR_SORTEREMERGENCYSTOP : BOOL; END_VAR 
VAR  SENSOR_SORTERSTARTBUTTON : BOOL; END_VAR 
VAR  SENSOR_SORTERSWITCHMANUELLAUTOMATIC : BOOL; END_VAR 
VAR  SENSOR_STAMPEMERGENCYSTOP : BOOL; END_VAR 
VAR  SENSOR_STAMPLOWERED : BOOL; END_VAR 
VAR  SENSOR_STAMPSLIDERFILLED : BOOL; END_VAR 
VAR  SENSOR_STAMPSLIDERSENSORMOVEDIN : BOOL; END_VAR 
VAR  SENSOR_STAMPSLIDERSENSORMOVEDOUT : BOOL; END_VAR 
VAR  SENSOR_STAMPSTARTBUTTON : BOOL; END_VAR 
VAR  SENSOR_STAMPSWITCHMANUELLAUTOMATIC : BOOL; END_VAR 
VAR  SENSOR_STAMPUP : BOOL; END_VAR 
VAR  SENSOR_STARTBUTTONMAGAZIN : BOOL; END_VAR 
VAR  SENSOR_WORKPIECEREADY : BOOL; END_VAR 
VAR  STAMP : STAMP_FB; END_VAR 
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
CRANE.CRANEUP := SENSOR_CRANEUP;
CRANE.CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
CRANE.CRANEDOWN := SENSOR_CRANEDOWN;
CRANE.CRANESUCKED := SENSOR_CRANESUCKED;
CRANE.CRANEONMAGAZIN := SENSOR_CRANEONMAGAZIN;
CRANE.MAGAZINCAPACITIVESENSOR := SENSOR_MAGAZINCAPACITIVESENSOR;
CRANE.CRANEPOSITIONSTAMP := SENSOR_CRANEPOSITIONSTAMP;
CRANE.SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
CRANE.WORKPIECEREADY := SENSOR_WORKPIECEREADY;
CRANE.MAGAZINOPTICALSENSOR := SENSOR_MAGAZINOPTICALSENSOR;
CRANE.STAMPSLIDERFILLED := SENSOR_STAMPSLIDERFILLED;
CRANE.STAMPSLIDERSENSORMOVEDOUT := SENSOR_STAMPSLIDERSENSORMOVEDOUT;
CRANE.STAMPLOWERED := SENSOR_STAMPLOWERED;
CRANE.STARTBUTTONMAGAZIN := SENSOR_STARTBUTTONMAGAZIN;
ACTUATOR_CRANETURNCOUNTERCLOCKWISE := CRANE.CRANETURNCOUNTERCLOCKWISE;
ACTUATOR_CRANETURNCLOCKWISE := CRANE.CRANETURNCLOCKWISE;
ACTUATOR_CRANELOWER := CRANE.CRANELOWER;
ACTUATOR_MAGAZINVACUUMOFF := CRANE.MAGAZINVACUUMOFF;
ACTUATOR_MAGAZINVACUUMON := CRANE.MAGAZINVACUUMON;
ACTUATOR_ANALOGCRANEPRESSURE := CRANE.ANALOGCRANEPRESSURE;
STAMP.STAMPSLIDERSENSORMOVEDOUT := SENSOR_STAMPSLIDERSENSORMOVEDOUT;
STAMP.STAMPSLIDERSENSORMOVEDIN := SENSOR_STAMPSLIDERSENSORMOVEDIN;
STAMP.STAMPSLIDERFILLED := SENSOR_STAMPSLIDERFILLED;
STAMP.STAMPUP := SENSOR_STAMPUP;
STAMP.STAMPLOWERED := SENSOR_STAMPLOWERED;
STAMP.CRANEDOWN := SENSOR_CRANEDOWN;
STAMP.CRANEUP := SENSOR_CRANEUP;
STAMP.CRANESUCKED := SENSOR_CRANESUCKED;
STAMP.CRANEPOSITIONSTAMP := SENSOR_CRANEPOSITIONSTAMP;
STAMP.CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
STAMP.STAMPSTARTBUTTON := SENSOR_STAMPSTARTBUTTON;
ACTUATOR_STAMPSLIDERMOVEDOUT := STAMP.STAMPSLIDERMOVEDOUT;
ACTUATOR_STAMPSLIDERMOVEDIN := STAMP.STAMPSLIDERMOVEDIN;
ACTUATOR_STAMPWHITELAMP := STAMP.STAMPWHITELAMP;
ACTUATOR_STAMPPUSHER := STAMP.STAMPPUSHER;
ACTUATOR_STAMPGREENLAMP := STAMP.STAMPGREENLAMP;
CONVEYOR.SORTERSTARTBUTTON := SENSOR_SORTERSTARTBUTTON;
CONVEYOR.SORTERSWITCHMANUELLAUTOMATIC := SENSOR_SORTERSWITCHMANUELLAUTOMATIC;
ACTUATOR_SORTERCONVEYORTOWARDSSTACKER := CONVEYOR.SORTERCONVEYORTOWARDSSTACKER;
ACTUATOR_SORTERCONVEYORTOWARDSCRANE := CONVEYOR.SORTERCONVEYORTOWARDSCRANE;
ACTUATOR_SORTERGREENLAMPCONVEYOR := CONVEYOR.SORTERGREENLAMPCONVEYOR;
ACTUATOR_SORTERWHITELAMPCONVEYOR := CONVEYOR.SORTERWHITELAMPCONVEYOR;
IF ((SENSOR_SORTEREMERGENCYSTOP AND SENSOR_STAMPEMERGENCYSTOP) AND SENSOR_MAGAZINEMERGENCYSTOP) THEN
    MAG();
    CRANE();
    STAMP();
    CONVEYOR();
    IF ((ACTUATOR_SORTERGREENLAMPCONVEYOR AND ACTUATOR_MAGAZINGREENLAMP) AND ACTUATOR_STAMPGREENLAMP) THEN
        IF (((STAMP.STARTCOMMANDSTAMP AND CRANE.STARTCOMMANDCRANE) AND CONVEYOR.STARTCOMMANDCONVEYOR) AND MAG.STARTCOMMANDMAGAZIN) THEN
            CRANE.STARTVAR := TRUE;
            CONVEYOR.STARTVAR := TRUE;
            MAG.STARTVAR := TRUE;
            STAMP.STARTVAR := TRUE;
        END_IF;
    END_IF;
    CRANE.SFCRESET := FALSE;
    CONVEYOR.SFCRESET := FALSE;
    MAG.SFCRESET := FALSE;
    STAMP.SFCRESET := FALSE;
ELSIF ((NOT SENSOR_SORTEREMERGENCYSTOP OR NOT SENSOR_STAMPEMERGENCYSTOP) OR NOT SENSOR_MAGAZINEMERGENCYSTOP) THEN
    ACTUATOR_MAGAZINSLIDER := FALSE;
    ACTUATOR_CRANELOWER := FALSE;
    ACTUATOR_MAGAZINVACUUMON := FALSE;
    ACTUATOR_MAGAZINVACUUMOFF := TRUE;
    ACTUATOR_MAGAZINGREENLAMP := FALSE;
    ACTUATOR_CRANETURNCOUNTERCLOCKWISE := FALSE;
    ACTUATOR_CRANETURNCLOCKWISE := FALSE;
    ACTUATOR_SORTERCONVEYORTOWARDSSTACKER := FALSE;
    ACTUATOR_SORTERCONVEYORTOWARDSCRANE := FALSE;
    ACTUATOR_SORTERGREENLAMPCONVEYOR := FALSE;
    ACTUATOR_STAMPSLIDERMOVEDOUT := TRUE;
    ACTUATOR_STAMPSLIDERMOVEDIN := FALSE;
    ACTUATOR_STAMPGREENLAMP := FALSE;
    ACTUATOR_STAMPPUSHER := FALSE;
    ACTUATOR_ANALOGCRANEPRESSURE := INT#0;
    CRANE.SFCRESET := TRUE;
    CONVEYOR.SFCRESET := TRUE;
    MAG.SFCRESET := TRUE;
    STAMP.SFCRESET := TRUE;
    CRANE.STARTVAR := FALSE;
    CONVEYOR.STARTVAR := FALSE;
    MAG.STARTVAR := FALSE;
    STAMP.STARTVAR := FALSE;
END_IF;
END_PROGRAM
CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MAIN;
  END_RESOURCE
END_CONFIGURATION
