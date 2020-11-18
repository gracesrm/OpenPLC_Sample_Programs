TYPE
    Magazin_states_t : (Green_Lamp , Init , Interstep , Magazin_Init , Magazin_Init_2 , Slider_Move_Back , Start_Magazin , Step0 , Step1 , convey);
    Stamp_states_t : (Green_Lamp , Init , Interstep , Interstep_2 , StampProcess , StampSliderBack , StampSliderForward , Stamp_Init_1 , Stamp_Init_2 , Stamp_Init_3 , Stamp_Init_4 , Start_Stamp , Step0 , Step1 , Step2);
    Crane_states_t : (Crane_Go_Up , Crane_Init , Crane_Init_2 , Crane_Lift_At_Stamp , Crane_Lift_At_Stamp2 , Crane_Lift_Conveyor , Crane_Lift_Conveyor2 , Crane_Lift_Conveyor_Black , Crane_Lift_Magazin , Crane_Lift_Magazin_Metallic , Crane_Lift_NOT_Metallic_Black , Crane_Lower , Crane_On_Conveyor , Crane_On_Conveyor_Metallic , Crane_On_Conveyor_Metallic2 , Crane_On_Conveyor_Not_Metallica_Black , Crane_On_Stamp_Metallic , Crane_On_Stamp_Metallic2 , Crane_On_Stamp_Metallic2_Lower , Crane_On_Stamp_Stop_Black , Crane_Turn_Left_Back_To_Stamp , Crane_Turn_Left_From_Stamp , Crane_Turn_Left_Metallic , Crane_Turn_Left_Metallic2 , Crane_Turn_Left_NOT_Metallic , Crane_Turn_Left_NOT_Metallic_Black , Crane_Turn_Right_From_Stamp , Init , Interstep , Interstep_2 , Interstep_4 , Lower_Crane , Magazin_Stop , Magazin_Stop_Black , Magazin_Stop_Final , No_Workpiece_ready , Reset_interconnect , Start_Crane , Step0 , Step4 , Suck_At_Stamp , Suck_At_Stamp2 , TimeDelay , Turn_Right , Turn_Right_Black , Turn_Right_Final , pause , release , release2 , release_Black , release_Workpiece);
END_TYPE

