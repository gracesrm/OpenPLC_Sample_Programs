TYPE 
    STATES_CRANE : (INIT, START_CRANE, CRANE_INIT, CRANE_INIT_2, INTERSTEP, INTERSTEP_2, TIMEDELAY, TURN_RIGHT, MAGAZIN_STOP, CRANE_LOWER, STEP0, CRANE_LIFT_MAGAZIN, CRANE_TURN_LEFT_NOT_METALLIC, CRANE_ON_CONVEYOR, CRANE_LIFT_MAGAZIN_METALLIC, CRANE_TURN_LEFT_METALLIC, CRANE_ON_STAMP_METALLIC, RELEASE_WORKPIECE, CRANE_GO_UP, PAUSE, TURN_RIGHT_BLACK, MAGAZIN_STOP_BLACK, CRANE_LIFT_NOT_METALLIC_BLACK, CRANE_TURN_LEFT_NOT_METALLIC_BLACK, CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK, RELEASE_BLACK, CRANE_LIFT_CONVEYOR_BLACK, CRANE_TURN_LEFT_BACK_TO_STAMP, CRANE_ON_STAMP_STOP_BLACK, RESET_INTERCONNECT, LOWER_CRANE, SUCK_AT_STAMP, CRANE_LIFT_AT_STAMP, CRANE_TURN_LEFT_FROM_STAMP, CRANE_ON_CONVEYOR_METALLIC, RELEASE, CRANE_LIFT_CONVEYOR, LAST_WORKPIECE_AT_STAMP, NO_WORKPIECE_READY); 
    STATES_STAMP : (INIT, START_STAMP, GREEN_LAMP, STAMP_INIT_1, STAMP_INIT_2, STAMP_INIT_3, STAMP_INIT_4, INTERSTEP, INTERSTEP_2, STEP0, STAMPSLIDERBACK, STAMPPROCESS, STEP1, STAMPSLIDERFORWARD, STEP2); 
    STATES_MAGAZIN : (Init, Start_Magazin, Green_Lamp, Magazin_Init, Magazin_Init_2, Interstep, convey, Step0, Slider_Move_Back, Step1);

END_TYPE

