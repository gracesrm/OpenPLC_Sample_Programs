TYPE
    Crane_states_t : (Crane_Go_Up , Crane_Go_Up_White , Crane_Init , Crane_Init_2 , Crane_Lift_At_Stamp , Crane_Lift_At_Stamp2 , Crane_Lift_Conveyor , Crane_Lift_Conveyor2 , Crane_Lift_Conveyor_Black , Crane_Lift_Magazin , Crane_Lift_Magazin_Metallic , Crane_Lift_Magazin_White , Crane_Lift_NOT_Metallic_Black , Crane_Lower , Crane_On_Conveyor , Crane_On_Conveyor_Metallic , Crane_On_Conveyor_Metallic2 , Crane_On_Conveyor_Not_Metallica_Black , Crane_On_Stamp_Metallic , Crane_On_Stamp_Metallic2 , Crane_On_Stamp_Metallic2_Lower , Crane_On_Stamp_Stop_Black , Crane_On_Stamp_White , Crane_Turn_Left_Back_To_Stamp , Crane_Turn_Left_From_Stamp , Crane_Turn_Left_Metallic , Crane_Turn_Left_Metallic2 , Crane_Turn_Left_NOT_Metallic , Crane_Turn_Left_NOT_Metallic_Black , Crane_Turn_Left_White , Crane_Turn_Right_From_Stamp , Init , Interstep , Interstep_2 , Interstep_3 , Interstep_4 , Lower_Crane , Magazin_Stop , Magazin_Stop_Black , Magazin_Stop_Final , No_Workpiece_ready , Reset_interconnect , Stamp_Pressure_Profile_Set_Metallic , Stamp_Pressure_Profile_Set_White , Start_Crane , Step0 , Step2 , Step3 , Step4 , Suck_At_Stamp , Suck_At_Stamp2 , TimeDelay , Turn_Right , Turn_Right_Black , Turn_Right_Final , pause , release , release2 , release_Black , release_Workpiece , release_Workpiece_White);
    Magazin_states_t : (Green_Lamp , Init , Interstep , Magazin_Init , Magazin_Init_2 , Slider_Move_Back , Start_Magazin , Step0 , Step1 , convey);
    Conveyor_states_t : (Conveyor_Init , Conveyor_Stop_Empty_Magazin , Conveyor_Towards_Stacker , Conveyor_init_2 , Conveyor_pause , Green_Lamp , Init , Interstep , Runtime_Conveyor , Start_Conveyor , Step0);
    Stamp_states_t : (Green_Lamp , Init , Interstep , Intertsep_2 , StampProcess , StampSliderBack , StampSliderForward , Stamp_Init_1 , Stamp_Init_2 , Stamp_Init_3 , Stamp_Init_4 , Start_Stamp , Step0 , Step1 , Step2);
    Pusher_states_t : (Check_For_Black , Check_For_Metal , Check_For_White , First_Slide_Timer_Black , First_Slide_Timer_Metal , First_Slide_Timer_White , First_Slide_black_workpieces , First_Slide_metal_workpieces , First_Slide_white_workpieces , Init , Interstep , Interstep_2 , PusherY1_Move_In_Black , PusherY1_Move_In_Metal , PusherY1_Move_In_White , PusherY1_Move_Out_Black , PusherY1_Move_Out_Metal , PusherY1_Move_Out_White , PusherY2_Move_In_Black , PusherY2_Move_In_Metal , PusherY2_Move_In_White , PusherY2_Move_Out_Black , PusherY2_Move_Out_Metal , PusherY2_Move_Out_White , Reset_interconnect3 , Reset_interconnect_Slide1_Black , Reset_interconnect_Slide1_Metal , Reset_interconnect_Slide1_White , Reset_interconnect_Slide2_Black , Reset_interconnect_Slide2_Metal , Reset_interconnect_Slide2_White , Reset_interconnect_Slide3_Metal , Reset_interconnect_Slide3_White , Second_Slide_Timer_Black , Second_Slide_Timer_Metal , Second_Slide_Timer_White , Second_Slide_black_workpieces , Second_Slide_metal_workpieces , Second_Slide_white_workpieces , Second_Test_For_Metal , Second_Test_For_White , Third_Slide_black_workpieces , Third_Slide_metal_workpieces , Third_Slide_white_workpieces , Wait_Black , Wait_Metal , Wait_White , Wait_Y1_Black , Wait_Y1_Metal , Wait_Y1_White , Wait_Y2_Black , Wait_Y2_Metal , Wait_Y2_White);
END_TYPE


