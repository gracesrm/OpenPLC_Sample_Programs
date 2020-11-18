TYPE
    Magazin_states_t : (Green_Lamp , Init , Interstep , Magazin_Init , Magazin_Init_2 , Slider_Move_Back , Start_Magazin , Step0 , Step1 , convey);
    Stamp_states_t : (Green_Lamp , Init , Interstep , Interstep_2 , StampProcess , StampSliderBack , StampSliderForward , Stamp_Init_1 , Stamp_Init_2 , Stamp_Init_3 , Stamp_Init_4 , Start_Stamp , Step0 , Step1 , Step2);
    Crane_states_t : (Crane_Go_Up , Crane_Init , Crane_Init_2 , Crane_Lift_At_Stamp , Crane_Lift_At_Stamp2 , Crane_Lift_Conveyor , Crane_Lift_Conveyor2 , Crane_Lift_Conveyor_Black , Crane_Lift_Magazin , Crane_Lift_Magazin_Metallic , Crane_Lift_NOT_Metallic_Black , Crane_Lower , Crane_On_Conveyor , Crane_On_Conveyor_Metallic , Crane_On_Conveyor_Metallic2 , Crane_On_Conveyor_Not_Metallica_Black , Crane_On_Stamp_Metallic , Crane_On_Stamp_Metallic2 , Crane_On_Stamp_Metallic2_Lower , Crane_On_Stamp_Stop_Black , Crane_Turn_Left_Back_To_Stamp , Crane_Turn_Left_From_Stamp , Crane_Turn_Left_Metallic , Crane_Turn_Left_Metallic2 , Crane_Turn_Left_NOT_Metallic , Crane_Turn_Left_NOT_Metallic_Black , Crane_Turn_Right_From_Stamp , Init , Interstep , Interstep_2 , Interstep_4 , Lower_Crane , Magazin_Stop , Magazin_Stop_Black , Magazin_Stop_Final , No_Workpiece_ready , Reset_interconnect , Start_Crane , Step0 , Step4 , Suck_At_Stamp , Suck_At_Stamp2 , TimeDelay , Turn_Right , Turn_Right_Black , Turn_Right_Final , pause , release , release2 , release_Black , release_Workpiece);
END_TYPE

PROGRAM Main