PROGRAM Main
    VAR_OUTPUT  
        Actuator_AnalogCranePressure : INT := INT#0;
        Actuator_CraneLower : BOOL := FALSE;
        Actuator_CraneTurnClockwise : BOOL := FALSE;
        Actuator_CraneTurnCounterclockwise : BOOL := FALSE;
        Actuator_MagazinGreenLamp : BOOL := FALSE;
        Actuator_MagazinSlider : BOOL := FALSE;
        Actuator_MagazinVacuumOff : BOOL := FALSE;
        Actuator_MagazinVacuumOn : BOOL := FALSE;
        Actuator_MagazinWhiteLamp : BOOL := FALSE;
        Actuator_StampGreenLamp : BOOL := FALSE;
        Actuator_StampPusher : BOOL := FALSE;
        Actuator_StampSliderMovedIn : BOOL := FALSE;
        Actuator_StampSliderMovedOut : BOOL := FALSE;
        Actuator_StampWhiteLamp : BOOL := FALSE;
    END_VAR
    
    VAR  
        Crane_CranTurnClockwise : BOOL := FALSE;
        Crane_CraneDown : BOOL := FALSE;
        Crane_CraneLower : BOOL := FALSE;
        Crane_CraneOnConveyor : BOOL := FALSE;
        Crane_CraneOnMagazin : BOOL := FALSE;
        Crane_CranePositionStamp : BOOL := FALSE;
        Crane_CraneSucked : BOOL := FALSE;
        Crane_CraneTurnClockwise : BOOL := FALSE;
        Crane_CraneTurnCounterclockwise : BOOL := FALSE;
        Crane_CraneUp : BOOL := FALSE;
        Crane_Duration1 : UINT := UINT#0;
        Crane_MagazinCapacitiveSensor : BOOL := FALSE;
        Crane_MagazinSlider : BOOL := FALSE;
        Crane_MagazinVacuumOff : BOOL := FALSE;
        Crane_MagazinVacuumOn : BOOL := FALSE;
        Crane_SFCInit : BOOL := FALSE;
        Crane_SFCReset : BOOL := FALSE;
        Crane_SliderMovedOut : BOOL := FALSE;
        Crane_SliderNotMovedOut : BOOL := FALSE;
        Crane_StampLowered : BOOL := FALSE;
        Crane_StampSliderFilled : BOOL := FALSE;
        Crane_StartButtonMagazin : BOOL := FALSE;
        Crane_StartCommandCrane : BOOL := FALSE;
        Crane_StartVar : BOOL := FALSE;
        Crane_TimeDelay_Timer_ET : UINT := UINT#0;
        Crane_TimeDelay_Timer_IN : BOOL := FALSE;
        Crane_TimeDelay_Timer_PT : UINT := UINT#0;
        Crane_TimeDelay_Timer_Q : BOOL := FALSE;
        Crane_TimeDelay_Timer_Duration : UINT := UINT#0;
        Crane_TimeDelay_Timer_interconnect : BOOL := FALSE;
        Crane_Timer1_ET : UINT := UINT#0;
        Crane_Timer1_IN : BOOL := FALSE;
        Crane_Timer1_PT : UINT := UINT#0;
        Crane_Timer1_Q : BOOL := FALSE;
        Crane_WorkpieceReady : BOOL := FALSE;
        Crane_2_transit : BOOL := FALSE;
        Crane_2state : STATES_CRANE;
        Crane_actualtime1 : UINT := UINT#0;
        Crane_interconnect : BOOL := FALSE;
        Crane_interconnectCraneStartCommand : BOOL := FALSE;
        Mag_CraneDown : BOOL := FALSE;
        Mag_CraneLower : BOOL := FALSE;
        Mag_CraneOnConveyor : BOOL := FALSE;
        Mag_CraneOnMagazin : BOOL := FALSE;
        Mag_CraneSucked : BOOL := FALSE;
        Mag_CraneTurnClockwise : BOOL := FALSE;
        Mag_CraneTurnCounterclockwise : BOOL := FALSE;
        Mag_CraneUp : BOOL := FALSE;
        Mag_MagazinGreenLamp : BOOL := FALSE;
        Mag_MagazinSlider : BOOL := FALSE;
        Mag_MagazinVacuumOff : BOOL := FALSE;
        Mag_MagazinVacuumOn : BOOL := FALSE;
        Mag_MagazinWhiteLamp : BOOL := FALSE;
        Mag_SFCInit : BOOL := FALSE;
        Mag_SFCReset : BOOL := FALSE;
        Mag_SliderMovedOut : BOOL := FALSE;
        Mag_SliderNotMovedOut : BOOL := FALSE;
        Mag_StartButtonMagazin : BOOL := FALSE;
        Mag_StartCommandMagazin : BOOL := FALSE;
        Mag_StartVar : BOOL := FALSE;
        Mag_WorkpieceReady : BOOL := FALSE;
        Mag_2_transit : BOOL := FALSE;
        Mag_2state : STATES_MAGAZIN := STATES_MAGAZIN#INIT;
        Mag_interconnectMagazinStartCommand : BOOL := FALSE;
        Stamp_CraneDown : BOOL := FALSE;
        Stamp_CraneOnConveyor : BOOL := FALSE;
        Stamp_CranePositionStamp : BOOL := FALSE;
        Stamp_CraneSucked : BOOL := FALSE;
        Stamp_CraneUp : BOOL := FALSE;
        Stamp_Duration : UINT := UINT#0;
        Stamp_SFCInit : BOOL := FALSE;
        Stamp_SFCReset : BOOL := FALSE;
        Stamp_StampGreenLamp : BOOL := FALSE;
        Stamp_StampLowered : BOOL := FALSE;
        Stamp_StampPressure : BOOL := FALSE;
        Stamp_StampPusher : BOOL := FALSE;
        Stamp_StampSliderFilled : BOOL := FALSE;
        Stamp_StampSliderMovedIn : BOOL := FALSE;
        Stamp_StampSliderMovedOut : BOOL := FALSE;
        Stamp_StampSliderSensorMovedIn : BOOL := FALSE;
        Stamp_StampSliderSensorMovedOut : BOOL := FALSE;
        Stamp_StampStartButton : BOOL := FALSE;
        Stamp_StampUp : BOOL := FALSE;
        Stamp_StampWhiteLamp : BOOL := FALSE;
        Stamp_StartCommandStamp : BOOL := FALSE;
        Stamp_StartVar : BOOL := FALSE;
        Stamp_Timer_ET : UINT := UINT#0;
        Stamp_Timer_IN : BOOL := FALSE;
        Stamp_Timer_PT : UINT := UINT#0;
        Stamp_Timer_Q : BOOL := FALSE;
        Stamp_2_transit : BOOL := FALSE;
        Stamp_2state : STATES_STAMP := STATES_STAMP#INIT;
        Stamp_interconnect : BOOL := FALSE;
        Stamp_interconnectStampStartCommand : BOOL := FALSE;
    END_VAR
    
    VAR  
        Crane_SFCPause : BOOL := FALSE;
        Mag_SFCPause : BOOL := FALSE;
        Stamp_SFCPause : BOOL := FALSE;
    END_VAR
    
    VAR_INPUT  
        Sensor_CraneDown : BOOL := FALSE;
        Sensor_CraneOnConveyor : BOOL := FALSE;
        Sensor_CraneOnMagazin : BOOL := FALSE;
        Sensor_CranePosition : BOOL := FALSE;
        Sensor_CranePositionStamp : BOOL := FALSE;
        Sensor_CraneSucked : BOOL := FALSE;
        Sensor_CraneUp : BOOL := FALSE;
        Sensor_MagazinCapacitiveSensor : BOOL := FALSE;
        Sensor_MagazinEmergencyStop : BOOL := FALSE;
        Sensor_MagazinOpticalSensor : BOOL := FALSE;
        Sensor_MagazinSwitchManuellAutomatic : BOOL := FALSE;
        Sensor_SliderMovedOut : BOOL := FALSE;
        Sensor_SliderNotMovedOut : BOOL := FALSE;
        Sensor_StampEmergencyStop : BOOL := FALSE;
        Sensor_StampLowered : BOOL := FALSE;
        Sensor_StampSliderFilled : BOOL := FALSE;
        Sensor_StampSliderSensorMovedIn : BOOL := FALSE;
        Sensor_StampSliderSensorMovedOut : BOOL := FALSE;
        Sensor_StampStartButton : BOOL := FALSE;
        Sensor_StampSwitchManuellAutomatic : BOOL := FALSE;
        Sensor_StampUp : BOOL := FALSE;
        Sensor_StartButtonMagazin : BOOL := FALSE;
        Sensor_WorkpieceReady : BOOL := FALSE;
    END_VAR
    
    
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
        (* //! REGION Mag[Mag_SFCInit, Mag_interconnectMagazinStartCommand] 
        (Mag_CraneDown, Mag_CraneOnConveyor, Mag_CraneOnMagazin, Mag_CraneSucked, Mag_CraneUp, Mag_SFCReset, Mag_SliderMovedOut, Mag_SliderNotMovedOut, Mag_StartButtonMagazin, Mag_StartVar, Mag_WorkpieceReady) => (Mag_CraneLower, Mag_CraneTurnClockwise, Mag_CraneTurnCounterclockwise, Mag_MagazinGreenLamp, Mag_MagazinSlider, Mag_MagazinVacuumOff, Mag_MagazinVacuumOn, Mag_MagazinWhiteLamp, Mag_StartCommandMagazin)  *)
            IF (Mag_SFCInit OR Mag_SFCReset) THEN
                Mag_CraneDown := FALSE;
                Mag_CraneLower := FALSE;
                Mag_CraneOnConveyor := FALSE;
                Mag_CraneOnMagazin := FALSE;
                Mag_CraneSucked := FALSE;
                Mag_CraneTurnClockwise := FALSE;
                Mag_CraneTurnCounterclockwise := FALSE;
                Mag_CraneUp := FALSE;
                Mag_MagazinGreenLamp := FALSE;
                Mag_MagazinSlider := FALSE;
                Mag_MagazinVacuumOff := FALSE;
                Mag_MagazinVacuumOn := FALSE;
                Mag_MagazinWhiteLamp := FALSE;
                Mag_SFCInit := FALSE;
                Mag_SFCReset := FALSE;
                Mag_SliderMovedOut := FALSE;
                Mag_SliderNotMovedOut := FALSE;
                Mag_StartButtonMagazin := FALSE;
                Mag_StartCommandMagazin := FALSE;
                Mag_StartVar := FALSE;
                Mag_WorkpieceReady := FALSE;
                Mag_2_transit := FALSE;
                Mag_2state := STATES_MAGAZIN#INIT;
                Mag_interconnectMagazinStartCommand := FALSE;
            END_IF;
            IF NOT (Mag_SFCInit OR Mag_SFCPause) THEN
                (* //Running pipeline step: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

                CASE Mag_2state OF 
                    STATES_MAGAZIN#INIT:
                        Mag_2_transit := FALSE;
                        IF TRUE THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#START_MAGAZIN;
                        END_IF;
                    
                    STATES_MAGAZIN#START_MAGAZIN:
                        Mag_2_transit := FALSE;
                        (* //Call of action: Start_Magazin_active *)

                        Mag_MagazinSlider := FALSE;
                        Mag_MagazinGreenLamp := FALSE;
                        Mag_StartVar := FALSE;
                        Mag_StartCommandMagazin := FALSE;
                        IF (Mag_StartButtonMagazin = TRUE) THEN
                            Mag_interconnectMagazinStartCommand := TRUE;
                        END_IF;
                        (* //End of action call: Start_Magazin_active *)

                        IF Mag_interconnectMagazinStartCommand THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#GREEN_LAMP;
                        END_IF;
                    
                    STATES_MAGAZIN#GREEN_LAMP:
                        Mag_2_transit := FALSE;
                        (* //Call of action: Green_Lamp_active *)

                        Mag_MagazinGreenLamp := TRUE;
                        Mag_interconnectMagazinStartCommand := FALSE;
                        (* //End of action call: Green_Lamp_active *)

                        IF TRUE THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#MAGAZIN_INIT;
                        END_IF;
                    
                    STATES_MAGAZIN#MAGAZIN_INIT:
                        Mag_2_transit := FALSE;
                        (* //Call of action: Magazin_Init_active *)

                        Mag_MagazinSlider := TRUE;
                        (* //End of action call: Magazin_Init_active *)

                        IF TRUE THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#MAGAZIN_INIT_2;
                        END_IF;
                    
                    STATES_MAGAZIN#MAGAZIN_INIT_2:
                        Mag_2_transit := FALSE;
                        (* //Call of action: Magazin_Init_2_active *)

                        Mag_MagazinSlider := FALSE;
                        (* //End of action call: Magazin_Init_2_active *)

                        IF TRUE THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#INTERSTEP;
                        END_IF;
                    
                    STATES_MAGAZIN#INTERSTEP:
                        Mag_2_transit := FALSE;
                        (* //Call of action: Interstep_active *)

                        Mag_StartCommandMagazin := TRUE;
                        (* //End of action call: Interstep_active *)

                        IF Mag_StartVar THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#CONVEY;
                        END_IF;
                    
                    STATES_MAGAZIN#CONVEY:
                        Mag_2_transit := FALSE;
                        (* //Call of action: convey_active *)

                        IF Mag_SliderNotMovedOut THEN
                            Mag_MagazinSlider := TRUE;
                        END_IF;
                        (* //End of action call: convey_active *)

                        IF Mag_CraneOnMagazin THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#STEP0;
                        END_IF;
                    
                    STATES_MAGAZIN#STEP0:
                        Mag_2_transit := FALSE;
                        IF Mag_CraneDown THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#SLIDER_MOVE_BACK;
                        END_IF;
                    
                    STATES_MAGAZIN#SLIDER_MOVE_BACK:
                        Mag_2_transit := FALSE;
                        (* //Call of action: SliderMoveBack_active *)

                        IF ((Mag_SliderMovedOut = TRUE) AND (Mag_SliderNotMovedOut = FALSE)) THEN
                            Mag_MagazinSlider := FALSE;
                        END_IF;
                        (* //End of action call: SliderMoveBack_active *)

                        IF Mag_CraneUp THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#STEP1;
                        END_IF;
                    
                    STATES_MAGAZIN#STEP1:
                        Mag_2_transit := FALSE;
                        IF Mag_CraneOnConveyor THEN
                            Mag_2_transit := TRUE;
                            Mag_2state := STATES_MAGAZIN#INTERSTEP;
                        END_IF;
                    
                                    END_CASE;
                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

            END_IF;
            (* //End of: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

        (* //! END_REGION *)
        (* //! REGION   Crane[Crane_CranTurnClockwise, Crane_Duration1, Crane_SFCInit, Crane_TimeDelay_Timer_ET,  Crane_TimeDelay_Timer_IN, Crane_TimeDelay_Timer_PT, Crane_TimeDelay_Timer_Q, Crane_TimeDelay_Timer_Duration, Crane_TimeDelay_Timer_interconnect, Crane_Timer1_ET, Crane_Timer1_IN, Crane_Timer1_PT, Crane_Timer1_Q, Crane_actualtime1, Crane_interconnect, Crane_interconnectCraneStartCommand] 
        (Crane_CraneDown, Crane_CraneOnConveyor, Crane_CraneOnMagazin, Crane_CranePositionStamp, Crane_CraneSucked, Crane_CraneUp, Crane_MagazinCapacitiveSensor, Crane_SFCReset, Crane_SliderMovedOut, Crane_SliderNotMovedOut, Crane_StampLowered, Crane_StampSliderFilled, Crane_StartButtonMagazin, Crane_StartVar, Crane_WorkpieceReady) => (Crane_CraneLower, Crane_CraneTurnClockwise, Crane_CraneTurnCounterclockwise, Crane_MagazinSlider, Crane_MagazinVacuumOff, Crane_MagazinVacuumOn, Crane_StartCommandCrane)  *)
            IF (Crane_SFCInit OR Crane_SFCReset) THEN
                Crane_CranTurnClockwise := FALSE;
                Crane_CraneDown := FALSE;
                Crane_CraneLower := FALSE;
                Crane_CraneOnConveyor := FALSE;
                Crane_CraneOnMagazin := FALSE;
                Crane_CranePositionStamp := FALSE;
                Crane_CraneSucked := FALSE;
                Crane_CraneTurnClockwise := FALSE;
                Crane_CraneTurnCounterclockwise := FALSE;
                Crane_CraneUp := FALSE;
                Crane_Duration1 := UINT#375;
                Crane_MagazinCapacitiveSensor := FALSE;
                Crane_MagazinSlider := FALSE;
                Crane_MagazinVacuumOff := FALSE;
                Crane_MagazinVacuumOn := FALSE;
                Crane_SFCInit := FALSE;
                Crane_SFCReset := FALSE;
                Crane_SliderMovedOut := FALSE;
                Crane_SliderNotMovedOut := FALSE;
                Crane_StampLowered := FALSE;
                Crane_StampSliderFilled := FALSE;
                Crane_StartButtonMagazin := FALSE;
                Crane_StartCommandCrane := FALSE;
                Crane_StartVar := FALSE;
                Crane_TimeDelay_Timer_ET := UINT#0;
                Crane_TimeDelay_Timer_IN := FALSE;
                Crane_TimeDelay_Timer_PT := UINT#0;
                Crane_TimeDelay_Timer_Q := FALSE;
                Crane_TimeDelay_Timer_Duration := UINT#12;
                Crane_TimeDelay_Timer_interconnect := FALSE;
                Crane_Timer1_ET := UINT#0;
                Crane_Timer1_IN := FALSE;
                Crane_Timer1_PT := UINT#0;
                Crane_Timer1_Q := FALSE;
                Crane_WorkpieceReady := FALSE;
                Crane_2_transit := FALSE;
                Crane_2state := STATES_CRANE#INIT;
                Crane_actualtime1 := UINT#0;
                Crane_interconnect := FALSE;
                Crane_interconnectCraneStartCommand := FALSE;
            END_IF;
            IF NOT (Crane_SFCInit OR Crane_SFCPause) THEN
                CASE Crane_2state OF 
                    STATES_CRANE#INIT:
                        Crane_2_transit := FALSE;
                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#START_CRANE;
                        END_IF;
                    
                    STATES_CRANE#START_CRANE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Start_Crane_active *)

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
                        (* //End of action call: Start_Crane_active *)

                        IF Crane_interconnectCraneStartCommand THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_INIT;
                        END_IF;
                    
                    STATES_CRANE#CRANE_INIT:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Init_active *)

                        Crane_CraneLower := TRUE;
                        Crane_interconnectCraneStartCommand := FALSE;
                        (* //End of action call: Crane_Init_active *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_INIT_2;
                        END_IF;
                    
                    STATES_CRANE#CRANE_INIT_2:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Init_2_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Init_2_active *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#INTERSTEP;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Interstep_active *)

                        Crane_StartCommandCrane := TRUE;
                        (* //End of action call: Interstep_active *)

                        IF Crane_StartVar THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#INTERSTEP_2;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP_2:
                        Crane_2_transit := FALSE;
                        IF Crane_SliderMovedOut THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#TIMEDELAY;
                        END_IF;
                    
                    STATES_CRANE#TIMEDELAY:
                        Crane_2_transit := FALSE;
                        (* //Call of action: TimeDelay_active *)

                        Crane_TimeDelay_Timer_IN := TRUE;
                        Crane_TimeDelay_Timer_PT := Crane_TimeDelay_Timer_Duration;
                        (* //! REGION TimeDelay_Timer[](Crane_TimeDelay_Timer_IN, Crane_TimeDelay_Timer_PT) => ( Crane_TimeDelay_Timer_ET, Crane_TimeDelay_Timer_Q) *)
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
                        (* //! END_REGION *)
                        Crane_TimeDelay_Timer_interconnect := Crane_TimeDelay_Timer_Q;
                        (* //End of action call: TimeDelay_active *)

                        IF Crane_TimeDelay_Timer_interconnect THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#TURN_RIGHT;
                        END_IF;
                    
                    STATES_CRANE#TURN_RIGHT:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Step0_active *)

                        Crane_CraneTurnClockwise := TRUE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        (* //End of action call: Step0_active *)

                        IF Crane_CraneOnMagazin THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#MAGAZIN_STOP;
                        END_IF;
                    
                    STATES_CRANE#MAGAZIN_STOP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: MagazinStop_active *)

                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        (* //End of action call: MagazinStop_active *)

                        IF Crane_WorkpieceReady THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LOWER;
                        ELSIF (NOT Crane_WorkpieceReady AND Crane_StampSliderFilled) THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#LAST_WORKPIECE_AT_STAMP;
                        ELSIF (NOT Crane_WorkpieceReady AND NOT Crane_StampSliderFilled) THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#NO_WORKPIECE_READY;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LOWER:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lower_active *)

                        Crane_MagazinVacuumOn := TRUE;
                        Crane_MagazinVacuumOff := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Crane_Lower_active *)

                        IF Crane_CraneSucked THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#STEP0;
                        END_IF;
                    
                    STATES_CRANE#STEP0:
                        Crane_2_transit := FALSE;
                        IF NOT Crane_MagazinCapacitiveSensor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_MAGAZIN;
                        ELSIF Crane_MagazinCapacitiveSensor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_MAGAZIN_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZIN:
                        Crane_2_transit := FALSE;
                        (* //Call of action: CraneLiftMagazin_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: CraneLiftMagazin_active *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: CraneTurnLeft_active *)

                        Crane_CraneTurnCounterclockwise := TRUE;
                        Crane_CraneTurnClockwise := FALSE;
                        (* //End of action call: CraneTurnLeft_active *)

                        IF Crane_CraneOnConveyor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_CONVEYOR;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR:
                        Crane_2_transit := FALSE;
                        (* //Call of action: CraneOnConveyor_active *)

                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: CraneOnConveyor_active *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RELEASE;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZIN_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lift_Magazin_Metallic_active_0 *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Lift_Magazin_Metallic_active_0 *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_TURN_LEFT_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Turn_Left_Metallic_active *)

                        Crane_CraneTurnCounterclockwise := TRUE;
                        Crane_CraneTurnClockwise := FALSE;
                        (* //End of action call: Crane_Turn_Left_Metallic_active *)

                        IF Crane_CranePositionStamp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_STAMP_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_STAMP_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_On_Conveyor_Metallic_active *)

                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Crane_On_Conveyor_Metallic_active *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RELEASE_WORKPIECE;
                        END_IF;
                    
                    STATES_CRANE#RELEASE_WORKPIECE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: release_Workpiece_active *)

                        Crane_MagazinVacuumOff := TRUE;
                        Crane_MagazinVacuumOn := FALSE;
                        (* //End of action call: release_Workpiece_active *)

                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_GO_UP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_GO_UP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Go_Up_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Go_Up_active *)

                        IF (Crane_CraneUp AND (Crane_MagazinCapacitiveSensor OR NOT Crane_WorkpieceReady)) THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#PAUSE;
                        ELSIF ((Crane_CraneUp AND NOT Crane_MagazinCapacitiveSensor) AND Crane_WorkpieceReady) THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#TURN_RIGHT_BLACK;
                        END_IF;
                    
                    STATES_CRANE#PAUSE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: pause_active *)

                        Crane_Timer1_IN := Crane_CraneUp;
                        Crane_Timer1_PT := Crane_Duration1;
                        (* //! REGION Timer1[](Crane_Timer1_IN, Crane_Timer1_PT) => (Crane_Timer1_ET,  Crane_Timer1_Q)  *)
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
                        (* //! END_REGION *)
                        Crane_interconnect := Crane_Timer1_Q;
                        (* //End of action call: pause_active *)

                        IF Crane_interconnect THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RESET_INTERCONNECT;
                        END_IF;
                    
                    STATES_CRANE#TURN_RIGHT_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Turn_Right_Black_active *)

                        Crane_CraneTurnClockwise := TRUE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        (* //End of action call: Turn_Right_Black_active *)

                        IF Crane_CraneOnMagazin THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#MAGAZIN_STOP_BLACK;
                        END_IF;
                    
                    STATES_CRANE#MAGAZIN_STOP_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Magazin_Stop_Black_active *)

                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_MagazinVacuumOn := TRUE;
                        Crane_MagazinVacuumOff := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Magazin_Stop_Black_active *)

                        IF Crane_CraneSucked THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_NOT_METALLIC_BLACK;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_NOT_METALLIC_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lift_NOT_Metallic_Black_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Lift_NOT_Metallic_Black_active *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC_BLACK;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Turn_Left_NOT_Metallic_Black_active *)

                        Crane_CraneTurnCounterclockwise := TRUE;
                        Crane_CraneTurnClockwise := FALSE;
                        (* //End of action call: Crane_Turn_Left_NOT_Metallic_Black_active *)

                        IF Crane_CraneOnConveyor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR_NOT_METALLICA_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_On_Conveyor_Not_Metallica_Black_active *)

                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Crane_On_Conveyor_Not_Metallica_Black_active *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RELEASE_BLACK;
                        END_IF;
                    
                    STATES_CRANE#RELEASE_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: release_Black_active *)

                        Crane_MagazinVacuumOn := FALSE;
                        Crane_MagazinVacuumOff := TRUE;
                        (* //End of action call: release_Black_active *)

                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_CONVEYOR_BLACK;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_CONVEYOR_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lift_Conveyor_Black_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Lift_Conveyor_Black_active *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_TURN_LEFT_BACK_TO_STAMP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_BACK_TO_STAMP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Turn_Left_Back_To_Stamp_active *)

                        Crane_CraneTurnCounterclockwise := TRUE;
                        Crane_CraneTurnClockwise := FALSE;
                        (* //End of action call: Crane_Turn_Left_Back_To_Stamp_active *)

                        IF Crane_CranePositionStamp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_STAMP_STOP_BLACK;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_STAMP_STOP_BLACK:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_On_Stamp_Stop_Black_active *)

                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        (* //End of action call: Crane_On_Stamp_Stop_Black_active *)

                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RESET_INTERCONNECT;
                        END_IF;
                    
                    STATES_CRANE#RESET_INTERCONNECT:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Reset_interconnect_active *)

                        Crane_interconnect := FALSE;
                        Crane_Timer1_IN := FALSE;
                        Crane_Timer1_PT := UINT#0;
                        (* //! REGION Timer1[](Crane_Timer1_IN, Crane_Timer1_PT) => (Crane_Timer1_ET,  Crane_Timer1_Q) *)
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
                        (* //! END_REGION *)
                        (* //End of action call: Reset_interconnect_active *)

                        IF Crane_SliderMovedOut THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#LOWER_CRANE;
                        END_IF;
                    
                    STATES_CRANE#LOWER_CRANE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Lower_Crane_active *)

                        Crane_CraneLower := TRUE;
                        (* //End of action call: Lower_Crane_active *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#SUCK_AT_STAMP;
                        END_IF;
                    
                    STATES_CRANE#SUCK_AT_STAMP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Suck_At_Stamp_active *)

                        Crane_MagazinVacuumOn := TRUE;
                        Crane_MagazinVacuumOff := FALSE;
                        (* //End of action call: Suck_At_Stamp_active *)

                        IF Crane_CraneSucked THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_AT_STAMP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_AT_STAMP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lift_At_Stamp_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Lift_At_Stamp_active *)

                        IF Crane_CraneUp THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_TURN_LEFT_FROM_STAMP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_FROM_STAMP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Turn_Left_From_Stamp_active *)

                        Crane_CraneTurnClockwise := TRUE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        (* //End of action call: Crane_Turn_Left_From_Stamp_active *)

                        IF Crane_CraneOnConveyor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_On_Conveyor_Metallic_active_0 *)

                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Crane_On_Conveyor_Metallic_active_0 *)

                        IF Crane_CraneDown THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#RELEASE;
                        END_IF;
                    
                    STATES_CRANE#RELEASE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: release_active *)

                        Crane_MagazinVacuumOff := TRUE;
                        Crane_MagazinVacuumOn := FALSE;
                        (* //End of action call: release_active *)

                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_CONVEYOR;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_CONVEYOR:
                        Crane_2_transit := FALSE;
                        (* //Call of action: CraneLiftConveyor_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: CraneLiftConveyor_active *)

                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#INTERSTEP;
                        END_IF;
                    
                    STATES_CRANE#LAST_WORKPIECE_AT_STAMP:
                        Crane_2_transit := FALSE;
                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#PAUSE;
                        END_IF;
                    
                    STATES_CRANE#NO_WORKPIECE_READY:
                        Crane_2_transit := FALSE;
                        IF TRUE THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#START_CRANE;
                        END_IF;
                    
                                    END_CASE;
                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

            END_IF;
            (* //End of: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

        (* //! END_REGION *)
        (* //! REGION Stamp[Stamp_Duration, Stamp_SFCInit, Stamp_Timer_ET, Stamp_Timer_IN, Stamp_Timer_PT,  Stamp_Timer_Q, Stamp_interconnect, Stamp_interconnectStampStartCommand](Stamp_CraneDown, Stamp_CraneOnConveyor, Stamp_CranePositionStamp, Stamp_CraneSucked, Stamp_CraneUp, Stamp_SFCReset, Stamp_StampLowered, Stamp_StampSliderFilled, Stamp_StampSliderSensorMovedIn, Stamp_StampSliderSensorMovedOut, Stamp_StampStartButton, Stamp_StampUp, Stamp_StartVar) => (Stamp_StampGreenLamp, Stamp_StampPressure, Stamp_StampPusher, Stamp_StampSliderMovedIn, Stamp_StampSliderMovedOut, Stamp_StampWhiteLamp, Stamp_StartCommandStamp)  *)
            IF (Stamp_SFCInit OR Stamp_SFCReset) THEN
                Stamp_CraneDown := FALSE;
                Stamp_CraneOnConveyor := FALSE;
                Stamp_CranePositionStamp := FALSE;
                Stamp_CraneSucked := FALSE;
                Stamp_CraneUp := FALSE;
                Stamp_Duration := UINT#125;
                Stamp_SFCInit := FALSE;
                Stamp_SFCReset := FALSE;
                Stamp_StampGreenLamp := FALSE;
                Stamp_StampLowered := FALSE;
                Stamp_StampPressure := FALSE;
                Stamp_StampPusher := FALSE;
                Stamp_StampSliderFilled := FALSE;
                Stamp_StampSliderMovedIn := FALSE;
                Stamp_StampSliderMovedOut := FALSE;
                Stamp_StampSliderSensorMovedIn := FALSE;
                Stamp_StampSliderSensorMovedOut := FALSE;
                Stamp_StampStartButton := FALSE;
                Stamp_StampUp := FALSE;
                Stamp_StampWhiteLamp := FALSE;
                Stamp_StartCommandStamp := FALSE;
                Stamp_StartVar := FALSE;
                Stamp_Timer_ET := UINT#0;
                Stamp_Timer_IN := FALSE;
                Stamp_Timer_PT := UINT#0;
                Stamp_Timer_Q := FALSE;
                Stamp_2_transit := FALSE;
                Stamp_2state := STATES_STAMP#INIT;
                Stamp_interconnect := FALSE;
                Stamp_interconnectStampStartCommand := FALSE;
            END_IF;
            IF NOT (Stamp_SFCInit OR Stamp_SFCPause) THEN
                (* //Running pipeline step: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //Running pipeline step:  edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

                CASE Stamp_2state OF 
                    STATES_STAMP#INIT:
                        Stamp_2_transit := FALSE;
                        IF TRUE THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#START_STAMP;
                        END_IF;
                    
                    STATES_STAMP#START_STAMP:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Start_Stamp_active *)

                        Stamp_StampSliderMovedOut := FALSE;
                        Stamp_StampSliderMovedIn := FALSE;
                        Stamp_StampPusher := FALSE;
                        Stamp_StampGreenLamp := FALSE;
                        Stamp_StampPressure := FALSE;
                        Stamp_StartCommandStamp := FALSE;
                        IF (Stamp_StampStartButton = TRUE) THEN
                            Stamp_interconnectStampStartCommand := TRUE;
                        END_IF;
                        (* //End of action call: Start_Stamp_active *)

                        IF Stamp_interconnectStampStartCommand THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#GREEN_LAMP;
                        END_IF;
                    
                    STATES_STAMP#GREEN_LAMP:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Green_Lamp_active *)

                        Stamp_StampGreenLamp := TRUE;
                        Stamp_interconnectStampStartCommand := FALSE;
                        (* //End of action call: Green_Lamp_active *)

                        IF TRUE THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMP_INIT_1;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_1:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Stamp_Init_1_active *)

                        Stamp_StampSliderMovedIn := TRUE;
                        Stamp_StampSliderMovedOut := FALSE;
                        (* //End of action call: Stamp_Init_1_active *)

                        IF Stamp_StampSliderSensorMovedIn THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMP_INIT_2;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_2:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Stamp_Init_2_active *)

                        Stamp_StampSliderMovedIn := FALSE;
                        Stamp_StampSliderMovedOut := TRUE;
                        (* //End of action call: Stamp_Init_2_active *)

                        IF Stamp_StampSliderSensorMovedOut THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMP_INIT_3;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_3:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Stamp_Init_2_active *)

                        Stamp_StampPusher := TRUE;
                        (* //End of action call: Stamp_Init_2_active *)

                        IF Stamp_StampLowered THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMP_INIT_4;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_4:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Stamp_Init_4_active *)

                        Stamp_StampPusher := FALSE;
                        (* //End of action call: Stamp_Init_4_active *)

                        IF Stamp_StampUp THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#INTERSTEP;
                        END_IF;
                    
                    STATES_STAMP#INTERSTEP:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Interstep_active *)

                        Stamp_StartCommandStamp := TRUE;
                        (* //End of action call: Interstep_active *)

                        IF Stamp_StartVar THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#INTERSTEP_2;
                        END_IF;
                    
                    STATES_STAMP#INTERSTEP_2:
                        Stamp_2_transit := FALSE;
                        IF Stamp_StampSliderFilled THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STEP0;
                        END_IF;
                    
                    STATES_STAMP#STEP0:
                        Stamp_2_transit := FALSE;
                        IF Stamp_CraneUp THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMPSLIDERBACK;
                        END_IF;
                    
                    STATES_STAMP#STAMPSLIDERBACK:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: StampSliderBack_active *)

                        Stamp_StampSliderMovedIn := TRUE;
                        Stamp_StampSliderMovedOut := FALSE;
                        (* //End of action call: StampSliderBack_active *)

                        IF Stamp_StampSliderSensorMovedIn THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMPPROCESS;
                        END_IF;
                    
                    STATES_STAMP#STAMPPROCESS:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: StampProcess_active *)

                        Stamp_StampSliderMovedIn := FALSE;
                        Stamp_StampPusher := TRUE;
                        (* //End of action call: StampProcess_active *)

                        IF Stamp_StampLowered THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STEP1;
                        END_IF;
                    
                    STATES_STAMP#STEP1:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: Step1_active *)

                        Stamp_Timer_IN := Stamp_StampLowered;
                        Stamp_Timer_PT := UINT#0;
                        (* //! REGION Timer[](Stamp_Timer_IN, Stamp_Timer_PT) => (Stamp_Timer_ET, Stamp_Timer_Q) *)
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
                        (* //! END_REGION *)
                        Stamp_interconnect := Stamp_Timer_Q;
                        (* //End of action call: Step1_active *)

                        IF Stamp_interconnect THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STAMPSLIDERFORWARD;
                        END_IF;
                    
                    STATES_STAMP#STAMPSLIDERFORWARD:
                        Stamp_2_transit := FALSE;
                        (* //Call of action: StampSliderForward_active *)

                        Stamp_StampPusher := FALSE;
                        Stamp_StampSliderMovedOut := TRUE;
                        IF ((Stamp_StampLowered = FALSE) AND (Stamp_StampUp = TRUE)) THEN
                            Stamp_interconnect := FALSE;
                        END_IF;
                        Stamp_Timer_IN := FALSE;
                        Stamp_Timer_PT := UINT#0;
                        (* //! REGION Timer[](Stamp_Timer_IN, Stamp_Timer_PT) => (Stamp_Timer_ET, Stamp_Timer_Q) *)
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
                        (* //! END_REGION *)
                        (* //End of action call: StampSliderForward_active *)

                        IF Stamp_StampSliderMovedOut THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#STEP2;
                        END_IF;
                    
                    STATES_STAMP#STEP2:
                        Stamp_2_transit := FALSE;
                        IF (Stamp_CraneOnConveyor AND NOT Stamp_StampSliderFilled) THEN
                            Stamp_2_transit := TRUE;
                            Stamp_2state := STATES_STAMP#INTERSTEP;
                        END_IF;
                    
                                    END_CASE;
                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

            END_IF;
            (* //End of: edu.kit.iti.formal.automation.st.SfcFlagIntroduction *)

        (* //! END_REGION *)
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