FUNCTION_BLOCK Crane_FB
    VAR_INPUT  CraneDown : BOOL; END_VAR  
    VAR_OUTPUT  CraneLower : BOOL; END_VAR  
    VAR_INPUT  CraneOnConveyor : BOOL; END_VAR  
    VAR_INPUT  CraneOnMagazin : BOOL; END_VAR  
    VAR_INPUT  CranePositionStamp : BOOL; END_VAR  
    VAR_INPUT  CraneSucked : BOOL; END_VAR  
    VAR_OUTPUT  CraneTurnClockwise : BOOL; END_VAR  
    VAR_OUTPUT  CraneTurnCounterclockwise : BOOL; END_VAR  
    VAR_INPUT  CraneUp : BOOL; END_VAR  
    VAR  Duration1 : TIME := TIME#1s500ms; END_VAR  
    VAR_INPUT  MagazinCapacitiveSensor : BOOL; END_VAR  
    VAR_INPUT  MagazinOpticalSensor : BOOL; END_VAR  
    VAR_OUTPUT  MagazinVacuumOff : BOOL; END_VAR  
    VAR_OUTPUT  MagazinVacuumOn : BOOL; END_VAR  
    VAR  SFCInit : BOOL; END_VAR  
    VAR_INPUT  SFCReset : BOOL; END_VAR  
    VAR_INPUT  SliderMovedOut : BOOL; END_VAR  
    VAR_INPUT  SliderNotMovedOut : BOOL; END_VAR  
    VAR_INPUT  StampLowered : BOOL; END_VAR  
    VAR_INPUT  StampSliderFilled : BOOL; END_VAR  
    VAR_INPUT  StampSliderSensorMovedOut : BOOL; END_VAR  
    VAR_INPUT  StartButtonMagazin : BOOL; END_VAR  
    VAR_OUTPUT  StartCommandCrane : BOOL; END_VAR  
    VAR_INPUT  StartVar : BOOL; END_VAR  
    VAR  TimeDelay_Timer : TON; END_VAR  
    VAR  TimeDelay_Timer_Duration : TIME := TIME#50ms; END_VAR  
    VAR  TimeDelay_Timer_interconnect : BOOL; END_VAR  
    VAR  Timer1 : TON; END_VAR  
    VAR_INPUT  WorkpieceReady : BOOL; END_VAR  
    VAR  _state : Crane_states_t; END_VAR  
    VAR  _transit : BOOL; END_VAR  
    VAR  actualtime1 : TIME; END_VAR  
    VAR  interconnect : BOOL; END_VAR  
    VAR  interconnectCraneStartCommand : BOOL; END_VAR  
    
    CASE _state OF 
        Crane_states_t#Crane_Go_Up:
            _transit := FALSE;
            CraneLower := FALSE;
            IF ((CraneUp AND WorkpieceReady) AND (NOT MagazinCapacitiveSensor AND NOT MagazinOpticalSensor)) THEN
                _transit := TRUE;
                _state := Crane_states_t#Turn_Right_Black;
            ELSIF ((CraneUp AND WorkpieceReady) AND (MagazinCapacitiveSensor OR MagazinOpticalSensor)) THEN
                _transit := TRUE;
                _state := Crane_states_t#pause;
            ELSIF (CraneUp AND NOT WorkpieceReady) THEN
                _transit := TRUE;
                _state := Crane_states_t#Step4;
            END_IF;
        
        Crane_states_t#Crane_Init:
            _transit := FALSE;
            CraneLower := TRUE;
            interconnectCraneStartCommand := FALSE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Init_2;
            END_IF;
        
        Crane_states_t#Crane_Init_2:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_At_Stamp:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_From_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_At_Stamp2:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Right_From_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor:
            _transit := FALSE;
            CraneLower := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor2:
            _transit := FALSE;
            CraneLower := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor_Black:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_Back_To_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_Magazin:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_NOT_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Lift_Magazin_Metallic:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Lift_NOT_Metallic_Black:
            _transit := FALSE;
            CraneLower := FALSE;
            IF CraneUp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black;
            END_IF;
        
        Crane_states_t#Crane_Lower:
            _transit := FALSE;
            MagazinVacuumOn := TRUE;
            MagazinVacuumOff := FALSE;
            CraneLower := TRUE;
            IF CraneSucked THEN
                _transit := TRUE;
                _state := Crane_states_t#Step0;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#release;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Metallic:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#release;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Metallic2:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#release2;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#release_Black;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#release_Workpiece;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic2:
            _transit := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            IF StampLowered THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep_4;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic2_Lower:
            _transit := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#Suck_At_Stamp2;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Stop_Black:
            _transit := FALSE;
            CraneTurnClockwise := FALSE;
            CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Reset_interconnect;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Back_To_Stamp:
            _transit := FALSE;
            CraneTurnCounterclockwise := TRUE;
            CraneTurnClockwise := FALSE;
            IF CranePositionStamp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Stamp_Stop_Black;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_From_Stamp:
            _transit := FALSE;
            CraneTurnClockwise := TRUE;
            CraneTurnCounterclockwise := FALSE;
            IF CraneOnConveyor THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Conveyor_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Metallic:
            _transit := FALSE;
            CraneTurnCounterclockwise := TRUE;
            CraneTurnClockwise := FALSE;
            IF CranePositionStamp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Stamp_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Metallic2:
            _transit := FALSE;
            CraneTurnCounterclockwise := TRUE;
            CraneTurnClockwise := FALSE;
            IF CranePositionStamp THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Stamp_Metallic2;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_NOT_Metallic:
            _transit := FALSE;
            CraneTurnCounterclockwise := TRUE;
            CraneTurnClockwise := FALSE;
            IF CraneOnConveyor THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Conveyor;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black:
            _transit := FALSE;
            CraneTurnCounterclockwise := TRUE;
            CraneTurnClockwise := FALSE;
            IF CraneOnConveyor THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black;
            END_IF;
        
        Crane_states_t#Crane_Turn_Right_From_Stamp:
            _transit := FALSE;
            CraneTurnClockwise := TRUE;
            CraneTurnCounterclockwise := FALSE;
            IF CraneOnConveyor THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Conveyor_Metallic2;
            END_IF;
        
        Crane_states_t#Init:
            _transit := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Start_Crane;
            END_IF;
        
        Crane_states_t#Interstep:
            _transit := FALSE;
            StartCommandCrane := TRUE;
            IF StartVar THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep_2;
            END_IF;
        
        Crane_states_t#Interstep_2:
            _transit := FALSE;
            IF SliderMovedOut THEN
                _transit := TRUE;
                _state := Crane_states_t#TimeDelay;
            END_IF;
        
        Crane_states_t#Interstep_4:
            _transit := FALSE;
            IF StampSliderSensorMovedOut THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_On_Stamp_Metallic2_Lower;
            END_IF;
        
        Crane_states_t#Lower_Crane:
            _transit := FALSE;
            CraneLower := TRUE;
            IF CraneDown THEN
                _transit := TRUE;
                _state := Crane_states_t#Suck_At_Stamp;
            END_IF;
        
        Crane_states_t#Magazin_Stop:
            _transit := FALSE;
            CraneTurnClockwise := FALSE;
            CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lower;
            END_IF;
        
        Crane_states_t#Magazin_Stop_Black:
            _transit := FALSE;
            CraneTurnClockwise := FALSE;
            CraneTurnCounterclockwise := FALSE;
            MagazinVacuumOn := TRUE;
            MagazinVacuumOff := FALSE;
            CraneLower := TRUE;
            IF CraneSucked THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_NOT_Metallic_Black;
            END_IF;
        
        Crane_states_t#Magazin_Stop_Final:
            _transit := FALSE;
            CraneTurnClockwise := FALSE;
            CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Start_Crane;
            END_IF;
        
        Crane_states_t#No_Workpiece_ready:
            _transit := FALSE;
            MagazinVacuumOn := FALSE;
            MagazinVacuumOff := FALSE;
            CraneLower := FALSE;
            IF NOT StampSliderFilled THEN
                _transit := TRUE;
                _state := Crane_states_t#Turn_Right_Final;
            ELSIF StampSliderFilled THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Turn_Left_Metallic2;
            END_IF;
        
        Crane_states_t#Reset_interconnect:
            _transit := FALSE;
            interconnect := FALSE;
            Timer1(IN := FALSE, PT := TIME#1ms);
            IF SliderMovedOut THEN
                _transit := TRUE;
                _state := Crane_states_t#Lower_Crane;
            END_IF;
        
        Crane_states_t#Start_Crane:
            _transit := FALSE;
            CraneLower := FALSE;
            MagazinVacuumOff := FALSE;
            MagazinVacuumOn := FALSE;
            CraneTurnCounterclockwise := FALSE;
            CraneTurnClockwise := FALSE;
            StartVar := FALSE;
            StartCommandCrane := FALSE;
            IF (StartButtonMagazin = TRUE) THEN
                interconnectCraneStartCommand := TRUE;
            END_IF;
            IF interconnectCraneStartCommand THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Init;
            END_IF;
        
        Crane_states_t#Step0:
            _transit := FALSE;
            IF (MagazinCapacitiveSensor OR MagazinOpticalSensor) THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_Magazin_Metallic;
            ELSIF (NOT MagazinCapacitiveSensor AND NOT MagazinOpticalSensor) THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_Magazin;
            END_IF;
        
        Crane_states_t#Step4:
            _transit := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Suck_At_Stamp:
            _transit := FALSE;
            MagazinVacuumOn := TRUE;
            MagazinVacuumOff := FALSE;
            IF CraneSucked THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_At_Stamp;
            END_IF;
        
        Crane_states_t#Suck_At_Stamp2:
            _transit := FALSE;
            MagazinVacuumOn := TRUE;
            MagazinVacuumOff := FALSE;
            IF CraneSucked THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_At_Stamp2;
            END_IF;
        
        Crane_states_t#TimeDelay:
            _transit := FALSE;
            TimeDelay_Timer(IN := TRUE, PT := TimeDelay_Timer_Duration);
            TimeDelay_Timer_interconnect := TimeDelay_Timer.Q;
            IF (WorkpieceReady AND TimeDelay_Timer_interconnect) THEN
                _transit := TRUE;
                _state := Crane_states_t#Turn_Right;
            ELSIF (NOT WorkpieceReady AND TimeDelay_Timer_interconnect) THEN
                _transit := TRUE;
                _state := Crane_states_t#No_Workpiece_ready;
            END_IF;
        
        Crane_states_t#Turn_Right:
            _transit := FALSE;
            CraneTurnClockwise := TRUE;
            CraneTurnCounterclockwise := FALSE;
            IF CraneOnMagazin THEN
                _transit := TRUE;
                _state := Crane_states_t#Magazin_Stop;
            END_IF;
        
        Crane_states_t#Turn_Right_Black:
            _transit := FALSE;
            CraneTurnClockwise := TRUE;
            CraneTurnCounterclockwise := FALSE;
            IF CraneOnMagazin THEN
                _transit := TRUE;
                _state := Crane_states_t#Magazin_Stop_Black;
            END_IF;
        
        Crane_states_t#Turn_Right_Final:
            _transit := FALSE;
            CraneTurnClockwise := TRUE;
            CraneTurnCounterclockwise := FALSE;
            IF CraneOnMagazin THEN
                _transit := TRUE;
                _state := Crane_states_t#Magazin_Stop_Final;
            END_IF;
        
        Crane_states_t#pause:
            _transit := FALSE;
            Timer1(IN := CraneUp, PT := Duration1);
            interconnect := Timer1.Q;
            IF interconnect THEN
                _transit := TRUE;
                _state := Crane_states_t#Reset_interconnect;
            END_IF;
        
        Crane_states_t#release:
            _transit := FALSE;
            MagazinVacuumOff := TRUE;
            MagazinVacuumOn := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_Conveyor;
            END_IF;
        
        Crane_states_t#release2:
            _transit := FALSE;
            MagazinVacuumOff := TRUE;
            MagazinVacuumOn := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_Conveyor2;
            END_IF;
        
        Crane_states_t#release_Black:
            _transit := FALSE;
            MagazinVacuumOn := FALSE;
            MagazinVacuumOff := TRUE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Lift_Conveyor_Black;
            END_IF;
        
        Crane_states_t#release_Workpiece:
            _transit := FALSE;
            MagazinVacuumOff := TRUE;
            MagazinVacuumOn := FALSE;
            IF TRUE THEN
                _transit := TRUE;
                _state := Crane_states_t#Crane_Go_Up;
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
VAR  SENSOR_CRANESUCKED : BOOL; END_VAR 
VAR  SENSOR_CRANEUP : BOOL; END_VAR 
VAR  SENSOR_MAGAZINEMERGENCYSTOP : BOOL; END_VAR 
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
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : MAIN;
  END_RESOURCE
END_CONFIGURATION