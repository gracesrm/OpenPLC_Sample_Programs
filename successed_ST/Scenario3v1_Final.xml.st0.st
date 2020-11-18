TYPE
    Stamp_states_t : (Green_Lamp , Init , Interstep , Interstep_2 , StampProcess , StampSliderBack , StampSliderForward , Stamp_Init_1 , Stamp_Init_2 , Stamp_Init_3 , Stamp_Init_4 , Start_Stamp , Step0 , Step1 , Step2);
    Magazin_states_t : (Green_Lamp , Init , Interstep , Magazin_Init , Magazin_Init_2 , Slider_Move_Back , Start_Magazin , Step0 , Step1 , convey);
    Crane_states_t : (Crane_Go_Up , Crane_Init , Crane_Init_2 , Crane_Lift_At_Stamp , Crane_Lift_Conveyor , Crane_Lift_Magazin , Crane_Lift_Magazin_Metallic , Crane_Lower , Crane_On_Conveyor , Crane_On_Conveyor_Metallic , Crane_On_Stamp_Metallic , Crane_Turn_Left_From_Stamp , Crane_Turn_Left_Metallic , Crane_Turn_Left_NOT_Metallic , Init , Interstep , Interstep_2 , Interstep_Check_Workpiece , Lower_Crane , Reset_interconnect , Start_Crane , Step0 , Step2 , Suck_At_Stamp , TimeDelay , Turn_Right , Wait_At_Stamp , pause , release , release_Workpiece);
END_TYPE

PROGRAM Main