PROGRAM Main
VAR_OUTPUT  Actuator_AnalogCranePressure : INT; END_VAR
VAR_OUTPUT  Actuator_CraneLower : BOOL; END_VAR
VAR_OUTPUT  Actuator_CraneTurnClockwise : BOOL; END_VAR
VAR_OUTPUT  Actuator_CraneTurnCounterclockwise : BOOL; END_VAR
VAR_OUTPUT  Actuator_MagazinGreenLamp : BOOL; END_VAR
VAR_OUTPUT  Actuator_MagazinSlider : BOOL; END_VAR
VAR_OUTPUT  Actuator_MagazinVacuumOff : BOOL; END_VAR
VAR_OUTPUT  Actuator_MagazinVacuumOn : BOOL; END_VAR
VAR_OUTPUT  Actuator_MagazinWhiteLamp : BOOL; END_VAR
VAR_OUTPUT  Actuator_PusherY1 : BOOL; END_VAR
VAR_OUTPUT  Actuator_PusherY2 : BOOL; END_VAR
VAR_OUTPUT  Actuator_SorterConveyorTowardsCrane : BOOL; END_VAR
VAR_OUTPUT  Actuator_SorterConveyorTowardsStacker : BOOL; END_VAR
VAR_OUTPUT  Actuator_SorterGreenLampConveyor : BOOL; END_VAR
VAR_OUTPUT  Actuator_SorterWhiteLampConveyor : BOOL; END_VAR
VAR_OUTPUT  Actuator_StampGreenLamp : BOOL; END_VAR
VAR_OUTPUT  Actuator_StampPusher : BOOL; END_VAR
VAR_OUTPUT  Actuator_StampSliderMovedIn : BOOL; END_VAR
VAR_OUTPUT  Actuator_StampSliderMovedOut : BOOL; END_VAR
VAR_OUTPUT  Actuator_StampWhiteLamp : BOOL; END_VAR
VAR  Conveyor_Duration_Conveyor_Runtime : UINT := 1125; END_VAR
VAR  Conveyor_Duration_Conveyor_Test : UINT := 250; END_VAR
VAR  Conveyor_SFCInit : BOOL; END_VAR
VAR  Conveyor_SFCReset : BOOL; END_VAR
VAR  Conveyor_SorterConveyorTowardsCrane : BOOL; END_VAR
VAR  Conveyor_SorterConveyorTowardsStacker : BOOL; END_VAR
VAR  Conveyor_SorterGreenLampConveyor : BOOL; END_VAR
VAR  Conveyor_SorterLightbarrierCraneInterface : BOOL; END_VAR
VAR  Conveyor_SorterStartButton : BOOL; END_VAR
VAR  Conveyor_SorterSwitchManuellAutomatic : BOOL; END_VAR
VAR  Conveyor_SorterWhiteLampConveyor : BOOL; END_VAR
VAR  Conveyor_StartCommandConveyor : BOOL; END_VAR
VAR  Conveyor_StartVar : BOOL; END_VAR
VAR  Conveyor_Timer_Conveyor_Runtime_ET : USINT; END_VAR
VAR  Conveyor_Timer_Conveyor_Runtime_IN : BOOL; END_VAR
VAR  Conveyor_Timer_Conveyor_Runtime_PT : USINT; END_VAR
VAR  Conveyor_Timer_Conveyor_Runtime_Q : BOOL; END_VAR
VAR  Conveyor_Timer_Conveyor_Test_ET : USINT; END_VAR
VAR  Conveyor_Timer_Conveyor_Test_IN : BOOL; END_VAR
VAR  Conveyor_Timer_Conveyor_Test_PT : USINT; END_VAR
VAR  Conveyor_Timer_Conveyor_Test_Q : BOOL; END_VAR
VAR  Conveyor2_state : Conveyor_states_t; END_VAR
VAR  Conveyor2_transit : BOOL; END_VAR
VAR  Conveyor_interconnectConveyorStartCommand : BOOL; END_VAR
VAR  Conveyor_interconnectConveyorTerminationCommand : BOOL; END_VAR
VAR  Conveyor_interconnect_Conveyor_Runtime : BOOL; END_VAR
VAR  Conveyor_interconnect_Conveyor_Test : BOOL; END_VAR
VAR  Crane_AnalogCranePosition : INT; END_VAR
VAR  Crane_AnalogCranePressure : INT; END_VAR
VAR  Crane_CraneDown : BOOL; END_VAR
VAR  Crane_CraneLower : BOOL; END_VAR
VAR  Crane_CraneSucked : BOOL; END_VAR
VAR  Crane_CraneTurnClockwise : BOOL; END_VAR
VAR  Crane_CraneTurnCounterclockwise : BOOL; END_VAR
VAR  Crane_CraneUp : BOOL; END_VAR
VAR  Crane_Duration1 : UINT := 375; END_VAR
VAR  Crane_MagazinCapacitiveSensor : BOOL; END_VAR
VAR  Crane_MagazinOpticalSensor : BOOL; END_VAR
VAR  Crane_MagazinSlider : BOOL; END_VAR
VAR  Crane_MagazinVacuumOff : BOOL; END_VAR
VAR  Crane_MagazinVacuumOn : BOOL; END_VAR
VAR  Crane_SFCInit : BOOL; END_VAR
VAR  Crane_SFCReset : BOOL; END_VAR
VAR  Crane_SliderMovedOut : BOOL; END_VAR
VAR  Crane_SliderNotMovedOut : BOOL; END_VAR
VAR  Crane_StampLowered : BOOL; END_VAR
VAR  Crane_StampSliderFilled : BOOL; END_VAR
VAR  Crane_StampSliderSensorMovedOut : BOOL; END_VAR
VAR  Crane_StartButtonMagazin : BOOL; END_VAR
VAR  Crane_StartCommandCrane : BOOL; END_VAR
VAR  Crane_StartVar : BOOL; END_VAR
VAR  Crane_TimeDelay_Timer_ET : USINT; END_VAR
VAR  Crane_TimeDelay_Timer_IN : BOOL; END_VAR
VAR  Crane_TimeDelay_Timer_PT : UINT; END_VAR
VAR  Crane_TimeDelay_Timer_Q : BOOL; END_VAR
VAR  Crane_TimeDelay_Timer_Duration : UINT := 12; END_VAR
VAR  Crane_TimeDelay_Timer_interconnect : BOOL; END_VAR
VAR  Crane_Timer1_ET : USINT; END_VAR
VAR  Crane_Timer1_IN : BOOL; END_VAR
VAR  Crane_Timer1_PT : USINT; END_VAR
VAR  Crane_Timer1_Q : BOOL; END_VAR
VAR  Crane_WorkpieceReady : BOOL; END_VAR
VAR  Crane2_state : Crane_states_t; END_VAR
VAR  Crane2_transit : BOOL; END_VAR
VAR  Crane_actualtime1 : INT; END_VAR
VAR  Crane_interconnect : BOOL; END_VAR
VAR  Crane_interconnectCraneStartCommand : BOOL; END_VAR
VAR  Mag_AnalogCranePosition : INT; END_VAR
VAR  Mag_CraneDown : BOOL; END_VAR
VAR  Mag_CraneLower : BOOL; END_VAR
VAR  Mag_CraneOnConveyor : BOOL; END_VAR
VAR  Mag_CraneOnMagazin : BOOL; END_VAR
VAR  Mag_CraneSucked : BOOL; END_VAR
VAR  Mag_CraneTurnClockwise : BOOL; END_VAR
VAR  Mag_CraneTurnCounterclockwise : BOOL; END_VAR
VAR  Mag_CraneUp : BOOL; END_VAR
VAR  Mag_MagazinGreenLamp : BOOL; END_VAR
VAR  Mag_MagazinSlider : BOOL; END_VAR
VAR  Mag_MagazinVacuumOff : BOOL; END_VAR
VAR  Mag_MagazinVacuumOn : BOOL; END_VAR
VAR  Mag_MagazinWhiteLamp : BOOL; END_VAR
VAR  Mag_SFCInit : BOOL; END_VAR
VAR  Mag_SFCReset : BOOL; END_VAR
VAR  Mag_SliderMovedOut : BOOL; END_VAR
VAR  Mag_SliderNotMovedOut : BOOL; END_VAR
VAR  Mag_StartButtonMagazin : BOOL; END_VAR
VAR  Mag_StartCommandMagazin : BOOL; END_VAR
VAR  Mag_StartVar : BOOL; END_VAR
VAR  Mag_WorkpieceReady : BOOL; END_VAR
VAR  Mag2_state : Magazin_states_t; END_VAR
VAR  Mag2_transit : BOOL; END_VAR
VAR  Mag_interconnectMagazinStartCommand : BOOL; END_VAR
VAR  Pusher_Duration2 : UINT := 500; END_VAR
VAR  Pusher_Duration3 : UINT := 50; END_VAR
VAR  Pusher_Duration_Slide1_Black : UINT := 237; END_VAR
VAR  Pusher_Duration_Slide1_Metal : UINT := 75; END_VAR
VAR  Pusher_Duration_Slide1_White : UINT := 75; END_VAR
VAR  Pusher_Duration_Slide2_Black : UINT := 500; END_VAR
VAR  Pusher_Duration_Slide2_Metal : UINT := 92; END_VAR
VAR  Pusher_Duration_Slide2_White : UINT := 92; END_VAR
VAR  Pusher_Priority_Var_Black : INT := 3; END_VAR
VAR  Pusher_Priority_Var_Metal : INT := 3; END_VAR
VAR  Pusher_Priority_Var_White : INT := 3; END_VAR
VAR  Pusher_PusherY1 : BOOL; END_VAR
VAR  Pusher_PusherY2 : BOOL; END_VAR
VAR  Pusher_SFCInit : BOOL; END_VAR
VAR  Pusher_SFCReset : BOOL; END_VAR
VAR  Pusher_Slide1_black : INT := 1; END_VAR
VAR  Pusher_Slide1_metal : INT := 1; END_VAR
VAR  Pusher_Slide1_white : INT := 1; END_VAR
VAR  Pusher_Slide2_black : INT := 1; END_VAR
VAR  Pusher_Slide2_metal : INT := 1; END_VAR
VAR  Pusher_Slide2_white : INT := 1; END_VAR
VAR  Pusher_Slide3_black : INT := 1; END_VAR
VAR  Pusher_Slide3_metal : INT := 1; END_VAR
VAR  Pusher_Slide3_white : INT := 1; END_VAR
VAR  Pusher_SorterCapacitiveSensorPusher1 : BOOL; END_VAR
VAR  Pusher_SorterCapacitiveSensorPusher2 : BOOL; END_VAR
VAR  Pusher_SorterLightbarrierCraneInterface : BOOL; END_VAR
VAR  Pusher_SorterLightnessSensorPusher1 : BOOL; END_VAR
VAR  Pusher_SorterLightnessSensorPusher2 : BOOL; END_VAR
VAR  Pusher_SorterLightnessSensorPusher3 : BOOL; END_VAR
VAR  Pusher_SorterLightnesssensorCraneInterfaceInverse : BOOL; END_VAR
VAR  Pusher_SorterPusher1MovedIn : BOOL; END_VAR
VAR  Pusher_SorterPusher1MovedOut : BOOL; END_VAR
VAR  Pusher_SorterPusher2MovedIn : BOOL; END_VAR
VAR  Pusher_SorterPusher2MovedOut : BOOL; END_VAR
VAR  Pusher_SorterStartButton : BOOL; END_VAR
VAR  Pusher_StartVar : BOOL; END_VAR
VAR  Pusher_Timer2_ET : USINT; END_VAR
VAR  Pusher_Timer2_IN : BOOL; END_VAR
VAR  Pusher_Timer2_PT : USINT; END_VAR
VAR  Pusher_Timer2_Q : BOOL; END_VAR
VAR  Pusher_Timer3_ET : USINT; END_VAR
VAR  Pusher_Timer3_IN : BOOL; END_VAR
VAR  Pusher_Timer3_PT : USINT; END_VAR
VAR  Pusher_Timer3_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_Black_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide1_Black_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_Black_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide1_Black_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_Metal_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide1_Metal_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_Metal_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide1_Metal_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_White_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide1_White_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide1_White_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide1_White_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_Black_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide2_Black_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_Black_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide2_Black_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_Metal_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide2_Metal_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_Metal_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide2_Metal_Q : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_White_ET : USINT; END_VAR
VAR  Pusher_Timer_Slide2_White_IN : BOOL; END_VAR
VAR  Pusher_Timer_Slide2_White_PT : USINT; END_VAR
VAR  Pusher_Timer_Slide2_White_Q : BOOL; END_VAR
VAR  Pusher2_state : Pusher_states_t; END_VAR
VAR  Pusher2_transit : BOOL; END_VAR
VAR  Pusher_interconnect2 : BOOL; END_VAR
VAR  Pusher_interconnect3 : BOOL; END_VAR
VAR  Pusher_interconnect_Slide1_Black : BOOL; END_VAR
VAR  Pusher_interconnect_Slide1_Metal : BOOL; END_VAR
VAR  Pusher_interconnect_Slide1_White : BOOL; END_VAR
VAR  Pusher_interconnect_Slide2_Black : BOOL; END_VAR
VAR  Pusher_interconnect_Slide2_Metal : BOOL; END_VAR
VAR  Pusher_interconnect_Slide2_White : BOOL; END_VAR
VAR_INPUT  Sensor_AnalogCranePosition : INT; END_VAR
VAR_INPUT  Sensor_CraneDown : BOOL; END_VAR
VAR_INPUT  Sensor_CraneOnConveyor : BOOL; END_VAR
VAR_INPUT  Sensor_CraneOnMagazin : BOOL; END_VAR
VAR_INPUT  Sensor_CranePosition : BOOL; END_VAR
VAR_INPUT  Sensor_CranePositionStamp : BOOL; END_VAR
VAR_INPUT  Sensor_CraneSucked : BOOL; END_VAR
VAR_INPUT  Sensor_CraneUp : BOOL; END_VAR
VAR_INPUT  Sensor_MagazinCapacitiveSensor : BOOL; END_VAR
VAR_INPUT  Sensor_MagazinEmergencyStop : BOOL; END_VAR
VAR_INPUT  Sensor_MagazinOpticalSensor : BOOL; END_VAR
VAR_INPUT  Sensor_MagazinSwitchManuellAutomatic : BOOL; END_VAR
VAR_INPUT  Sensor_SliderMovedOut : BOOL; END_VAR
VAR_INPUT  Sensor_SliderNotMovedOut : BOOL; END_VAR
VAR_INPUT  Sensor_SorterCapacitiveSensorPusher1 : BOOL; END_VAR
VAR_INPUT  Sensor_SorterCapacitiveSensorPusher2 : BOOL; END_VAR
VAR_INPUT  Sensor_SorterEmergencyStop : BOOL; END_VAR
VAR_INPUT  Sensor_SorterLightbarrierCraneInterface : BOOL; END_VAR
VAR_INPUT  Sensor_SorterLightnessSensorPusher1 : BOOL; END_VAR
VAR_INPUT  Sensor_SorterLightnessSensorPusher2 : BOOL; END_VAR
VAR_INPUT  Sensor_SorterLightnessSensorPusher3 : BOOL; END_VAR
VAR_INPUT  Sensor_SorterLightnesssensorCraneInterfaceInverse : BOOL; END_VAR
VAR_INPUT  Sensor_SorterPusher1MovedIn : BOOL; END_VAR
VAR_INPUT  Sensor_SorterPusher1MovedOut : BOOL; END_VAR
VAR_INPUT  Sensor_SorterPusher2MovedIn : BOOL; END_VAR
VAR_INPUT  Sensor_SorterPusher2MovedOut : BOOL; END_VAR
VAR_INPUT  Sensor_SorterStartButton : BOOL; END_VAR
VAR_INPUT  Sensor_SorterSwitchManuellAutomatic : BOOL; END_VAR
VAR_INPUT  Sensor_StampEmergencyStop : BOOL; END_VAR
VAR_INPUT  Sensor_StampLowered : BOOL; END_VAR
VAR_INPUT  Sensor_StampSliderFilled : BOOL; END_VAR
VAR_INPUT  Sensor_StampSliderSensorMovedIn : BOOL; END_VAR
VAR_INPUT  Sensor_StampSliderSensorMovedOut : BOOL; END_VAR
VAR_INPUT  Sensor_StampStartButton : BOOL; END_VAR
VAR_INPUT  Sensor_StampSwitchManuellAutomatic : BOOL; END_VAR
VAR_INPUT  Sensor_StampUp : BOOL; END_VAR
VAR_INPUT  Sensor_StartButtonMagazin : BOOL; END_VAR
VAR_INPUT  Sensor_WorkpieceReady : BOOL; END_VAR
VAR  Stamp_AnalogCranePosition : INT; END_VAR
VAR  Stamp_CraneDown : BOOL; END_VAR
VAR  Stamp_CraneOnConveyor : BOOL; END_VAR
VAR  Stamp_CranePositionStamp : BOOL; END_VAR
VAR  Stamp_CraneSucked : BOOL; END_VAR
VAR  Stamp_CraneUp : BOOL; END_VAR
VAR  Stamp_Duration : UINT := 125; END_VAR