VAR  ACTUATOR_ANALOGCRANEPRESSURE : INT; END_VAR 
VAR  ACTUATOR_CRANELOWER : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINGREENLAMP : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINSLIDER : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMOFF : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINVACUUMON : BOOL; END_VAR 
VAR  ACTUATOR_MAGAZINWHITELAMP : BOOL; END_VAR 
VAR  ACTUATOR_STAMPGREENLAMP : BOOL; END_VAR 
VAR  ACTUATOR_STAMPPUSHER : BOOL; END_VAR 
VAR  ACTUATOR_STAMPSLIDERMOVEDIN : BOOL; END_VAR 
VAR  ACTUATOR_STAMPSLIDERMOVEDOUT : BOOL; END_VAR 
VAR  ACTUATOR_STAMPWHITELAMP : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANEDOWN : BOOL; END_VAR 
VAR_OUTPUT  CRANE_CRANELOWER : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANEONCONVEYOR : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANEONMAGAZIN : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANEPOSITIONSTAMP : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANESUCKED : BOOL; END_VAR 
VAR_OUTPUT  CRANE_CRANETURNCLOCKWISE : BOOL; END_VAR 
VAR_OUTPUT  CRANE_CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
VAR_INPUT  CRANE_CRANEUP : BOOL; END_VAR 
VAR  CRANE_DURATION1 : UINT := UINT#375; END_VAR 
VAR_INPUT  CRANE_MAGAZINCAPACITIVESENSOR : BOOL; END_VAR 
VAR_INPUT  CRANE_MAGAZINOPTICALSENSOR : BOOL; END_VAR 
VAR_OUTPUT  CRANE_MAGAZINVACUUMOFF : BOOL; END_VAR 
VAR_OUTPUT  CRANE_MAGAZINVACUUMON : BOOL; END_VAR 
VAR  CRANE_SFCINIT : BOOL; END_VAR 
VAR_INPUT  CRANE_SFCRESET : BOOL; END_VAR 
VAR_INPUT  CRANE_SLIDERMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  CRANE_SLIDERNOTMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  CRANE_STAMPLOWERED : BOOL; END_VAR 
VAR_INPUT  CRANE_STAMPSLIDERFILLED : BOOL; END_VAR 
VAR_INPUT  CRANE_STAMPSLIDERSENSORMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  CRANE_STARTBUTTONMAGAZIN : BOOL; END_VAR 
VAR_OUTPUT  CRANE_STARTCOMMANDCRANE : BOOL; END_VAR 
VAR_INPUT  CRANE_STARTVAR : BOOL; END_VAR 
VAR_OUTPUT  CRANE_TIMEDELAY_TIMER_ET : UINT; END_VAR 
VAR_INPUT  CRANE_TIMEDELAY_TIMER_IN : BOOL; END_VAR 
VAR_INPUT  CRANE_TIMEDELAY_TIMER_PT : UINT; END_VAR 
VAR_OUTPUT  CRANE_TIMEDELAY_TIMER_Q : BOOL; END_VAR 
VAR  CRANE_TIMEDELAY_TIMER_DURATION : UINT := UINT#12; END_VAR 
VAR  CRANE_TIMEDELAY_TIMER_INTERCONNECT : BOOL; END_VAR 
VAR_OUTPUT  CRANE_TIMER1_ET : UINT; END_VAR 
VAR_INPUT  CRANE_TIMER1_IN : BOOL; END_VAR 
VAR_INPUT  CRANE_TIMER1_PT : UINT; END_VAR 
VAR_OUTPUT  CRANE_TIMER1_Q : BOOL; END_VAR 
VAR_INPUT  CRANE_WORKPIECEREADY : BOOL; END_VAR 
VAR  CRANE_2STATE : CRANE_STATES_T; END_VAR 
VAR  CRANE_2TRANSIT : BOOL; END_VAR 
VAR  CRANE_ACTUALTIME1 : INT; END_VAR 
VAR  CRANE_INTERCONNECT : BOOL; END_VAR 
VAR  CRANE_INTERCONNECTCRANESTARTCOMMAND : BOOL; END_VAR 
VAR_INPUT  MAG_CRANEDOWN : BOOL; END_VAR 
VAR_OUTPUT  MAG_CRANELOWER : BOOL; END_VAR 
VAR_INPUT  MAG_CRANEONCONVEYOR : BOOL; END_VAR 
VAR_INPUT  MAG_CRANEONMAGAZIN : BOOL; END_VAR 
VAR_INPUT  MAG_CRANESUCKED : BOOL; END_VAR 
VAR_OUTPUT  MAG_CRANETURNCLOCKWISE : BOOL; END_VAR 
VAR_OUTPUT  MAG_CRANETURNCOUNTERCLOCKWISE : BOOL; END_VAR 
VAR_INPUT  MAG_CRANEUP : BOOL; END_VAR 
VAR_OUTPUT  MAG_MAGAZINGREENLAMP : BOOL; END_VAR 
VAR_OUTPUT  MAG_MAGAZINSLIDER : BOOL; END_VAR 
VAR_OUTPUT  MAG_MAGAZINVACUUMOFF : BOOL; END_VAR 
VAR_OUTPUT  MAG_MAGAZINVACUUMON : BOOL; END_VAR 
VAR_OUTPUT  MAG_MAGAZINWHITELAMP : BOOL; END_VAR 
VAR  MAG_SFCINIT : BOOL; END_VAR 
VAR_INPUT  MAG_SFCRESET : BOOL; END_VAR 
VAR_INPUT  MAG_SLIDERMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  MAG_SLIDERNOTMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  MAG_STARTBUTTONMAGAZIN : BOOL; END_VAR 
VAR_OUTPUT  MAG_STARTCOMMANDMAGAZIN : BOOL; END_VAR 
VAR_INPUT  MAG_STARTVAR : BOOL; END_VAR 
VAR_INPUT  MAG_WORKPIECEREADY : BOOL; END_VAR 
VAR  MAG_2STATE : MAGAZIN_STATES_T; END_VAR 
VAR  MAG_2TRANSIT : BOOL; END_VAR 
VAR  MAG_INTERCONNECTMAGAZINSTARTCOMMAND : BOOL; END_VAR 
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
VAR_INPUT  STAMP_CRANEDOWN : BOOL; END_VAR 
VAR_INPUT  STAMP_CRANEONCONVEYOR : BOOL; END_VAR 
VAR_INPUT  STAMP_CRANEPOSITIONSTAMP : BOOL; END_VAR 
VAR_INPUT  STAMP_CRANESUCKED : BOOL; END_VAR 
VAR_INPUT  STAMP_CRANEUP : BOOL; END_VAR 
VAR  STAMP_DURATION : UINT := UINT#125; END_VAR 
VAR  STAMP_SFCINIT : BOOL; END_VAR 
VAR_INPUT  STAMP_SFCRESET : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPGREENLAMP : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPLOWERED : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPPRESSURE : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPPUSHER : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPSLIDERFILLED : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPSLIDERMOVEDIN : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPSLIDERMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPSLIDERSENSORMOVEDIN : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPSLIDERSENSORMOVEDOUT : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPSTARTBUTTON : BOOL; END_VAR 
VAR_INPUT  STAMP_STAMPUP : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STAMPWHITELAMP : BOOL; END_VAR 
VAR_OUTPUT  STAMP_STARTCOMMANDSTAMP : BOOL; END_VAR 
VAR_INPUT  STAMP_STARTVAR : BOOL; END_VAR 
VAR_OUTPUT  STAMP_TIMER_ET : UINT; END_VAR 
VAR_INPUT  STAMP_TIMER_IN : BOOL; END_VAR 
VAR_INPUT  STAMP_TIMER_PT : UINT; END_VAR 
VAR_OUTPUT  STAMP_TIMER_Q : BOOL; END_VAR 
VAR  STAMP_2STATE : STAMP_STATES_T; END_VAR 
VAR  STAMP_2TRANSIT : BOOL; END_VAR 
VAR  STAMP_INTERCONNECT : BOOL; END_VAR 
VAR  STAMP_INTERCONNECTSTAMPSTARTCOMMAND : BOOL; END_VAR 
Mag_SliderNotMovedOut := Sensor_SliderNotMovedOut;
Mag_SliderMovedOut := Sensor_SliderMovedOut;
Mag_CraneOnMagazin := Sensor_CraneOnMagazin;
Mag_CraneDown := Sensor_CraneDown;
Mag_CraneUp := Sensor_CraneUp;
Mag_CraneOnConveyor := Sensor_CraneOnConveyor;
Mag_WorkpieceReady := Sensor_WorkpieceReady;
Mag_StartButtonMagazin := Sensor_StartButtonMagazin;
Actuator_MagazinSlider := Mag_MagazinSlider;
Actuator_MagazinGreenLamp := Mag_MagazinGreenLamp;
Crane_CraneUp := Sensor_CraneUp;
Crane_CraneOnConveyor := Sensor_CraneOnConveyor;
Crane_CraneDown := Sensor_CraneDown;
Crane_CraneSucked := Sensor_CraneSucked;
Crane_CraneOnMagazin := Sensor_CraneOnMagazin;
Crane_MagazinCapacitiveSensor := Sensor_MagazinCapacitiveSensor;
Crane_CranePositionStamp := Sensor_CranePositionStamp;
Crane_SliderMovedOut := Sensor_SliderMovedOut;
Crane_WorkpieceReady := Sensor_WorkpieceReady;
Crane_MagazinOpticalSensor := Sensor_MagazinOpticalSensor;
Crane_StampSliderFilled := Sensor_StampSliderFilled;
Crane_StampSliderSensorMovedOut := Sensor_StampSliderSensorMovedOut;
Crane_StampLowered := Sensor_StampLowered;
Crane_StartButtonMagazin := Sensor_StartButtonMagazin;
Actuator_CraneTurnCounterclockwise := Crane_CraneTurnCounterclockwise;
Actuator_CraneTurnClockwise := Crane_CraneTurnClockwise;
Actuator_CraneLower := Crane_CraneLower;
Actuator_MagazinVacuumOff := Crane_MagazinVacuumOff;
Actuator_MagazinVacuumOn := Crane_MagazinVacuumOn;
Stamp_StampSliderSensorMovedOut := Sensor_StampSliderSensorMovedOut;
Stamp_StampSliderSensorMovedIn := Sensor_StampSliderSensorMovedIn;
Stamp_StampSliderFilled := Sensor_StampSliderFilled;
Stamp_StampUp := Sensor_StampUp;
Stamp_StampLowered := Sensor_StampLowered;
Stamp_CraneDown := Sensor_CraneDown;
Stamp_CraneUp := Sensor_CraneUp;
Stamp_CraneSucked := Sensor_CraneSucked;
Stamp_CranePositionStamp := Sensor_CranePositionStamp;
Stamp_CraneOnConveyor := Sensor_CraneOnConveyor;
Stamp_StampStartButton := Sensor_StampStartButton;
Actuator_StampSliderMovedOut := Stamp_StampSliderMovedOut;
Actuator_StampSliderMovedIn := Stamp_StampSliderMovedIn;
Actuator_StampWhiteLamp := Stamp_StampWhiteLamp;
Actuator_StampPusher := Stamp_StampPusher;
Actuator_StampGreenLamp := Stamp_StampGreenLamp;
Actuator_AnalogCranePressure := INT#6000;
IF (Sensor_StampEmergencyStop AND Sensor_MagazinEmergencyStop) THEN
    CASE Mag_2state OF 
        Magazin_states_t#Green_Lamp:
            Mag_2transit := FALSE;
            Mag_MagazinGreenLamp := TRUE;
            Mag_interconnectMagazinStartCommand := FALSE;
            IF TRUE THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Magazin_Init;
            END_IF;
        
        Magazin_states_t#Init:
            Mag_2transit := FALSE;
            IF TRUE THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Start_Magazin;
            END_IF;
        
        Magazin_states_t#Interstep:
            Mag_2transit := FALSE;
            Mag_StartCommandMagazin := TRUE;
            IF Mag_StartVar THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#convey;
            END_IF;
        
        Magazin_states_t#Magazin_Init:
            Mag_2transit := FALSE;
            Mag_MagazinSlider := TRUE;
            IF TRUE THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Magazin_Init_2;
            END_IF;
        
        Magazin_states_t#Magazin_Init_2:
            Mag_2transit := FALSE;
            Mag_MagazinSlider := FALSE;
            IF TRUE THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Interstep;
            END_IF;
        
        Magazin_states_t#Slider_Move_Back:
            Mag_2transit := FALSE;
            IF ((Mag_SliderMovedOut = TRUE) AND (Mag_SliderNotMovedOut = FALSE)) THEN
                Mag_MagazinSlider := FALSE;
            END_IF;
            IF Mag_CraneUp THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Step1;
            END_IF;
        
        Magazin_states_t#Start_Magazin:
            Mag_2transit := FALSE;
            Mag_MagazinSlider := FALSE;
            Mag_MagazinGreenLamp := FALSE;
            Mag_StartVar := FALSE;
            Mag_StartCommandMagazin := FALSE;
            IF (Mag_StartButtonMagazin = TRUE) THEN
                Mag_interconnectMagazinStartCommand := TRUE;
            END_IF;
            IF Mag_interconnectMagazinStartCommand THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Green_Lamp;
            END_IF;
        
        Magazin_states_t#Step0:
            Mag_2transit := FALSE;
            IF Mag_CraneDown THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Slider_Move_Back;
            END_IF;
        
        Magazin_states_t#Step1:
            Mag_2transit := FALSE;
            IF Mag_CraneOnConveyor THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Interstep;
            END_IF;
        
        Magazin_states_t#convey:
            Mag_2transit := FALSE;
            IF Mag_SliderNotMovedOut THEN
                Mag_MagazinSlider := TRUE;
            END_IF;
            IF Mag_CraneOnMagazin THEN
                Mag_2transit := TRUE;
                Mag_2state := Magazin_states_t#Step0;
            END_IF;
        
            END_CASE;
    CASE Crane_2state OF 
        Crane_states_t#Crane_Go_Up:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF ((Crane_CraneUp AND Crane_WorkpieceReady) AND (NOT Crane_MagazinCapacitiveSensor AND NOT Crane_MagazinOpticalSensor)) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Turn_Right_Black;
            ELSIF ((Crane_CraneUp AND Crane_WorkpieceReady) AND (Crane_MagazinCapacitiveSensor OR Crane_MagazinOpticalSensor)) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#pause;
            ELSIF (Crane_CraneUp AND NOT Crane_WorkpieceReady) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Step4;
            END_IF;
        
        Crane_states_t#Crane_Init:
            Crane_2transit := FALSE;
            Crane_CraneLower := TRUE;
            Crane_interconnectCraneStartCommand := FALSE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Init_2;
            END_IF;
        
        Crane_states_t#Crane_Init_2:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_At_Stamp:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_From_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_At_Stamp2:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Right_From_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor2:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Crane_Lift_Conveyor_Black:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_Back_To_Stamp;
            END_IF;
        
        Crane_states_t#Crane_Lift_Magazin:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_NOT_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Lift_Magazin_Metallic:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Lift_NOT_Metallic_Black:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black;
            END_IF;
        
        Crane_states_t#Crane_Lower:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneSucked THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Step0;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Metallic:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Metallic2:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release2;
            END_IF;
        
        Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release_Black;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release_Workpiece;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic2:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_StampLowered THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep_4;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Metallic2_Lower:
            Crane_2transit := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Suck_At_Stamp2;
            END_IF;
        
        Crane_states_t#Crane_On_Stamp_Stop_Black:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Reset_interconnect;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Back_To_Stamp:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_CranePositionStamp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Stamp_Stop_Black;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_From_Stamp:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF Crane_CraneOnConveyor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Conveyor_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Metallic:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_CranePositionStamp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Stamp_Metallic;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_Metallic2:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_CranePositionStamp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Stamp_Metallic2;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_NOT_Metallic:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_CraneOnConveyor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Conveyor;
            END_IF;
        
        Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black:
            Crane_2transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_CraneOnConveyor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black;
            END_IF;
        
        Crane_states_t#Crane_Turn_Right_From_Stamp:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF Crane_CraneOnConveyor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Conveyor_Metallic2;
            END_IF;
        
        Crane_states_t#Init:
            Crane_2transit := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Start_Crane;
            END_IF;
        
        Crane_states_t#Interstep:
            Crane_2transit := FALSE;
            Crane_StartCommandCrane := TRUE;
            IF Crane_StartVar THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep_2;
            END_IF;
        
        Crane_states_t#Interstep_2:
            Crane_2transit := FALSE;
            IF Crane_SliderMovedOut THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#TimeDelay;
            END_IF;
        
        Crane_states_t#Interstep_4:
            Crane_2transit := FALSE;
            IF Crane_StampSliderSensorMovedOut THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Stamp_Metallic2_Lower;
            END_IF;
        
        Crane_states_t#Lower_Crane:
            Crane_2transit := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Suck_At_Stamp;
            END_IF;
        
        Crane_states_t#Magazin_Stop:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lower;
            END_IF;
        
        Crane_states_t#Magazin_Stop_Black:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneSucked THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_NOT_Metallic_Black;
            END_IF;
        
        Crane_states_t#Magazin_Stop_Final:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Start_Crane;
            END_IF;
        
        Crane_states_t#No_Workpiece_ready:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := FALSE;
            IF NOT Crane_StampSliderFilled THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Turn_Right_Final;
            ELSIF Crane_StampSliderFilled THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Turn_Left_Metallic2;
            END_IF;
        
        Crane_states_t#Reset_interconnect:
            Crane_2transit := FALSE;
            Crane_interconnect := FALSE;
            Crane_Timer1_IN := FALSE;
            Crane_Timer1_PT := UINT#0;
            IF Crane_Timer1_IN THEN
                Crane_Timer1_Q := (Crane_Timer1_ET = UINT#0);
                IF (Crane_Timer1_ET > UINT#0) THEN
                    Crane_Timer1_ET := (Crane_Timer1_ET - UINT#1);
                ELSE
                    Crane_Timer1_ET := UINT#0;
                END_IF;
            ELSE
                Crane_Timer1_Q := FALSE;
                Crane_Timer1_ET := Crane_Timer1_PT;
            END_IF;
            IF Crane_SliderMovedOut THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Lower_Crane;
            END_IF;
        
        Crane_states_t#Start_Crane:
            Crane_2transit := FALSE;
            Crane_CraneLower := FALSE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_StartVar := FALSE;
            Crane_StartCommandCrane := FALSE;
            IF (Crane_StartButtonMagazin = TRUE) THEN
                Crane_interconnectCraneStartCommand := TRUE;
            END_IF;
            IF Crane_interconnectCraneStartCommand THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Init;
            END_IF;
        
        Crane_states_t#Step0:
            Crane_2transit := FALSE;
            IF (Crane_MagazinCapacitiveSensor OR Crane_MagazinOpticalSensor) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Magazin_Metallic;
            ELSIF (NOT Crane_MagazinCapacitiveSensor AND NOT Crane_MagazinOpticalSensor) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Magazin;
            END_IF;
        
        Crane_states_t#Step4:
            Crane_2transit := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep;
            END_IF;
        
        Crane_states_t#Suck_At_Stamp:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            IF Crane_CraneSucked THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_At_Stamp;
            END_IF;
        
        Crane_states_t#Suck_At_Stamp2:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            IF Crane_CraneSucked THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_At_Stamp2;
            END_IF;
        
        Crane_states_t#TimeDelay:
            Crane_2transit := FALSE;
            Crane_TimeDelay_Timer_IN := TRUE;
            Crane_TimeDelay_Timer_PT := Crane_TimeDelay_Timer_Duration;
            IF Crane_TimeDelay_Timer_IN THEN
                Crane_TimeDelay_Timer_Q := (Crane_TimeDelay_Timer_ET = UINT#0);
                IF (Crane_TimeDelay_Timer_ET > UINT#0) THEN
                    Crane_TimeDelay_Timer_ET := (Crane_TimeDelay_Timer_ET - UINT#1);
                ELSE
                    Crane_TimeDelay_Timer_ET := UINT#0;
                END_IF;
            ELSE
                Crane_TimeDelay_Timer_Q := FALSE;
                Crane_TimeDelay_Timer_ET := Crane_TimeDelay_Timer_PT;
            END_IF;
            Crane_TimeDelay_Timer_interconnect := Crane_TimeDelay_Timer_Q;
            IF (Crane_WorkpieceReady AND Crane_TimeDelay_Timer_interconnect) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Turn_Right;
            ELSIF (NOT Crane_WorkpieceReady AND Crane_TimeDelay_Timer_interconnect) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#No_Workpiece_ready;
            END_IF;
        
        Crane_states_t#Turn_Right:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF Crane_CraneOnMagazin THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Magazin_Stop;
            END_IF;
        
        Crane_states_t#Turn_Right_Black:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF Crane_CraneOnMagazin THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Magazin_Stop_Black;
            END_IF;
        
        Crane_states_t#Turn_Right_Final:
            Crane_2transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF Crane_CraneOnMagazin THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Magazin_Stop_Final;
            END_IF;
        
        Crane_states_t#pause:
            Crane_2transit := FALSE;
            Crane_Timer1_IN := Crane_CraneUp;
            Crane_Timer1_PT := Crane_Duration1;
            IF Crane_Timer1_IN THEN
                Crane_Timer1_Q := (Crane_Timer1_ET = UINT#0);
                IF (Crane_Timer1_ET > UINT#0) THEN
                    Crane_Timer1_ET := (Crane_Timer1_ET - UINT#1);
                ELSE
                    Crane_Timer1_ET := UINT#0;
                END_IF;
            ELSE
                Crane_Timer1_Q := FALSE;
                Crane_Timer1_ET := Crane_Timer1_PT;
            END_IF;
            Crane_interconnect := Crane_Timer1_Q;
            IF Crane_interconnect THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Reset_interconnect;
            END_IF;
        
        Crane_states_t#release:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Conveyor;
            END_IF;
        
        Crane_states_t#release2:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Conveyor2;
            END_IF;
        
        Crane_states_t#release_Black:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Conveyor_Black;
            END_IF;
        
        Crane_states_t#release_Workpiece:
            Crane_2transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Go_Up;
            END_IF;
        
            END_CASE;
    CASE Stamp_2state OF 
        Stamp_states_t#Green_Lamp:
            Stamp_2transit := FALSE;
            Stamp_StampGreenLamp := TRUE;
            Stamp_interconnectStampStartCommand := FALSE;
            IF TRUE THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Stamp_Init_1;
            END_IF;
        
        Stamp_states_t#Init:
            Stamp_2transit := FALSE;
            IF TRUE THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Start_Stamp;
            END_IF;
        
        Stamp_states_t#Interstep:
            Stamp_2transit := FALSE;
            Stamp_StartCommandStamp := TRUE;
            IF Stamp_StartVar THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Interstep_2;
            END_IF;
        
        Stamp_states_t#Interstep_2:
            Stamp_2transit := FALSE;
            IF Stamp_StampSliderFilled THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Step0;
            END_IF;
        
        Stamp_states_t#StampProcess:
            Stamp_2transit := FALSE;
            Stamp_StampSliderMovedIn := FALSE;
            Stamp_StampPusher := TRUE;
            IF Stamp_StampLowered THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Step1;
            END_IF;
        
        Stamp_states_t#StampSliderBack:
            Stamp_2transit := FALSE;
            Stamp_StampSliderMovedIn := TRUE;
            Stamp_StampSliderMovedOut := FALSE;
            IF Stamp_StampSliderSensorMovedIn THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#StampProcess;
            END_IF;
        
        Stamp_states_t#StampSliderForward:
            Stamp_2transit := FALSE;
            Stamp_StampPusher := FALSE;
            Stamp_StampSliderMovedOut := TRUE;
            IF ((Stamp_StampLowered = FALSE) AND (Stamp_StampUp = TRUE)) THEN
                Stamp_interconnect := FALSE;
            END_IF;
            Stamp_Timer_IN := FALSE;
            Stamp_Timer_PT := UINT#0;
            IF Stamp_Timer_IN THEN
                Stamp_Timer_Q := (Stamp_Timer_ET = UINT#0);
                IF (Stamp_Timer_ET > UINT#0) THEN
                    Stamp_Timer_ET := (Stamp_Timer_ET - UINT#1);
                ELSE
                    Stamp_Timer_ET := UINT#0;
                END_IF;
            ELSE
                Stamp_Timer_Q := FALSE;
                Stamp_Timer_ET := Stamp_Timer_PT;
            END_IF;
            IF Stamp_StampSliderMovedOut THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Step2;
            END_IF;
        
        Stamp_states_t#Stamp_Init_1:
            Stamp_2transit := FALSE;
            Stamp_StampSliderMovedIn := TRUE;
            Stamp_StampSliderMovedOut := FALSE;
            IF Stamp_StampSliderSensorMovedIn THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Stamp_Init_2;
            END_IF;
        
        Stamp_states_t#Stamp_Init_2:
            Stamp_2transit := FALSE;
            Stamp_StampSliderMovedIn := FALSE;
            Stamp_StampSliderMovedOut := TRUE;
            IF Stamp_StampSliderSensorMovedOut THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Stamp_Init_3;
            END_IF;
        
        Stamp_states_t#Stamp_Init_3:
            Stamp_2transit := FALSE;
            Stamp_StampPusher := TRUE;
            IF Stamp_StampLowered THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Stamp_Init_4;
            END_IF;
        
        Stamp_states_t#Stamp_Init_4:
            Stamp_2transit := FALSE;
            Stamp_StampPusher := FALSE;
            IF Stamp_StampUp THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Interstep;
            END_IF;
        
        Stamp_states_t#Start_Stamp:
            Stamp_2transit := FALSE;
            Stamp_StampSliderMovedOut := FALSE;
            Stamp_StampSliderMovedIn := FALSE;
            Stamp_StampPusher := FALSE;
            Stamp_StampGreenLamp := FALSE;
            Stamp_StampPressure := FALSE;
            Stamp_StartCommandStamp := FALSE;
            IF (Stamp_StampStartButton = TRUE) THEN
                Stamp_interconnectStampStartCommand := TRUE;
            END_IF;
            IF Stamp_interconnectStampStartCommand THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Green_Lamp;
            END_IF;
        
        Stamp_states_t#Step0:
            Stamp_2transit := FALSE;
            IF Stamp_CraneUp THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#StampSliderBack;
            END_IF;
        
        Stamp_states_t#Step1:
            Stamp_2transit := FALSE;
            Stamp_Timer_IN := Stamp_StampLowered;
            Stamp_Timer_PT := UINT#0;
            IF Stamp_Timer_IN THEN
                Stamp_Timer_Q := (Stamp_Timer_ET = UINT#0);
                IF (Stamp_Timer_ET > UINT#0) THEN
                    Stamp_Timer_ET := (Stamp_Timer_ET - UINT#1);
                ELSE
                    Stamp_Timer_ET := UINT#0;
                END_IF;
            ELSE
                Stamp_Timer_Q := FALSE;
                Stamp_Timer_ET := Stamp_Timer_PT;
            END_IF;
            Stamp_interconnect := Stamp_Timer_Q;
            IF Stamp_interconnect THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#StampSliderForward;
            END_IF;
        
        Stamp_states_t#Step2:
            Stamp_2transit := FALSE;
            IF (Stamp_CraneOnConveyor AND NOT Stamp_StampSliderFilled) THEN
                Stamp_2transit := TRUE;
                Stamp_2state := Stamp_states_t#Interstep;
            END_IF;
        
            END_CASE;
    IF (Actuator_MagazinGreenLamp AND Actuator_StampGreenLamp) THEN
        IF ((Stamp_StartCommandStamp AND Crane_StartCommandCrane) AND Mag_StartCommandMagazin) THEN
            Crane_StartVar := TRUE;
            Mag_StartVar := TRUE;
            Stamp_StartVar := TRUE;
        END_IF;
    END_IF;
    Crane_SFCReset := FALSE;
    Mag_SFCReset := FALSE;
    Stamp_SFCReset := FALSE;
ELSIF (NOT Sensor_StampEmergencyStop OR NOT Sensor_MagazinEmergencyStop) THEN
    Actuator_MagazinSlider := FALSE;
    Actuator_CraneLower := FALSE;
    Actuator_MagazinVacuumOn := FALSE;
    Actuator_MagazinVacuumOff := TRUE;
    Actuator_MagazinGreenLamp := FALSE;
    Actuator_CraneTurnCounterclockwise := FALSE;
    Actuator_CraneTurnClockwise := FALSE;
    Actuator_StampSliderMovedOut := TRUE;
    Actuator_StampSliderMovedIn := FALSE;
    Actuator_StampGreenLamp := FALSE;
    Actuator_StampPusher := FALSE;
    Actuator_AnalogCranePressure := INT#0;
    Crane_SFCReset := TRUE;
    Mag_SFCReset := TRUE;
    Stamp_SFCReset := TRUE;
    Crane_StartVar := FALSE;
    Mag_StartVar := FALSE;
    Stamp_StartVar := FALSE;
END_IF;
END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Main;
  END_RESOURCE
END_CONFIGURATION