VAR  Actuator_AnalogCranePressure : INT; END_VAR 
VAR  Actuator_CraneLower : BOOL; END_VAR 
VAR  Actuator_CraneTurnClockwise : BOOL; END_VAR 
VAR  Actuator_CraneTurnCounterclockwise : BOOL; END_VAR 
VAR  Actuator_MagazinGreenLamp : BOOL; END_VAR 
VAR  Actuator_MagazinSlider : BOOL; END_VAR 
VAR  Actuator_MagazinVacuumOff : BOOL; END_VAR 
VAR  Actuator_MagazinVacuumOn : BOOL; END_VAR 
VAR  Actuator_MagazinWhiteLamp : BOOL; END_VAR 
VAR  Actuator_SomeActuator : BOOL; END_VAR 
VAR  Actuator_StampGreenLamp : BOOL; END_VAR 
VAR  Actuator_StampPusher : BOOL; END_VAR 
VAR  Actuator_StampSliderMovedIn : BOOL; END_VAR 
VAR  Actuator_StampSliderMovedOut : BOOL; END_VAR 
VAR  Actuator_StampWhiteLamp : BOOL; END_VAR 
VAR_INPUT  Crane_CraneDown : BOOL; END_VAR 
VAR_OUTPUT  Crane_CraneLower : BOOL; END_VAR 
VAR_INPUT  Crane_CraneOnConveyor : BOOL; END_VAR 
VAR_INPUT  Crane_CraneOnMagazin : BOOL; END_VAR 
VAR_INPUT  Crane_CranePositionStamp : BOOL; END_VAR 
VAR_INPUT  Crane_CraneSucked : BOOL; END_VAR 
VAR_OUTPUT  Crane_CraneTurnClockwise : BOOL; END_VAR 
VAR_OUTPUT  Crane_CraneTurnCounterclockwise : BOOL; END_VAR 
VAR_INPUT  Crane_CraneUp : BOOL; END_VAR 
VAR  Crane_Duration1 : UINT := UINT#375; END_VAR 
VAR_INPUT  Crane_MagazinCapacitiveSensor : BOOL; END_VAR 
VAR_OUTPUT  Crane_MagazinVacuumOff : BOOL; END_VAR 
VAR_OUTPUT  Crane_MagazinVacuumOn : BOOL; END_VAR 
VAR  Crane_SFCInit : BOOL; END_VAR 
VAR_INPUT  Crane_SFCReset : BOOL; END_VAR 
VAR_INPUT  Crane_SliderMovedOut : BOOL; END_VAR 
VAR_INPUT  Crane_SliderNotMovedOut : BOOL; END_VAR 
VAR_INPUT  Crane_StampLowered : BOOL; END_VAR 
VAR_INPUT  Crane_StampSliderFilled : BOOL; END_VAR 
VAR_INPUT  Crane_StartButtonMagazin : BOOL; END_VAR 
VAR_OUTPUT  Crane_StartCommandCrane : BOOL; END_VAR 
VAR_INPUT  Crane_StartVar : BOOL; END_VAR 
VAR_OUTPUT  Crane_TimeDelay_Timer_ET : USINT; END_VAR 
VAR_INPUT  Crane_TimeDelay_Timer_IN : BOOL; END_VAR 
VAR_INPUT  Crane_TimeDelay_Timer_PT : USINT; END_VAR 
VAR_OUTPUT  Crane_TimeDelay_Timer_Q : BOOL; END_VAR 
VAR  Crane_TimeDelay_Timer_Duration : UINT := UINT#12; END_VAR 
VAR  Crane_TimeDelay_Timer_interconnect : BOOL; END_VAR 
VAR_OUTPUT  Crane_Timer1_ET : USINT; END_VAR 
VAR_INPUT  Crane_Timer1_IN : BOOL; END_VAR 
VAR_INPUT  Crane_Timer1_PT : USINT; END_VAR 
VAR_OUTPUT  Crane_Timer1_Q : BOOL; END_VAR 
VAR_INPUT  Crane_WorkpieceReady : BOOL; END_VAR 
VAR  Crane_2state : Crane_states_t; END_VAR 
VAR  Crane_2transit : BOOL; END_VAR 
VAR  Crane_actualtime1 : INT; END_VAR 
VAR  Crane_interconnect : BOOL; END_VAR 
VAR  Crane_interconnectCraneStartCommand : BOOL; END_VAR 
VAR_INPUT  Mag_CraneDown : BOOL; END_VAR 
VAR_OUTPUT  Mag_CraneLower : BOOL; END_VAR 
VAR_INPUT  Mag_CraneOnConveyor : BOOL; END_VAR 
VAR_INPUT  Mag_CraneOnMagazin : BOOL; END_VAR 
VAR_INPUT  Mag_CraneSucked : BOOL; END_VAR 
VAR_OUTPUT  Mag_CraneTurnClockwise : BOOL; END_VAR 
VAR_OUTPUT  Mag_CraneTurnCounterclockwise : BOOL; END_VAR 
VAR_INPUT  Mag_CraneUp : BOOL; END_VAR 
VAR_OUTPUT  Mag_MagazinGreenLamp : BOOL; END_VAR 
VAR_OUTPUT  Mag_MagazinSlider : BOOL; END_VAR 
VAR_OUTPUT  Mag_MagazinVacuumOff : BOOL; END_VAR 
VAR_OUTPUT  Mag_MagazinVacuumOn : BOOL; END_VAR 
VAR_OUTPUT  Mag_MagazinWhiteLamp : BOOL; END_VAR 
VAR  Mag_SFCInit : BOOL; END_VAR 
VAR_INPUT  Mag_SFCReset : BOOL; END_VAR 
VAR_INPUT  Mag_SliderMovedOut : BOOL; END_VAR 
VAR_INPUT  Mag_SliderNotMovedOut : BOOL; END_VAR 
VAR_INPUT  Mag_StartButtonMagazin : BOOL; END_VAR 
VAR_OUTPUT  Mag_StartCommandMagazin : BOOL; END_VAR 
VAR_INPUT  Mag_StartVar : BOOL; END_VAR 
VAR_INPUT  Mag_WorkpieceReady : BOOL; END_VAR 
VAR  Mag_2state : Magazin_states_t; END_VAR 
VAR  Mag_2transit : BOOL; END_VAR 
VAR  Mag_interconnectMagazinStartCommand : BOOL; END_VAR 
VAR  Sensor_CraneDown : BOOL; END_VAR 
VAR  Sensor_CraneOnConveyor : BOOL; END_VAR 
VAR  Sensor_CraneOnMagazin : BOOL; END_VAR 
VAR  Sensor_CranePosition : BOOL; END_VAR 
VAR  Sensor_CranePositionStamp : BOOL; END_VAR 
VAR  Sensor_CraneSucked : BOOL; END_VAR 
VAR  Sensor_CraneUp : BOOL; END_VAR 
VAR  Sensor_MagazinCapacitiveSensor : BOOL; END_VAR 
VAR  Sensor_MagazinEmergencyStop : BOOL; END_VAR 
VAR  Sensor_MagazinOpticalSensor : BOOL; END_VAR 
VAR  Sensor_MagazinSwitchManuellAutomatic : BOOL; END_VAR 
VAR  Sensor_SliderMovedOut : BOOL; END_VAR 
VAR  Sensor_SliderNotMovedOut : BOOL; END_VAR 
VAR  Sensor_StampEmergencyStop : BOOL; END_VAR 
VAR  Sensor_StampLowered : BOOL; END_VAR 
VAR  Sensor_StampSliderFilled : BOOL; END_VAR 
VAR  Sensor_StampSliderSensorMovedIn : BOOL; END_VAR 
VAR  Sensor_StampSliderSensorMovedOut : BOOL; END_VAR 
VAR  Sensor_StampStartButton : BOOL; END_VAR 
VAR  Sensor_StampSwitchManuellAutomatic : BOOL; END_VAR 
VAR  Sensor_StampUp : BOOL; END_VAR 
VAR  Sensor_StartButtonMagazin : BOOL; END_VAR 
VAR  Sensor_WorkpieceReady : BOOL; END_VAR 
VAR_INPUT  Stamp_CraneDown : BOOL; END_VAR 
VAR_INPUT  Stamp_CraneOnConveyor : BOOL; END_VAR 
VAR_INPUT  Stamp_CranePositionStamp : BOOL; END_VAR 
VAR_INPUT  Stamp_CraneSucked : BOOL; END_VAR 
VAR_INPUT  Stamp_CraneUp : BOOL; END_VAR 
VAR  Stamp_Duration : UINT := UINT#125; END_VAR 
VAR  Stamp_SFCInit : BOOL; END_VAR 
VAR_INPUT  Stamp_SFCReset : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampGreenLamp : BOOL; END_VAR 
VAR_INPUT  Stamp_StampLowered : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampPressure : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampPusher : BOOL; END_VAR 
VAR_INPUT  Stamp_StampSliderFilled : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampSliderMovedIn : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampSliderMovedOut : BOOL; END_VAR 
VAR_INPUT  Stamp_StampSliderSensorMovedIn : BOOL; END_VAR 
VAR_INPUT  Stamp_StampSliderSensorMovedOut : BOOL; END_VAR 
VAR_INPUT  Stamp_StampStartButton : BOOL; END_VAR 
VAR_INPUT  Stamp_StampUp : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StampWhiteLamp : BOOL; END_VAR 
VAR_OUTPUT  Stamp_StartCommandStamp : BOOL; END_VAR 
VAR_INPUT  Stamp_StartVar : BOOL; END_VAR 
VAR_OUTPUT  Stamp_Timer_ET : USINT; END_VAR 
VAR_INPUT  Stamp_Timer_IN : BOOL; END_VAR 
VAR_INPUT  Stamp_Timer_PT : USINT; END_VAR 
VAR_OUTPUT  Stamp_Timer_Q : BOOL; END_VAR 
VAR  Stamp_2state : Stamp_states_t; END_VAR 
VAR  Stamp_2transit : BOOL; END_VAR 
VAR  Stamp_interconnect : BOOL; END_VAR 
VAR  Stamp_interconnectStampStartCommand : BOOL; END_VAR 
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
Crane_StampSliderFilled := Sensor_StampSliderFilled;
Crane_SliderMovedOut := Sensor_SliderMovedOut;
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
            
            
            IF Crane_CraneUp THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#pause;
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
            
            
            
            
        
        Crane_states_t#Crane_Lift_Conveyor:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneLower := FALSE;
            
            
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep;
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
            
            
            
            
        
        Crane_states_t#Crane_On_Stamp_Metallic:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            
            
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#release_Workpiece;
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
            
            
            
            
        
        Crane_states_t#Crane_Turn_Left_NOT_Metallic:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            
            
            IF Crane_CraneOnConveyor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_On_Conveyor;
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
            
            
            
            
        
        Crane_states_t#Interstep_Check_Workpiece:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterClockwise := FALSE;
            
            
            IF Crane_WorkpieceReady THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lower;
            ELSIF (NOT Crane_WorkpieceReady AND NOT Crane_StampSliderFilled) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Step2;
            ELSIF (NOT Crane_WorkpieceReady AND Crane_StampSliderFilled) THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Wait_At_Stamp;
            END_IF;
            
            
            
            
        
        Crane_states_t#Lower_Crane:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneLower := TRUE;
            
            
            IF Crane_CraneDown THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Suck_At_Stamp;
            END_IF;
            
            
            
            
        
        Crane_states_t#Reset_interconnect:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_interconnect := FALSE;
            Crane_Timer1_IN := FALSE;
            Crane_Timer1_PT := USINT#0;
            IF Crane_Timer1_IN THEN
                Crane_Timer1_Q := (Crane_Timer1_ET = USINT#0);
                IF (Crane_Timer1_ET > USINT#0) THEN
                    Crane_Timer1_ET := (Crane_Timer1_ET - USINT#1);
                ELSE
                    Crane_Timer1_ET := USINT#0;
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
            Crane_MagazinVacuumOff := TRUE;
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
            
            
            
            
            IF NOT Crane_MagazinCapacitiveSensor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Magazin;
            ELSIF Crane_MagazinCapacitiveSensor THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_Magazin_Metallic;
            END_IF;
            
            
            
            
        
        Crane_states_t#Step2:
            
            
            Crane_2transit := FALSE;
            
            
            
            
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Start_Crane;
            END_IF;
            
            
            
            
        
        Crane_states_t#Suck_At_Stamp:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            
            
            IF Crane_CraneSucked THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Crane_Lift_At_Stamp;
            END_IF;
            
            
            
            
        
        Crane_states_t#TimeDelay:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_TimeDelay_Timer_IN := TRUE;
            Crane_TimeDelay_Timer_PT := UINT_TO_USINT(Crane_TimeDelay_Timer_Duration);
            IF Crane_TimeDelay_Timer_IN THEN
                Crane_TimeDelay_Timer_Q := (Crane_TimeDelay_Timer_ET = USINT#0);
                IF (Crane_TimeDelay_Timer_ET > USINT#0) THEN
                    Crane_TimeDelay_Timer_ET := (Crane_TimeDelay_Timer_ET - USINT#1);
                ELSE
                    Crane_TimeDelay_Timer_ET := USINT#0;
                END_IF;
            ELSE
                Crane_TimeDelay_Timer_Q := FALSE;
                Crane_TimeDelay_Timer_ET := Crane_TimeDelay_Timer_PT;
            END_IF;
            Crane_TimeDelay_Timer_interconnect := Crane_TimeDelay_Timer_Q;
            
            
            IF Crane_TimeDelay_Timer_interconnect THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Turn_Right;
            END_IF;
            
            
            
            
        
        Crane_states_t#Turn_Right:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            
            
            IF Crane_CraneOnMagazin THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#Interstep_Check_Workpiece;
            END_IF;
            
            
            
            
        
        Crane_states_t#Wait_At_Stamp:
            
            
            Crane_2transit := FALSE;
            
            
            
            
            IF TRUE THEN
                Crane_2transit := TRUE;
                Crane_2state := Crane_states_t#pause;
            END_IF;
            
            
            
            
        
        Crane_states_t#pause:
            
            
            Crane_2transit := FALSE;
            
            
            Crane_Timer1_IN := Crane_CraneUp;
            Crane_Timer1_PT := UINT_TO_USINT(Crane_Duration1);
            IF Crane_Timer1_IN THEN
                Crane_Timer1_Q := (Crane_Timer1_ET = USINT#0);
                IF (Crane_Timer1_ET > USINT#0) THEN
                    Crane_Timer1_ET := (Crane_Timer1_ET - USINT#1);
                ELSE
                    Crane_Timer1_ET := USINT#0;
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
            Stamp_Timer_PT := USINT#0;
            IF Stamp_Timer_IN THEN
                Stamp_Timer_Q := (Stamp_Timer_ET = USINT#0);
                IF (Stamp_Timer_ET > USINT#0) THEN
                    Stamp_Timer_ET := (Stamp_Timer_ET - USINT#1);
                ELSE
                    Stamp_Timer_ET := USINT#0;
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
            Stamp_Timer_PT := USINT#0;
            IF Stamp_Timer_IN THEN
                Stamp_Timer_Q := (Stamp_Timer_ET = USINT#0);
                IF (Stamp_Timer_ET > USINT#0) THEN
                    Stamp_Timer_ET := (Stamp_Timer_ET - USINT#1);
                ELSE
                    Stamp_Timer_ET := USINT#0;
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
            
            
            
            
            IF Stamp_CraneOnConveyor THEN
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