VAR  Stamp_SFCInit : BOOL; END_VAR
VAR  Stamp_SFCReset : BOOL; END_VAR
VAR  Stamp_StampGreenLamp : BOOL; END_VAR
VAR  Stamp_StampLowered : BOOL; END_VAR
VAR  Stamp_StampPressure : BOOL; END_VAR
VAR  Stamp_StampPusher : BOOL; END_VAR
VAR  Stamp_StampSliderFilled : BOOL; END_VAR
VAR  Stamp_StampSliderMovedIn : BOOL; END_VAR
VAR  Stamp_StampSliderMovedOut : BOOL; END_VAR
VAR  Stamp_StampSliderSensorMovedIn : BOOL; END_VAR
VAR  Stamp_StampSliderSensorMovedOut : BOOL; END_VAR
VAR  Stamp_StampStartButton : BOOL; END_VAR
VAR  Stamp_StampUp : BOOL; END_VAR
VAR  Stamp_StampWhiteLamp : BOOL; END_VAR
VAR  Stamp_StartCommandStamp : BOOL; END_VAR
VAR  Stamp_StartVar : BOOL; END_VAR
VAR  Stamp_Timer_ET : USINT; END_VAR
VAR  Stamp_Timer_IN : BOOL; END_VAR
VAR  Stamp_Timer_PT : USINT; END_VAR
VAR  Stamp_Timer_Q : BOOL; END_VAR
VAR  Stamp2_state : Stamp_states_t; END_VAR
VAR  Stamp2_transit : BOOL; END_VAR
VAR  Stamp_interconnect : BOOL; END_VAR
VAR  Stamp_interconnectStampStartCommand : BOOL; END_VAR

VAR  DIAGNOSIS_ACTIVE : BOOL; END_VAR

VAR_INPUT PARAMETER_CRANE_PRESSURE_METALLIC : INT := 6000; END_VAR
VAR_INPUT PARAMETER_CRANE_PRESSURE_WHITE : INT := 7000; END_VAR


Mag_SliderNotMovedOut := Sensor_SliderNotMovedOut;
Mag_SliderMovedOut := Sensor_SliderMovedOut;
Mag_CraneOnMagazin := Sensor_CraneOnMagazin;
Mag_CraneDown := Sensor_CraneDown;
Mag_CraneUp := Sensor_CraneUp;
Mag_CraneOnConveyor := Sensor_CraneOnConveyor;
Mag_WorkpieceReady := Sensor_WorkpieceReady;
Mag_AnalogCranePosition := Sensor_AnalogCranePosition;
Mag_StartButtonMagazin := Sensor_StartButtonMagazin;
Actuator_MagazinSlider := Mag_MagazinSlider;
Actuator_MagazinGreenLamp := Mag_MagazinGreenLamp;
Crane_CraneUp := Sensor_CraneUp;
Crane_CraneDown := Sensor_CraneDown;
Crane_CraneSucked := Sensor_CraneSucked;
Crane_MagazinCapacitiveSensor := Sensor_MagazinCapacitiveSensor;
Crane_SliderMovedOut := Sensor_SliderMovedOut;
Crane_WorkpieceReady := Sensor_WorkpieceReady;
Crane_MagazinOpticalSensor := Sensor_MagazinOpticalSensor;
Crane_StampSliderFilled := Sensor_StampSliderFilled;
Crane_StampSliderSensorMovedOut := Sensor_StampSliderSensorMovedOut;
Crane_StampLowered := Sensor_StampLowered;
Crane_AnalogCranePosition := Sensor_AnalogCranePosition;
Crane_StartButtonMagazin := Sensor_StartButtonMagazin;

(* Diagnosis *)
(* old: Actuator_AnalogCranePressure  *)
(* new: Crane_AnalogCranePressure; *)
Actuator_CraneTurnCounterclockwise := Crane_CraneTurnCounterclockwise;
Actuator_CraneTurnClockwise := Crane_CraneTurnClockwise;

IF DIAGNOSIS_ACTIVE THEN
    IF Sensor_CraneSucked AND (Crane_AnalogCranePressure <= 0 OR Crane_AnalogCranePressure > 10000) THEN
        Actuator_CraneTurnCounterclockwise := FALSE;
        Actuator_CraneTurnClockwise := FALSE;
    END_IF;
END_IF;

(* End of Diagnosis *)

Actuator_CraneLower := Crane_CraneLower;
Actuator_MagazinVacuumOff := Crane_MagazinVacuumOff;
Actuator_MagazinVacuumOn := Crane_MagazinVacuumOn;
Actuator_AnalogCranePressure := Crane_AnalogCranePressure;
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
Stamp_AnalogCranePosition := Sensor_AnalogCranePosition;
Stamp_StampStartButton := Sensor_StampStartButton;
Actuator_StampSliderMovedOut := Stamp_StampSliderMovedOut;
Actuator_StampSliderMovedIn := Stamp_StampSliderMovedIn;
Actuator_StampWhiteLamp := Stamp_StampWhiteLamp;
Actuator_StampPusher := Stamp_StampPusher;
Actuator_StampGreenLamp := Stamp_StampGreenLamp;
Conveyor_SorterStartButton := Sensor_SorterStartButton;
Conveyor_SorterSwitchManuellAutomatic := Sensor_SorterSwitchManuellAutomatic;
Conveyor_SorterLightbarrierCraneInterface := Sensor_SorterLightbarrierCraneInterface;
Actuator_SorterConveyorTowardsStacker := Conveyor_SorterConveyorTowardsStacker;
Actuator_SorterConveyorTowardsCrane := Conveyor_SorterConveyorTowardsCrane;
Actuator_SorterGreenLampConveyor := Conveyor_SorterGreenLampConveyor;
Actuator_SorterWhiteLampConveyor := Conveyor_SorterWhiteLampConveyor;
Pusher_SorterLightnesssensorCraneInterfaceInverse := Sensor_SorterLightnesssensorCraneInterfaceInverse;
Pusher_SorterLightbarrierCraneInterface := Sensor_SorterLightbarrierCraneInterface;
Pusher_SorterCapacitiveSensorPusher1 := Sensor_SorterCapacitiveSensorPusher1;
Pusher_SorterLightnessSensorPusher1 := Sensor_SorterLightnessSensorPusher1;
Pusher_SorterCapacitiveSensorPusher2 := Sensor_SorterCapacitiveSensorPusher2;
Pusher_SorterLightnessSensorPusher2 := Sensor_SorterLightnessSensorPusher2;
Pusher_SorterLightnessSensorPusher3 := Sensor_SorterLightnessSensorPusher3;
Pusher_SorterPusher1MovedOut := Sensor_SorterPusher1MovedOut;
Pusher_SorterPusher1MovedIn := Sensor_SorterPusher1MovedIn;
Pusher_SorterPusher2MovedOut := Sensor_SorterPusher2MovedOut;
Pusher_SorterPusher2MovedIn := Sensor_SorterPusher2MovedIn;
Pusher_SorterStartButton := Sensor_SorterStartButton;
Actuator_PusherY1 := Pusher_PusherY1;
Actuator_PusherY2 := Pusher_PusherY2;

