TYPE 
    STATES_CRANE : (Init, Start_Crane, Crane_Init, Crane_Init_2, Interstep, Interstep_2, TimeDelay, Turn_Right, Interstep_Check_Workpiece, Magazin_Stop, Step0, Crane_Lift_Magazine, Crane_Turn_Left_NOT_Metallic, Crane_On_Conveyor, Crane_Lift_Magazine_Metallic, Crane_Turn_Left_Metallic, Crane_On_Conveyor_Metallic, release, Crane_Lift_Conveyor, Crane_Stop);
    STATES_MAGAZIN : (Init, Start_Magazin, Green_Lamp, Magazin_Init, Magazin_Init_2, Interstep, convey, Step0, Slider_Move_Back, Step1);
END_TYPE

PROGRAM Main
    VAR_OUTPUT  
        Actuator_CraneLower : BOOL := FALSE;
        Actuator_CraneTurnClockwise : BOOL := FALSE;
        Actuator_CraneTurnCounterclockwise : BOOL := FALSE;
        Actuator_MagazinGreenLamp : BOOL := FALSE;
        Actuator_MagazinSlider : BOOL := FALSE;
        Actuator_MagazinVacuumOff : BOOL := FALSE;
        Actuator_MagazinVacuumOn : BOOL := FALSE;
        Actuator_MagazinWhiteLamp : BOOL := FALSE;
    END_VAR
    
    VAR  
        Crane_CraneDown : BOOL := FALSE;
        Crane_CraneLower : BOOL := FALSE;
        Crane_CraneOnConveyor : BOOL := FALSE;
        Crane_CraneOnMagazin : BOOL := FALSE;
        Crane_CraneSucked : BOOL := FALSE;
        Crane_CraneTurnClockwise : BOOL := FALSE;
        Crane_CraneTurnCounterclockwise : BOOL := FALSE;
        Crane_CraneUp : BOOL := FALSE;
        Crane_MagazinCapacitiveSensor : BOOL := FALSE;
        Crane_MagazinVacuumOff : BOOL := FALSE;
        Crane_MagazinVacuumOn : BOOL := FALSE;
        Crane_SFCInit : BOOL := FALSE;
        Crane_SFCReset : BOOL := FALSE;
        Crane_SliderMovedOut : BOOL := FALSE;
        Crane_SliderNotMovedOut : BOOL := FALSE;
        Crane_StartButtonMagazin : BOOL := FALSE;
        Crane_StartCommandCrane : BOOL := FALSE;
        Crane_StartVar : BOOL := FALSE;
        Crane_TimeDelay_Timer_ET : UINT := UINT#0;
        Crane_TimeDelay_Timer_IN : BOOL := FALSE;
        Crane_TimeDelay_Timer_PT : UINT := UINT#0;
        Crane_TimeDelay_Timer_Q : BOOL := FALSE;
        Crane_TimeDelay_Timer_Duration : UINT := UINT#0;
        Crane_TimeDelay_Timer_interconnect : BOOL := FALSE;
        Crane_WorkpieceReady : BOOL := FALSE;
        Crane_2_transit : BOOL := FALSE;
        Crane_2state : STATES_CRANE := STATES_CRANE#INIT;
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
    END_VAR
    
    VAR  
        Crane_SFCPause : BOOL := FALSE;
        Mag_SFCPause : BOOL := FALSE;
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
    Crane_WorkpieceReady := Sensor_WorkpieceReady;
    Crane_CraneUp := Sensor_CraneUp;
    Crane_CraneOnConveyor := Sensor_CraneOnConveyor;
    Crane_CraneDown := Sensor_CraneDown;
    Crane_CraneSucked := Sensor_CraneSucked;
    Crane_CraneOnMagazin := Sensor_CraneOnMagazin;
    Crane_MagazinCapacitiveSensor := Sensor_MagazinCapacitiveSensor;
    Crane_SliderMovedOut := Sensor_SliderMovedOut;
    Crane_StartButtonMagazin := Sensor_StartButtonMagazin;
    Actuator_CraneTurnCounterclockwise := Crane_CraneTurnCounterclockwise;
    Actuator_CraneTurnClockwise := Crane_CraneTurnClockwise;
    Actuator_CraneLower := Crane_CraneLower;
    Actuator_MagazinVacuumOff := Crane_MagazinVacuumOff;
    Actuator_MagazinVacuumOn := Crane_MagazinVacuumOn;
    IF Sensor_MagazinEmergencyStop THEN
        (* ! REGION Mag[Mag_SFCInit, Mag_interconnectMagazinStartCommand](Mag_CraneDown, Mag_CraneOnConveyor, Mag_CraneOnMagazin, Mag_CraneSucked, Mag_CraneUp, Mag_SFCReset, Mag_SliderMovedOut, Mag_SliderNotMovedOut, Mag_StartButtonMagazin, Mag_StartVar, Mag_WorkpieceReady) => (Mag_CraneLower, Mag_CraneTurnClockwise, Mag_CraneTurnCounterclockwise, Mag_MagazinGreenLamp, Mag_MagazinSlider, Mag_MagazinVacuumOff, Mag_MagazinVacuumOn, Mag_MagazinWhiteLamp, Mag_StartCommandMagazin) *)
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
        (* //! REGION Crane[Crane_SFCInit, Crane_TimeDelay_Timer_ET, Crane_TimeDelay_Timer_IN,  Crane_TimeDelay_Timer_PT, Crane_TimeDelay_Timer_Q, Crane_TimeDelay_Timer_Duration, Crane_TimeDelay_Timer_interconnect, Crane_interconnectCraneStartCommand](Crane_CraneDown, Crane_CraneOnConveyor, Crane_CraneOnMagazin, Crane_CraneSucked, Crane_CraneUp, Crane_MagazinCapacitiveSensor, Crane_SFCReset, Crane_SliderMovedOut, Crane_SliderNotMovedOut, Crane_StartButtonMagazin, Crane_StartVar, Crane_WorkpieceReady) => (Crane_CraneLower, Crane_CraneTurnClockwise, Crane_CraneTurnCounterclockwise, Crane_MagazinVacuumOff, Crane_MagazinVacuumOn, Crane_StartCommandCrane) *)
            IF (Crane_SFCInit OR Crane_SFCReset) THEN
                Crane_CraneDown := FALSE;
                Crane_CraneLower := FALSE;
                Crane_CraneOnConveyor := FALSE;
                Crane_CraneOnMagazin := FALSE;
                Crane_CraneSucked := FALSE;
                Crane_CraneTurnClockwise := FALSE;
                Crane_CraneTurnCounterclockwise := FALSE;
                Crane_CraneUp := FALSE;
                Crane_MagazinCapacitiveSensor := FALSE;
                Crane_MagazinVacuumOff := FALSE;
                Crane_MagazinVacuumOn := FALSE;
                Crane_SFCInit := FALSE;
                Crane_SFCReset := FALSE;
                Crane_SliderMovedOut := FALSE;
                Crane_SliderNotMovedOut := FALSE;
                Crane_StartButtonMagazin := FALSE;
                Crane_StartCommandCrane := FALSE;
                Crane_StartVar := FALSE;
                Crane_TimeDelay_Timer_ET := UINT#0;
                Crane_TimeDelay_Timer_IN := FALSE;
                Crane_TimeDelay_Timer_PT := UINT#0;
                Crane_TimeDelay_Timer_Q := FALSE;
                Crane_TimeDelay_Timer_Duration := UINT#12;
                Crane_TimeDelay_Timer_interconnect := FALSE;
                Crane_WorkpieceReady := FALSE;
                Crane_2_transit := FALSE;
                Crane_2state := STATES_CRANE#INIT;
                Crane_interconnectCraneStartCommand := FALSE;
            END_IF;
            IF NOT (Crane_SFCInit OR Crane_SFCPause) THEN
                (* //Running pipeline step: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.IntroduceStateEnumVariable *)

                (* //Running pipeline step:  edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //End of: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_IntroduceTransitVariable *)

                (* //Running pipeline step: edu.kit.iti.formal.automation.st.TranslationSfcToStOld_TheBigStateCase *)

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
                            Crane_2state := STATES_CRANE#INTERSTEP_CHECK_WORKPIECE;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP_CHECK_WORKPIECE:
                        Crane_2_transit := FALSE;
                        IF Crane_WorkpieceReady THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#MAGAZIN_STOP;
                        ELSIF NOT Crane_WorkpieceReady THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_STOP;
                        END_IF;
                    
                    STATES_CRANE#MAGAZIN_STOP:
                        Crane_2_transit := FALSE;
                        (* //Call of action: MagazinStop_active *)

                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_MagazinVacuumOn := TRUE;
                        Crane_MagazinVacuumOff := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: MagazinStop_active *)

                        IF Crane_CraneSucked THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#STEP0;
                        END_IF;
                    
                    STATES_CRANE#STEP0:
                        Crane_2_transit := FALSE;
                        IF NOT Crane_MagazinCapacitiveSensor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_MAGAZINE;
                        ELSIF Crane_MagazinCapacitiveSensor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_LIFT_MAGAZINE_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZINE:
                        Crane_2_transit := FALSE;
                        (* //Call of action: CraneLiftMagazine_active *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: CraneLiftMagazine_active *)

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
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZINE_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_Lift_Magazine_Metallic_active_0 *)

                        Crane_CraneLower := FALSE;
                        (* //End of action call: Crane_Lift_Magazine_Metallic_active_0 *)

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

                        IF Crane_CraneOnConveyor THEN
                            Crane_2_transit := TRUE;
                            Crane_2state := STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC:
                        Crane_2_transit := FALSE;
                        (* //Call of action: Crane_On_Conveyor_Metallic_active *)

                        Crane_CraneTurnCounterclockwise := FALSE;
                        Crane_CraneTurnClockwise := FALSE;
                        Crane_CraneLower := TRUE;
                        (* //End of action call: Crane_On_Conveyor_Metallic_active *)

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
                    
                    STATES_CRANE#CRANE_STOP:
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
        IF Actuator_MagazinGreenLamp THEN
            IF (Crane_StartCommandCrane AND Mag_StartCommandMagazin) THEN
                Crane_StartVar := TRUE;
                Mag_StartVar := TRUE;
            END_IF;
        END_IF;
        Crane_SFCReset := FALSE;
        Mag_SFCReset := FALSE;
    ELSIF NOT Sensor_MagazinEmergencyStop THEN
        Actuator_MagazinSlider := FALSE;
        Actuator_CraneLower := FALSE;
        Actuator_MagazinVacuumOn := FALSE;
        Actuator_MagazinVacuumOff := TRUE;
        Actuator_MagazinGreenLamp := FALSE;
        Actuator_CraneTurnCounterclockwise := FALSE;
        Actuator_CraneTurnClockwise := FALSE;
        Crane_SFCReset := TRUE;
        Mag_SFCReset := TRUE;
        Crane_StartVar := FALSE;
        Mag_StartVar := FALSE;
    END_IF;
END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#50ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Main;
  END_RESOURCE
END_CONFIGURATION