IF ((Sensor_SorterEmergencyStop AND Sensor_StampEmergencyStop) AND Sensor_MagazinEmergencyStop) THEN
    CASE Mag2_state OF
        Magazin_states_t#Green_Lamp:
            Mag2_transit := FALSE;
            Mag_MagazinGreenLamp := TRUE;
            Mag_interconnectMagazinStartCommand := FALSE;
            IF TRUE THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Magazin_Init;
            END_IF;

        Magazin_states_t#Init:
            Mag2_transit := FALSE;
            IF TRUE THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Start_Magazin;
            END_IF;

        Magazin_states_t#Interstep:
            Mag2_transit := FALSE;
            Mag_StartCommandMagazin := TRUE;
            IF Mag_StartVar THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#convey;
            END_IF;

        Magazin_states_t#Magazin_Init:
            Mag2_transit := FALSE;
            Mag_MagazinSlider := TRUE;
            IF TRUE THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Magazin_Init_2;
            END_IF;

        Magazin_states_t#Magazin_Init_2:
            Mag2_transit := FALSE;
            Mag_MagazinSlider := FALSE;
            IF TRUE THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Interstep;
            END_IF;

        Magazin_states_t#Slider_Move_Back:
            Mag2_transit := FALSE;
            IF ((Mag_SliderMovedOut = TRUE) AND (Mag_SliderNotMovedOut = FALSE)) THEN
                Mag_MagazinSlider := FALSE;
            END_IF;
            IF Mag_CraneUp THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Step1;
            END_IF;

        Magazin_states_t#Start_Magazin:
            Mag2_transit := FALSE;
            Mag_MagazinSlider := FALSE;
            Mag_MagazinGreenLamp := FALSE;
            Mag_StartVar := FALSE;
            Mag_StartCommandMagazin := FALSE;
            IF (Mag_StartButtonMagazin = TRUE) THEN
                Mag_interconnectMagazinStartCommand := TRUE;
            END_IF;
            IF Mag_interconnectMagazinStartCommand THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Green_Lamp;
            END_IF;

        Magazin_states_t#Step0:
            Mag2_transit := FALSE;
            IF Mag_CraneDown THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Slider_Move_Back;
            END_IF;

        Magazin_states_t#Step1:
            Mag2_transit := FALSE;
            IF ((Mag_AnalogCranePosition > 16160) AND (Mag_AnalogCranePosition < 16260)) THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Interstep;
            END_IF;

        Magazin_states_t#convey:
            Mag2_transit := FALSE;
            IF Mag_SliderNotMovedOut THEN
                Mag_MagazinSlider := TRUE;
            END_IF;
            IF ((Mag_AnalogCranePosition > 24290) AND (Mag_AnalogCranePosition < 24390)) THEN
                Mag2_transit := TRUE;
                Mag2_state := Magazin_states_t#Step0;
            END_IF;

            END_CASE;
    CASE Crane2_state OF
        Crane_states_t#Crane_Go_Up:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Step3;
            END_IF;

        Crane_states_t#Crane_Go_Up_White:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Step3;
            END_IF;

        Crane_states_t#Crane_Init:
            Crane2_transit := FALSE;
            Crane_CraneLower := TRUE;
            Crane_interconnectCraneStartCommand := FALSE;
            Crane_AnalogCranePressure := PARAMETER_CRANE_PRESSURE_METALLIC;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Init_2;
            END_IF;

        Crane_states_t#Crane_Init_2:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep;
            END_IF;

        Crane_states_t#Crane_Lift_At_Stamp:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_From_Stamp;
            END_IF;

        Crane_states_t#Crane_Lift_At_Stamp2:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            Crane_AnalogCranePressure := 0;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Right_From_Stamp;
            END_IF;

        Crane_states_t#Crane_Lift_Conveyor:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep;
            END_IF;

        Crane_states_t#Crane_Lift_Conveyor2:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep;
            END_IF;

        Crane_states_t#Crane_Lift_Conveyor_Black:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_Back_To_Stamp;
            END_IF;

        Crane_states_t#Crane_Lift_Magazin:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_NOT_Metallic;
            END_IF;

        Crane_states_t#Crane_Lift_Magazin_Metallic:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_Metallic;
            END_IF;

        Crane_states_t#Crane_Lift_Magazin_White:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_White;
            END_IF;

        Crane_states_t#Crane_Lift_NOT_Metallic_Black:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_CraneUp THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black;
            END_IF;

        Crane_states_t#Crane_Lower:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := TRUE;
            Crane_AnalogCranePressure := 0;
            IF Crane_CraneSucked THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Step0;
            END_IF;

        Crane_states_t#Crane_On_Conveyor:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release;
            END_IF;

        Crane_states_t#Crane_On_Conveyor_Metallic:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release;
            END_IF;

        Crane_states_t#Crane_On_Conveyor_Metallic2:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release2;
            END_IF;

        Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release_Black;
            END_IF;

        Crane_states_t#Crane_On_Stamp_Metallic:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release_Workpiece;
            END_IF;

        Crane_states_t#Crane_On_Stamp_Metallic2:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            IF Crane_StampLowered THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep_4;
            END_IF;

        Crane_states_t#Crane_On_Stamp_Metallic2_Lower:
            Crane2_transit := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Suck_At_Stamp2;
            END_IF;

        Crane_states_t#Crane_On_Stamp_Stop_Black:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Reset_interconnect;
            END_IF;

        Crane_states_t#Crane_On_Stamp_White:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#release_Workpiece_White;
            END_IF;

        Crane_states_t#Crane_Turn_Left_Back_To_Stamp:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 8160) AND (Crane_AnalogCranePosition < 8260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Stamp_Stop_Black;
            END_IF;

        Crane_states_t#Crane_Turn_Left_From_Stamp:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 16060) AND (Crane_AnalogCranePosition < 16160)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Conveyor_Metallic;
            END_IF;

        Crane_states_t#Crane_Turn_Left_Metallic:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 8160) AND (Crane_AnalogCranePosition < 8260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Stamp_Metallic;
            END_IF;

        Crane_states_t#Crane_Turn_Left_Metallic2:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 8160) AND (Crane_AnalogCranePosition < 8260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Stamp_Metallic2;
            END_IF;

        Crane_states_t#Crane_Turn_Left_NOT_Metallic:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 16160) AND (Crane_AnalogCranePosition < 16260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Conveyor;
            END_IF;

        Crane_states_t#Crane_Turn_Left_NOT_Metallic_Black:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 16160) AND (Crane_AnalogCranePosition < 16260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Conveyor_Not_Metallica_Black;
            END_IF;

        Crane_states_t#Crane_Turn_Left_White:
            Crane2_transit := FALSE;
            Crane_CraneTurnCounterclockwise := TRUE;
            Crane_CraneTurnClockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 8160) AND (Crane_AnalogCranePosition < 8260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Stamp_White;
            END_IF;

        Crane_states_t#Crane_Turn_Right_From_Stamp:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 16160) AND (Crane_AnalogCranePosition < 16260)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Conveyor_Metallic2;
            END_IF;

        Crane_states_t#Init:
            Crane2_transit := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Start_Crane;
            END_IF;

        Crane_states_t#Interstep:
            Crane2_transit := FALSE;
            Crane_StartCommandCrane := TRUE;
            IF Crane_StartVar THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep_2;
            END_IF;

        Crane_states_t#Interstep_2:
            Crane2_transit := FALSE;
            IF Crane_SliderMovedOut THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#TimeDelay;
            END_IF;

        Crane_states_t#Interstep_3:
            Crane2_transit := FALSE;
            IF NOT Crane_WorkpieceReady THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#No_Workpiece_ready;
            ELSIF Crane_WorkpieceReady THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Turn_Right;
            END_IF;

        Crane_states_t#Interstep_4:
            Crane2_transit := FALSE;
            IF Crane_StampSliderSensorMovedOut THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_On_Stamp_Metallic2_Lower;
            END_IF;

        Crane_states_t#Lower_Crane:
            Crane2_transit := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneDown THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Suck_At_Stamp;
            END_IF;

        Crane_states_t#Magazin_Stop:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lower;
            END_IF;

        Crane_states_t#Magazin_Stop_Black:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := TRUE;
            IF Crane_CraneSucked THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_NOT_Metallic_Black;
            END_IF;

        Crane_states_t#Magazin_Stop_Final:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Start_Crane;
            END_IF;

        Crane_states_t#No_Workpiece_ready:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_CraneLower := FALSE;
            IF Crane_StampSliderFilled THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Turn_Left_Metallic2;
            ELSIF NOT Crane_StampSliderFilled THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Turn_Right_Final;
            END_IF;

        Crane_states_t#Reset_interconnect:
            Crane2_transit := FALSE;
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
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Lower_Crane;
            END_IF;

        Crane_states_t#Stamp_Pressure_Profile_Set_Metallic:
            Crane2_transit := FALSE;
            Crane_AnalogCranePressure := PARAMETER_CRANE_PRESSURE_METALLIC;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Magazin_Metallic;
            END_IF;

        Crane_states_t#Stamp_Pressure_Profile_Set_White:
            Crane2_transit := FALSE;
            Crane_AnalogCranePressure := PARAMETER_CRANE_PRESSURE_WHITE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Magazin_White;
            END_IF;

        Crane_states_t#Start_Crane:
            Crane2_transit := FALSE;
            Crane_CraneLower := FALSE;
            Crane_MagazinVacuumOff := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_CraneTurnClockwise := FALSE;
            Crane_AnalogCranePressure := 0;
            Crane_StartVar := FALSE;
            Crane_StartCommandCrane := FALSE;
            IF (Crane_StartButtonMagazin = TRUE) THEN
                Crane_interconnectCraneStartCommand := TRUE;
            END_IF;
            IF Crane_interconnectCraneStartCommand THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Init;
            END_IF;

        Crane_states_t#Step0:
            Crane2_transit := FALSE;
            IF (Crane_MagazinCapacitiveSensor AND Crane_MagazinOpticalSensor) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Stamp_Pressure_Profile_Set_Metallic;
            ELSIF (NOT Crane_MagazinCapacitiveSensor AND Crane_MagazinOpticalSensor) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Stamp_Pressure_Profile_Set_White;
            ELSIF (NOT Crane_MagazinCapacitiveSensor AND NOT Crane_MagazinOpticalSensor) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Magazin;
            END_IF;

        Crane_states_t#Step2:
            Crane2_transit := FALSE;
            IF (Crane_MagazinCapacitiveSensor OR Crane_MagazinOpticalSensor) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#pause;
            ELSIF (NOT Crane_MagazinCapacitiveSensor AND NOT Crane_MagazinOpticalSensor) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Turn_Right_Black;
            END_IF;

        Crane_states_t#Step3:
            Crane2_transit := FALSE;
            IF NOT Crane_WorkpieceReady THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Step4;
            ELSIF Crane_WorkpieceReady THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Step2;
            END_IF;

        Crane_states_t#Step4:
            Crane2_transit := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep;
            END_IF;

        Crane_states_t#Suck_At_Stamp:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            IF Crane_CraneSucked THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_At_Stamp;
            END_IF;

        Crane_states_t#Suck_At_Stamp2:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOn := TRUE;
            Crane_MagazinVacuumOff := FALSE;
            IF Crane_CraneSucked THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_At_Stamp2;
            END_IF;

        Crane_states_t#TimeDelay:
            Crane2_transit := FALSE;
            Crane_TimeDelay_Timer_IN := TRUE;
            Crane_TimeDelay_Timer_PT := Crane_TimeDelay_Timer_Duration;
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
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Interstep_3;
            END_IF;

        Crane_states_t#Turn_Right:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 24290) AND (Crane_AnalogCranePosition < 24390)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Magazin_Stop;
            END_IF;

        Crane_states_t#Turn_Right_Black:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            IF ((Crane_AnalogCranePosition > 24290) AND (Crane_AnalogCranePosition < 24390)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Magazin_Stop_Black;
            END_IF;

        Crane_states_t#Turn_Right_Final:
            Crane2_transit := FALSE;
            Crane_CraneTurnClockwise := TRUE;
            Crane_CraneTurnCounterclockwise := FALSE;
            Crane_AnalogCranePressure := 0;
            IF ((Crane_AnalogCranePosition > 24290) AND (Crane_AnalogCranePosition < 24390)) THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Magazin_Stop_Final;
            END_IF;

        Crane_states_t#pause:
            Crane2_transit := FALSE;
            Crane_Timer1_IN := Crane_CraneUp;
            Crane_Timer1_PT := Crane_Duration1;
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
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Reset_interconnect;
            END_IF;

        Crane_states_t#release:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Conveyor;
            END_IF;

        Crane_states_t#release2:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Conveyor2;
            END_IF;

        Crane_states_t#release_Black:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOn := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Lift_Conveyor_Black;
            END_IF;

        Crane_states_t#release_Workpiece:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Go_Up;
            END_IF;

        Crane_states_t#release_Workpiece_White:
            Crane2_transit := FALSE;
            Crane_MagazinVacuumOff := TRUE;
            Crane_MagazinVacuumOn := FALSE;
            IF TRUE THEN
                Crane2_transit := TRUE;
                Crane2_state := Crane_states_t#Crane_Go_Up_White;
            END_IF;

            END_CASE;
    CASE Stamp2_state OF
        Stamp_states_t#Green_Lamp:
            Stamp2_transit := FALSE;
            Stamp_StampGreenLamp := TRUE;
            Stamp_interconnectStampStartCommand := FALSE;
            IF TRUE THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Stamp_Init_1;
            END_IF;

        Stamp_states_t#Init:
            Stamp2_transit := FALSE;
            IF TRUE THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Start_Stamp;
            END_IF;

        Stamp_states_t#Interstep:
            Stamp2_transit := FALSE;
            Stamp_StartCommandStamp := TRUE;
            IF Stamp_StartVar THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Intertsep_2;
            END_IF;

        Stamp_states_t#Intertsep_2:
            Stamp2_transit := FALSE;
            IF Stamp_StampSliderFilled THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Step0;
            END_IF;

        Stamp_states_t#StampProcess:
            Stamp2_transit := FALSE;
            Stamp_StampSliderMovedIn := FALSE;
            Stamp_StampPusher := TRUE;
            IF Stamp_StampLowered THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Step1;
            END_IF;

        Stamp_states_t#StampSliderBack:
            Stamp2_transit := FALSE;
            Stamp_StampSliderMovedIn := TRUE;
            Stamp_StampSliderMovedOut := FALSE;
            IF Stamp_StampSliderSensorMovedIn THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#StampProcess;
            END_IF;

        Stamp_states_t#StampSliderForward:
            Stamp2_transit := FALSE;
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
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Step2;
            END_IF;

        Stamp_states_t#Stamp_Init_1:
            Stamp2_transit := FALSE;
            Stamp_StampSliderMovedIn := TRUE;
            Stamp_StampSliderMovedOut := FALSE;
            IF Stamp_StampSliderSensorMovedIn THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Stamp_Init_2;
            END_IF;

        Stamp_states_t#Stamp_Init_2:
            Stamp2_transit := FALSE;
            Stamp_StampSliderMovedIn := FALSE;
            Stamp_StampSliderMovedOut := TRUE;
            IF Stamp_StampSliderSensorMovedOut THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Stamp_Init_3;
            END_IF;

        Stamp_states_t#Stamp_Init_3:
            Stamp2_transit := FALSE;
            Stamp_StampPusher := TRUE;
            IF Stamp_StampLowered THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Stamp_Init_4;
            END_IF;

        Stamp_states_t#Stamp_Init_4:
            Stamp2_transit := FALSE;
            Stamp_StampPusher := FALSE;
            IF Stamp_StampUp THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Interstep;
            END_IF;

        Stamp_states_t#Start_Stamp:
            Stamp2_transit := FALSE;
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
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Green_Lamp;
            END_IF;

        Stamp_states_t#Step0:
            Stamp2_transit := FALSE;
            IF Stamp_CraneUp THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#StampSliderBack;
            END_IF;

        Stamp_states_t#Step1:
            Stamp2_transit := FALSE;
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
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#StampSliderForward;
            END_IF;

        Stamp_states_t#Step2:
            Stamp2_transit := FALSE;
            IF (((Stamp_AnalogCranePosition > 16160) AND (Stamp_AnalogCranePosition < 16260)) AND NOT Stamp_StampSliderFilled) THEN
                Stamp2_transit := TRUE;
                Stamp2_state := Stamp_states_t#Interstep;
            END_IF;

            END_CASE;
    CASE Conveyor2_state OF
        Conveyor_states_t#Conveyor_Init:
            Conveyor2_transit := FALSE;
            Conveyor_SorterConveyorTowardsStacker := TRUE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            Conveyor_Timer_Conveyor_Test_IN := TRUE;
            Conveyor_Timer_Conveyor_Test_PT := Conveyor_Duration_Conveyor_Test;
            IF Conveyor_Timer_Conveyor_Test_IN THEN
                Conveyor_Timer_Conveyor_Test_Q := (Conveyor_Timer_Conveyor_Test_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Test_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Test_ET := (Conveyor_Timer_Conveyor_Test_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Test_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Test_Q := FALSE;
                Conveyor_Timer_Conveyor_Test_ET := Conveyor_Timer_Conveyor_Test_PT;
            END_IF;
            Conveyor_interconnect_Conveyor_Test := Conveyor_Timer_Conveyor_Test_Q;
            IF Conveyor_interconnect_Conveyor_Test THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Conveyor_init_2;
            END_IF;

        Conveyor_states_t#Conveyor_Stop_Empty_Magazin:
            Conveyor2_transit := FALSE;
            Conveyor_SorterConveyorTowardsStacker := FALSE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            Conveyor_interconnectConveyorStartCommand := FALSE;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Interstep;
            END_IF;

        Conveyor_states_t#Conveyor_Towards_Stacker:
            Conveyor2_transit := FALSE;
            Conveyor_SorterConveyorTowardsStacker := TRUE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Runtime_Conveyor;
            END_IF;

        Conveyor_states_t#Conveyor_init_2:
            Conveyor2_transit := FALSE;
            Conveyor_SorterConveyorTowardsStacker := FALSE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            Conveyor_interconnect_Conveyor_Test := FALSE;
            Conveyor_Timer_Conveyor_Test_IN := FALSE;
            Conveyor_Timer_Conveyor_Test_PT := USINT#0;
            IF Conveyor_Timer_Conveyor_Test_IN THEN
                Conveyor_Timer_Conveyor_Test_Q := (Conveyor_Timer_Conveyor_Test_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Test_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Test_ET := (Conveyor_Timer_Conveyor_Test_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Test_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Test_Q := FALSE;
                Conveyor_Timer_Conveyor_Test_ET := Conveyor_Timer_Conveyor_Test_PT;
            END_IF;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Interstep;
            END_IF;

        Conveyor_states_t#Conveyor_pause:
            Conveyor2_transit := FALSE;
            Conveyor_SorterConveyorTowardsStacker := FALSE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            Conveyor_interconnect_Conveyor_Runtime := FALSE;
            Conveyor_Timer_Conveyor_Runtime_IN := FALSE;
            Conveyor_Timer_Conveyor_Runtime_PT := USINT#0;
            IF Conveyor_Timer_Conveyor_Runtime_IN THEN
                Conveyor_Timer_Conveyor_Runtime_Q := (Conveyor_Timer_Conveyor_Runtime_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Runtime_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Runtime_ET := (Conveyor_Timer_Conveyor_Runtime_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Runtime_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Runtime_Q := FALSE;
                Conveyor_Timer_Conveyor_Runtime_ET := Conveyor_Timer_Conveyor_Runtime_PT;
            END_IF;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Interstep;
            END_IF;

        Conveyor_states_t#Green_Lamp:
            Conveyor2_transit := FALSE;
            Conveyor_SorterGreenLampConveyor := TRUE;
            Conveyor_interconnectConveyorStartCommand := FALSE;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Conveyor_Init;
            END_IF;

        Conveyor_states_t#Init:
            Conveyor2_transit := FALSE;
            IF TRUE THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Start_Conveyor;
            END_IF;

        Conveyor_states_t#Interstep:
            Conveyor2_transit := FALSE;
            Conveyor_StartCommandConveyor := TRUE;
            IF Conveyor_StartVar THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Step0;
            END_IF;

        Conveyor_states_t#Runtime_Conveyor:
            Conveyor2_transit := FALSE;
            Conveyor_Timer_Conveyor_Runtime_IN := TRUE;
            Conveyor_Timer_Conveyor_Runtime_PT := Conveyor_Duration_Conveyor_Runtime;
            IF Conveyor_Timer_Conveyor_Runtime_IN THEN
                Conveyor_Timer_Conveyor_Runtime_Q := (Conveyor_Timer_Conveyor_Runtime_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Runtime_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Runtime_ET := (Conveyor_Timer_Conveyor_Runtime_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Runtime_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Runtime_Q := FALSE;
                Conveyor_Timer_Conveyor_Runtime_ET := Conveyor_Timer_Conveyor_Runtime_PT;
            END_IF;
            Conveyor_interconnect_Conveyor_Runtime := Conveyor_Timer_Conveyor_Runtime_Q;
            IF Conveyor_interconnect_Conveyor_Runtime THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Conveyor_pause;
            END_IF;

        Conveyor_states_t#Start_Conveyor:
            Conveyor2_transit := FALSE;
            Conveyor_interconnectConveyorTerminationCommand := FALSE;
            Conveyor_SorterConveyorTowardsStacker := FALSE;
            Conveyor_SorterConveyorTowardsCrane := FALSE;
            Conveyor_SorterGreenLampConveyor := FALSE;
            Conveyor_interconnect_Conveyor_Runtime := FALSE;
            Conveyor_interconnect_Conveyor_Test := FALSE;
            Conveyor_Timer_Conveyor_Test_IN := FALSE;
            Conveyor_Timer_Conveyor_Test_PT := USINT#0;
            IF Conveyor_Timer_Conveyor_Test_IN THEN
                Conveyor_Timer_Conveyor_Test_Q := (Conveyor_Timer_Conveyor_Test_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Test_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Test_ET := (Conveyor_Timer_Conveyor_Test_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Test_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Test_Q := FALSE;
                Conveyor_Timer_Conveyor_Test_ET := Conveyor_Timer_Conveyor_Test_PT;
            END_IF;
            Conveyor_Timer_Conveyor_Runtime_IN := FALSE;
            Conveyor_Timer_Conveyor_Runtime_PT := USINT#0;
            IF Conveyor_Timer_Conveyor_Runtime_IN THEN
                Conveyor_Timer_Conveyor_Runtime_Q := (Conveyor_Timer_Conveyor_Runtime_ET = USINT#0);
                IF (Conveyor_Timer_Conveyor_Runtime_ET > USINT#0) THEN
                    Conveyor_Timer_Conveyor_Runtime_ET := (Conveyor_Timer_Conveyor_Runtime_ET - USINT#1);
                ELSE
                    Conveyor_Timer_Conveyor_Runtime_ET := USINT#0;
                END_IF;
            ELSE
                Conveyor_Timer_Conveyor_Runtime_Q := FALSE;
                Conveyor_Timer_Conveyor_Runtime_ET := Conveyor_Timer_Conveyor_Runtime_PT;
            END_IF;
            Conveyor_StartVar := FALSE;
            Conveyor_StartCommandConveyor := FALSE;
            IF (Conveyor_SorterStartButton = TRUE) THEN
                Conveyor_interconnectConveyorStartCommand := TRUE;
            END_IF;
            IF Conveyor_interconnectConveyorStartCommand THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Green_Lamp;
            END_IF;

        Conveyor_states_t#Step0:
            Conveyor2_transit := FALSE;
            IF Conveyor_SorterLightbarrierCraneInterface THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Conveyor_Towards_Stacker;
            ELSIF NOT Conveyor_SorterLightbarrierCraneInterface THEN
                Conveyor2_transit := TRUE;
                Conveyor2_state := Conveyor_states_t#Conveyor_Stop_Empty_Magazin;
            END_IF;

            END_CASE;
    CASE Pusher2_state OF
        Pusher_states_t#Check_For_Black:
            Pusher2_transit := FALSE;
            IF ((Pusher_Slide2_black = 1) AND (Pusher_Priority_Var_Black = 2)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_black_workpieces;
            ELSIF ((Pusher_Slide3_black = 1) AND (Pusher_Priority_Var_Black = 3)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Third_Slide_black_workpieces;
            ELSIF ((Pusher_Slide1_black = 1) AND (Pusher_Priority_Var_Black = 1)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_black_workpieces;
            END_IF;

        Pusher_states_t#Check_For_Metal:
            Pusher2_transit := FALSE;
            IF ((Pusher_Slide3_metal = 1) AND (Pusher_Priority_Var_Metal = 3)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Third_Slide_metal_workpieces;
            ELSIF ((Pusher_Slide2_metal = 1) AND (Pusher_Priority_Var_Metal = 2)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_metal_workpieces;
            ELSIF ((Pusher_Slide1_metal = 1) AND (Pusher_Priority_Var_Metal = 1)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_metal_workpieces;
            END_IF;

        Pusher_states_t#Check_For_White:
            Pusher2_transit := FALSE;
            IF ((Pusher_Slide1_white = 1) AND (Pusher_Priority_Var_White = 1)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_white_workpieces;
            ELSIF ((Pusher_Slide3_white = 1) AND (Pusher_Priority_Var_White = 3)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Third_Slide_white_workpieces;
            ELSIF ((Pusher_Slide2_white = 1) AND (Pusher_Priority_Var_White = 2)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_white_workpieces;
            END_IF;

        Pusher_states_t#First_Slide_Timer_Black:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnesssensorCraneInterfaceInverse = TRUE) THEN
                Pusher_Timer_Slide1_Black_IN := Pusher_SorterLightnesssensorCraneInterfaceInverse;
                Pusher_Timer_Slide1_Black_PT := Pusher_Duration_Slide1_Black;
                IF Pusher_Timer_Slide1_Black_IN THEN
                    Pusher_Timer_Slide1_Black_Q := (Pusher_Timer_Slide1_Black_ET = USINT#0);
                    IF (Pusher_Timer_Slide1_Black_ET > USINT#0) THEN
                        Pusher_Timer_Slide1_Black_ET := (Pusher_Timer_Slide1_Black_ET - USINT#1);
                    ELSE
                        Pusher_Timer_Slide1_Black_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer_Slide1_Black_Q := FALSE;
                    Pusher_Timer_Slide1_Black_ET := Pusher_Timer_Slide1_Black_PT;
                END_IF;
                Pusher_interconnect_Slide1_Black := Pusher_Timer_Slide1_Black_Q;
            END_IF;
            IF Pusher_interconnect_Slide1_Black THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_Out_Black;
            END_IF;

        Pusher_states_t#First_Slide_Timer_Metal:
            Pusher2_transit := FALSE;
            Pusher_Timer_Slide1_Metal_IN := TRUE;
            Pusher_Timer_Slide1_Metal_PT := Pusher_Duration_Slide1_Metal;
            IF Pusher_Timer_Slide1_Metal_IN THEN
                Pusher_Timer_Slide1_Metal_Q := (Pusher_Timer_Slide1_Metal_ET = USINT#0);
                IF (Pusher_Timer_Slide1_Metal_ET > USINT#0) THEN
                    Pusher_Timer_Slide1_Metal_ET := (Pusher_Timer_Slide1_Metal_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide1_Metal_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide1_Metal_Q := FALSE;
                Pusher_Timer_Slide1_Metal_ET := Pusher_Timer_Slide1_Metal_PT;
            END_IF;
            Pusher_interconnect_Slide1_Metal := Pusher_Timer_Slide1_Metal_Q;
            IF Pusher_interconnect_Slide1_Metal THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_Out_Metal;
            END_IF;

        Pusher_states_t#First_Slide_Timer_White:
            Pusher2_transit := FALSE;
            Pusher_Timer_Slide1_White_IN := TRUE;
            Pusher_Timer_Slide1_White_PT := Pusher_Duration_Slide1_White;
            IF Pusher_Timer_Slide1_White_IN THEN
                Pusher_Timer_Slide1_White_Q := (Pusher_Timer_Slide1_White_ET = USINT#0);
                IF (Pusher_Timer_Slide1_White_ET > USINT#0) THEN
                    Pusher_Timer_Slide1_White_ET := (Pusher_Timer_Slide1_White_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide1_White_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide1_White_Q := FALSE;
                Pusher_Timer_Slide1_White_ET := Pusher_Timer_Slide1_White_PT;
            END_IF;
            Pusher_interconnect_Slide1_White := Pusher_Timer_Slide1_White_Q;
            IF Pusher_interconnect_Slide1_White THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_Out_White;
            END_IF;

        Pusher_states_t#First_Slide_black_workpieces:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_Timer_Black;
            END_IF;

        Pusher_states_t#First_Slide_metal_workpieces:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_Timer_Metal;
            END_IF;

        Pusher_states_t#First_Slide_white_workpieces:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#First_Slide_Timer_White;
            END_IF;

        Pusher_states_t#Init:
            Pusher2_transit := FALSE;
            IF Pusher_StartVar THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep;
            END_IF;

        Pusher_states_t#Interstep:
            Pusher2_transit := FALSE;
            Pusher_PusherY1 := FALSE;
            Pusher_PusherY2 := FALSE;
            Pusher_interconnect2 := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_StartVar := FALSE;
            Pusher_interconnect_Slide1_Black := FALSE;
            Pusher_interconnect_Slide2_Black := FALSE;
            Pusher_interconnect_Slide1_White := FALSE;
            Pusher_interconnect_Slide2_White := FALSE;
            Pusher_interconnect_Slide1_Metal := FALSE;
            Pusher_interconnect_Slide2_Metal := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Interstep_2:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterLightnessSensorPusher1 AND Pusher_SorterCapacitiveSensorPusher1) AND (Pusher_Priority_Var_Metal > 0)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Check_For_Metal;
            ELSIF ((NOT Pusher_SorterLightnesssensorCraneInterfaceInverse AND Pusher_SorterLightbarrierCraneInterface) AND (Pusher_Priority_Var_Black > 0)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Check_For_Black;
            ELSIF ((Pusher_SorterLightnessSensorPusher1 AND NOT Pusher_SorterCapacitiveSensorPusher1) AND (Pusher_Priority_Var_White > 0)) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Check_For_White;
            END_IF;

        Pusher_states_t#PusherY1_Move_In_Black:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = TRUE) AND (Pusher_SorterPusher1MovedIn = FALSE)) THEN
                Pusher_PusherY1 := FALSE;
            END_IF;
            IF Pusher_SorterPusher1MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide1_Black;
            END_IF;

        Pusher_states_t#PusherY1_Move_In_Metal:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = TRUE) AND (Pusher_SorterPusher1MovedIn = FALSE)) THEN
                Pusher_PusherY1 := FALSE;
            END_IF;
            IF Pusher_SorterPusher1MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide1_Metal;
            END_IF;

        Pusher_states_t#PusherY1_Move_In_White:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = TRUE) AND (Pusher_SorterPusher1MovedIn = FALSE)) THEN
                Pusher_PusherY1 := FALSE;
            END_IF;
            IF Pusher_SorterPusher1MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide1_White;
            END_IF;

        Pusher_states_t#PusherY1_Move_Out_Black:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = FALSE) AND (Pusher_SorterPusher1MovedIn = TRUE)) THEN
                Pusher_PusherY1 := TRUE;
            END_IF;
            IF Pusher_SorterPusher1MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y1_Black;
            END_IF;

        Pusher_states_t#PusherY1_Move_Out_Metal:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = FALSE) AND (Pusher_SorterPusher1MovedIn = TRUE)) THEN
                Pusher_PusherY1 := TRUE;
            END_IF;
            IF Pusher_SorterPusher1MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y1_Metal;
            END_IF;

        Pusher_states_t#PusherY1_Move_Out_White:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher1MovedOut = FALSE) AND (Pusher_SorterPusher1MovedIn = TRUE)) THEN
                Pusher_PusherY1 := TRUE;
            END_IF;
            IF Pusher_SorterPusher1MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y1_White;
            END_IF;

        Pusher_states_t#PusherY2_Move_In_Black:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = TRUE) AND (Pusher_SorterPusher2MovedIn = FALSE)) THEN
                Pusher_PusherY2 := FALSE;
            END_IF;
            IF Pusher_SorterPusher2MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide2_Black;
            END_IF;

        Pusher_states_t#PusherY2_Move_In_Metal:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = TRUE) AND (Pusher_SorterPusher2MovedIn = FALSE)) THEN
                Pusher_PusherY2 := FALSE;
            END_IF;
            IF Pusher_SorterPusher2MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide2_Metal;
            END_IF;

        Pusher_states_t#PusherY2_Move_In_White:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = TRUE) AND (Pusher_SorterPusher2MovedIn = FALSE)) THEN
                Pusher_PusherY2 := FALSE;
            END_IF;
            IF Pusher_SorterPusher2MovedIn THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide2_White;
            END_IF;

        Pusher_states_t#PusherY2_Move_Out_Black:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = FALSE) AND (Pusher_SorterPusher2MovedIn = TRUE)) THEN
                Pusher_PusherY2 := TRUE;
            END_IF;
            IF Pusher_SorterPusher2MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y2_Black;
            END_IF;

        Pusher_states_t#PusherY2_Move_Out_Metal:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = FALSE) AND (Pusher_SorterPusher2MovedIn = TRUE)) THEN
                Pusher_PusherY2 := TRUE;
            END_IF;
            IF Pusher_SorterPusher2MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y2_Metal;
            END_IF;

        Pusher_states_t#PusherY2_Move_Out_White:
            Pusher2_transit := FALSE;
            IF ((Pusher_SorterPusher2MovedOut = FALSE) AND (Pusher_SorterPusher2MovedIn = TRUE)) THEN
                Pusher_PusherY2 := TRUE;
            END_IF;
            IF Pusher_SorterPusher2MovedOut THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Y2_White;
            END_IF;

        Pusher_states_t#Reset_interconnect3:
            Pusher2_transit := FALSE;
            Pusher_interconnect2 := FALSE;
            Pusher_Timer2_IN := FALSE;
            Pusher_Timer2_PT := USINT#0;
            IF Pusher_Timer2_IN THEN
                Pusher_Timer2_Q := (Pusher_Timer2_ET = USINT#0);
                IF (Pusher_Timer2_ET > USINT#0) THEN
                    Pusher_Timer2_ET := (Pusher_Timer2_ET - USINT#1);
                ELSE
                    Pusher_Timer2_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer2_Q := FALSE;
                Pusher_Timer2_ET := Pusher_Timer2_PT;
            END_IF;
            Pusher_Slide3_black := (Pusher_Slide3_black - 1);
            Pusher_Priority_Var_Black := (Pusher_Priority_Var_Black - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide1_Black:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide1_Black := FALSE;
            Pusher_Timer_Slide1_Black_IN := FALSE;
            Pusher_Timer_Slide1_Black_PT := USINT#0;
            IF Pusher_Timer_Slide1_Black_IN THEN
                Pusher_Timer_Slide1_Black_Q := (Pusher_Timer_Slide1_Black_ET = USINT#0);
                IF (Pusher_Timer_Slide1_Black_ET > USINT#0) THEN
                    Pusher_Timer_Slide1_Black_ET := (Pusher_Timer_Slide1_Black_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide1_Black_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide1_Black_Q := FALSE;
                Pusher_Timer_Slide1_Black_ET := Pusher_Timer_Slide1_Black_PT;
            END_IF;
            Pusher_Slide1_black := (Pusher_Slide1_black - 1);
            Pusher_Priority_Var_Black := (Pusher_Priority_Var_Black - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide1_Metal:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide1_Metal := FALSE;
            Pusher_Timer_Slide1_Metal_IN := FALSE;
            Pusher_Timer_Slide1_Metal_PT := USINT#0;
            IF Pusher_Timer_Slide1_Metal_IN THEN
                Pusher_Timer_Slide1_Metal_Q := (Pusher_Timer_Slide1_Metal_ET = USINT#0);
                IF (Pusher_Timer_Slide1_Metal_ET > USINT#0) THEN
                    Pusher_Timer_Slide1_Metal_ET := (Pusher_Timer_Slide1_Metal_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide1_Metal_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide1_Metal_Q := FALSE;
                Pusher_Timer_Slide1_Metal_ET := Pusher_Timer_Slide1_Metal_PT;
            END_IF;
            Pusher_Slide1_metal := (Pusher_Slide1_metal - 1);
            Pusher_Priority_Var_Metal := (Pusher_Priority_Var_Metal - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide1_White:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide1_White := FALSE;
            Pusher_Timer_Slide1_White_IN := FALSE;
            Pusher_Timer_Slide1_White_PT := USINT#0;
            IF Pusher_Timer_Slide1_White_IN THEN
                Pusher_Timer_Slide1_White_Q := (Pusher_Timer_Slide1_White_ET = USINT#0);
                IF (Pusher_Timer_Slide1_White_ET > USINT#0) THEN
                    Pusher_Timer_Slide1_White_ET := (Pusher_Timer_Slide1_White_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide1_White_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide1_White_Q := FALSE;
                Pusher_Timer_Slide1_White_ET := Pusher_Timer_Slide1_White_PT;
            END_IF;
            Pusher_Slide1_white := (Pusher_Slide1_white - 1);
            Pusher_Priority_Var_White := (Pusher_Priority_Var_White - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide2_Black:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide2_Black := FALSE;
            Pusher_Timer_Slide2_Black_IN := FALSE;
            Pusher_Timer_Slide2_Black_PT := USINT#0;
            IF Pusher_Timer_Slide2_Black_IN THEN
                Pusher_Timer_Slide2_Black_Q := (Pusher_Timer_Slide2_Black_ET = USINT#0);
                IF (Pusher_Timer_Slide2_Black_ET > USINT#0) THEN
                    Pusher_Timer_Slide2_Black_ET := (Pusher_Timer_Slide2_Black_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide2_Black_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide2_Black_Q := FALSE;
                Pusher_Timer_Slide2_Black_ET := Pusher_Timer_Slide2_Black_PT;
            END_IF;
            Pusher_Slide2_black := (Pusher_Slide2_black - 1);
            Pusher_Priority_Var_Black := (Pusher_Priority_Var_Black - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide2_Metal:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide2_Metal := FALSE;
            Pusher_Timer_Slide2_Metal_IN := FALSE;
            Pusher_Timer_Slide2_Metal_PT := USINT#0;
            IF Pusher_Timer_Slide2_Metal_IN THEN
                Pusher_Timer_Slide2_Metal_Q := (Pusher_Timer_Slide2_Metal_ET = USINT#0);
                IF (Pusher_Timer_Slide2_Metal_ET > USINT#0) THEN
                    Pusher_Timer_Slide2_Metal_ET := (Pusher_Timer_Slide2_Metal_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide2_Metal_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide2_Metal_Q := FALSE;
                Pusher_Timer_Slide2_Metal_ET := Pusher_Timer_Slide2_Metal_PT;
            END_IF;
            Pusher_Slide2_metal := (Pusher_Slide2_metal - 1);
            Pusher_Priority_Var_Metal := (Pusher_Priority_Var_Metal - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide2_White:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect_Slide2_White := FALSE;
            Pusher_Timer_Slide2_White_IN := FALSE;
            Pusher_Timer_Slide2_White_PT := USINT#0;
            IF Pusher_Timer_Slide2_White_IN THEN
                Pusher_Timer_Slide2_White_Q := (Pusher_Timer_Slide2_White_ET = USINT#0);
                IF (Pusher_Timer_Slide2_White_ET > USINT#0) THEN
                    Pusher_Timer_Slide2_White_ET := (Pusher_Timer_Slide2_White_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide2_White_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide2_White_Q := FALSE;
                Pusher_Timer_Slide2_White_ET := Pusher_Timer_Slide2_White_PT;
            END_IF;
            Pusher_Slide2_white := (Pusher_Slide2_white - 1);
            Pusher_Priority_Var_White := (Pusher_Priority_Var_White - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide3_Metal:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_Slide3_metal := (Pusher_Slide3_metal - 1);
            Pusher_Priority_Var_Metal := (Pusher_Priority_Var_Metal - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Reset_interconnect_Slide3_White:
            Pusher2_transit := FALSE;
            Pusher_interconnect3 := FALSE;
            Pusher_Timer3_IN := FALSE;
            Pusher_Timer3_PT := USINT#0;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_Slide3_white := (Pusher_Slide3_white - 1);
            Pusher_Priority_Var_White := (Pusher_Priority_Var_White - 1);
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Interstep_2;
            END_IF;

        Pusher_states_t#Second_Slide_Timer_Black:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnesssensorCraneInterfaceInverse = TRUE) THEN
                Pusher_Timer_Slide2_Black_IN := Pusher_SorterLightnesssensorCraneInterfaceInverse;
                Pusher_Timer_Slide2_Black_PT := Pusher_Duration_Slide2_Black;
                IF Pusher_Timer_Slide2_Black_IN THEN
                    Pusher_Timer_Slide2_Black_Q := (Pusher_Timer_Slide2_Black_ET = USINT#0);
                    IF (Pusher_Timer_Slide2_Black_ET > USINT#0) THEN
                        Pusher_Timer_Slide2_Black_ET := (Pusher_Timer_Slide2_Black_ET - USINT#1);
                    ELSE
                        Pusher_Timer_Slide2_Black_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer_Slide2_Black_Q := FALSE;
                    Pusher_Timer_Slide2_Black_ET := Pusher_Timer_Slide2_Black_PT;
                END_IF;
                Pusher_interconnect_Slide2_Black := Pusher_Timer_Slide2_Black_Q;
            END_IF;
            IF Pusher_interconnect_Slide2_Black THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_Out_Black;
            END_IF;

        Pusher_states_t#Second_Slide_Timer_Metal:
            Pusher2_transit := FALSE;
            Pusher_Timer_Slide2_Metal_IN := TRUE;
            Pusher_Timer_Slide2_Metal_PT := Pusher_Duration_Slide2_Metal;
            IF Pusher_Timer_Slide2_Metal_IN THEN
                Pusher_Timer_Slide2_Metal_Q := (Pusher_Timer_Slide2_Metal_ET = USINT#0);
                IF (Pusher_Timer_Slide2_Metal_ET > USINT#0) THEN
                    Pusher_Timer_Slide2_Metal_ET := (Pusher_Timer_Slide2_Metal_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide2_Metal_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide2_Metal_Q := FALSE;
                Pusher_Timer_Slide2_Metal_ET := Pusher_Timer_Slide2_Metal_PT;
            END_IF;
            Pusher_interconnect_Slide2_Metal := Pusher_Timer_Slide2_Metal_Q;
            IF Pusher_interconnect_Slide2_Metal THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_Out_Metal;
            END_IF;

        Pusher_states_t#Second_Slide_Timer_White:
            Pusher2_transit := FALSE;
            Pusher_Timer_Slide2_White_IN := TRUE;
            Pusher_Timer_Slide2_White_PT := Pusher_Duration_Slide2_White;
            IF Pusher_Timer_Slide2_White_IN THEN
                Pusher_Timer_Slide2_White_Q := (Pusher_Timer_Slide2_White_ET = USINT#0);
                IF (Pusher_Timer_Slide2_White_ET > USINT#0) THEN
                    Pusher_Timer_Slide2_White_ET := (Pusher_Timer_Slide2_White_ET - USINT#1);
                ELSE
                    Pusher_Timer_Slide2_White_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer_Slide2_White_Q := FALSE;
                Pusher_Timer_Slide2_White_ET := Pusher_Timer_Slide2_White_PT;
            END_IF;
            Pusher_interconnect_Slide2_White := Pusher_Timer_Slide2_White_Q;
            IF Pusher_interconnect_Slide2_White THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_Out_White;
            END_IF;

        Pusher_states_t#Second_Slide_black_workpieces:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_Timer_Black;
            END_IF;

        Pusher_states_t#Second_Slide_metal_workpieces:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnessSensorPusher2 AND Pusher_SorterCapacitiveSensorPusher2) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Test_For_Metal;
            END_IF;

        Pusher_states_t#Second_Slide_white_workpieces:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnessSensorPusher2 AND NOT Pusher_SorterCapacitiveSensorPusher2) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Test_For_White;
            END_IF;

        Pusher_states_t#Second_Test_For_Metal:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_Timer_Metal;
            END_IF;

        Pusher_states_t#Second_Test_For_White:
            Pusher2_transit := FALSE;
            IF TRUE THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Second_Slide_Timer_White;
            END_IF;

        Pusher_states_t#Third_Slide_black_workpieces:
            Pusher2_transit := FALSE;
            IF (NOT Pusher_SorterLightnessSensorPusher2 AND NOT Pusher_SorterCapacitiveSensorPusher2) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Black;
            END_IF;

        Pusher_states_t#Third_Slide_metal_workpieces:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnessSensorPusher2 AND Pusher_SorterCapacitiveSensorPusher2) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_Metal;
            END_IF;

        Pusher_states_t#Third_Slide_white_workpieces:
            Pusher2_transit := FALSE;
            IF (Pusher_SorterLightnessSensorPusher2 AND NOT Pusher_SorterCapacitiveSensorPusher2) THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Wait_White;
            END_IF;

        Pusher_states_t#Wait_Black:
            Pusher2_transit := FALSE;
            IF ((NOT Pusher_SorterLightnessSensorPusher2 AND NOT Pusher_SorterCapacitiveSensorPusher2) = TRUE) THEN
                Pusher_Timer2_IN := (NOT Pusher_SorterLightnessSensorPusher2 AND NOT Pusher_SorterCapacitiveSensorPusher2);
                Pusher_Timer2_PT := Pusher_Duration2;
                IF Pusher_Timer2_IN THEN
                    Pusher_Timer2_Q := (Pusher_Timer2_ET = USINT#0);
                    IF (Pusher_Timer2_ET > USINT#0) THEN
                        Pusher_Timer2_ET := (Pusher_Timer2_ET - USINT#1);
                    ELSE
                        Pusher_Timer2_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer2_Q := FALSE;
                    Pusher_Timer2_ET := Pusher_Timer2_PT;
                END_IF;
                Pusher_interconnect2 := Pusher_Timer2_Q;
            END_IF;
            IF Pusher_interconnect2 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect3;
            END_IF;

        Pusher_states_t#Wait_Metal:
            Pusher2_transit := FALSE;
            Pusher_Timer3_IN := TRUE;
            Pusher_Timer3_PT := Pusher_Duration3;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect3 := Pusher_Timer3_Q;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide3_Metal;
            END_IF;

        Pusher_states_t#Wait_White:
            Pusher2_transit := FALSE;
            Pusher_Timer3_IN := TRUE;
            Pusher_Timer3_PT := Pusher_Duration3;
            IF Pusher_Timer3_IN THEN
                Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                IF (Pusher_Timer3_ET > USINT#0) THEN
                    Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                ELSE
                    Pusher_Timer3_ET := USINT#0;
                END_IF;
            ELSE
                Pusher_Timer3_Q := FALSE;
                Pusher_Timer3_ET := Pusher_Timer3_PT;
            END_IF;
            Pusher_interconnect3 := Pusher_Timer3_Q;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#Reset_interconnect_Slide3_White;
            END_IF;

        Pusher_states_t#Wait_Y1_Black:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY1 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY1;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_In_Black;
            END_IF;

        Pusher_states_t#Wait_Y1_Metal:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY1 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY1;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_In_Metal;
            END_IF;

        Pusher_states_t#Wait_Y1_White:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY1 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY1;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY1_Move_In_White;
            END_IF;

        Pusher_states_t#Wait_Y2_Black:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY2 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY2;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_In_Black;
            END_IF;

        Pusher_states_t#Wait_Y2_Metal:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY2 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY2;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_In_Metal;
            END_IF;

        Pusher_states_t#Wait_Y2_White:
            Pusher2_transit := FALSE;
            IF (Pusher_PusherY2 = TRUE) THEN
                Pusher_Timer3_IN := Pusher_PusherY2;
                Pusher_Timer3_PT := Pusher_Duration3;
                IF Pusher_Timer3_IN THEN
                    Pusher_Timer3_Q := (Pusher_Timer3_ET = USINT#0);
                    IF (Pusher_Timer3_ET > USINT#0) THEN
                        Pusher_Timer3_ET := (Pusher_Timer3_ET - USINT#1);
                    ELSE
                        Pusher_Timer3_ET := USINT#0;
                    END_IF;
                ELSE
                    Pusher_Timer3_Q := FALSE;
                    Pusher_Timer3_ET := Pusher_Timer3_PT;
                END_IF;
                Pusher_interconnect3 := Pusher_Timer3_Q;
            END_IF;
            IF Pusher_interconnect3 THEN
                Pusher2_transit := TRUE;
                Pusher2_state := Pusher_states_t#PusherY2_Move_In_White;
            END_IF;

            END_CASE;
    IF ((Actuator_SorterGreenLampConveyor AND Actuator_MagazinGreenLamp) AND Actuator_StampGreenLamp) THEN
        IF (((Stamp_StartCommandStamp AND Crane_StartCommandCrane) AND Conveyor_StartCommandConveyor) AND Mag_StartCommandMagazin) THEN
            Crane_StartVar := TRUE;
            Conveyor_StartVar := TRUE;
            Mag_StartVar := TRUE;
            Pusher_StartVar := TRUE;
            Stamp_StartVar := TRUE;
            DIAGNOSIS_ACTIVE := TRUE;
        END_IF;
    END_IF;
    Crane_SFCReset := FALSE;
    Conveyor_SFCReset := FALSE;
    Mag_SFCReset := FALSE;
    Pusher_SFCReset := FALSE;
    Stamp_SFCReset := FALSE;

    Crane_AnalogCranePressure := PARAMETER_CRANE_PRESSURE_METALLIC;


ELSIF ((NOT Sensor_SorterEmergencyStop OR NOT Sensor_StampEmergencyStop) OR NOT Sensor_MagazinEmergencyStop) THEN
    Actuator_MagazinSlider := FALSE;
    Actuator_CraneLower := FALSE;
    Actuator_MagazinVacuumOn := FALSE;
    Actuator_MagazinVacuumOff := TRUE;
    Actuator_MagazinGreenLamp := FALSE;
    Actuator_CraneTurnCounterclockwise := FALSE;
    Actuator_CraneTurnClockwise := FALSE;
    Actuator_SorterConveyorTowardsStacker := FALSE;
    Actuator_SorterConveyorTowardsCrane := FALSE;
    Actuator_SorterGreenLampConveyor := FALSE;
    Actuator_PusherY1 := FALSE;
    Actuator_PusherY2 := FALSE;
    Actuator_StampSliderMovedOut := TRUE;
    Actuator_StampSliderMovedIn := FALSE;
    Actuator_StampGreenLamp := FALSE;
    Actuator_StampPusher := FALSE;
    Actuator_AnalogCranePressure := 0;
    Crane_SFCReset := TRUE;
    Conveyor_SFCReset := TRUE;
    Mag_SFCReset := TRUE;
    Pusher_SFCReset := TRUE;
    Stamp_SFCReset := TRUE;
    Crane_StartVar := FALSE;
    Conveyor_StartVar := FALSE;
    Mag_StartVar := FALSE;
    Pusher_StartVar := FALSE;
    Stamp_StartVar := FALSE;
END_IF;

END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Main;
  END_RESOURCE
END_CONFIGURATION