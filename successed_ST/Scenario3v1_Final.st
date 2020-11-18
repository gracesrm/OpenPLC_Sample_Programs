TYPE 
    STATES_CRANE : (INIT, START_CRANE, CRANE_INIT, CRANE_INIT_2, INTERSTEP, INTERSTEP_2, TIMEDELAY, TURN_RIGHT, INTERSTEP_CHECK_WORKPIECE, CRANE_LOWER, STEP0, CRANE_LIFT_MAGAZIN, CRANE_TURN_LEFT_NOT_METALLIC, CRANE_ON_CONVEYOR, CRANE_LIFT_MAGAZIN_METALLIC, CRANE_TURN_LEFT_METALLIC, CRANE_ON_STAMP_METALLIC, RELEASE_WORKPIECE, CRANE_GO_UP, PAUSE, RESET_INTERCONNECT, LOWER_CRANE, SUCK_AT_STAMP, CRANE_LIFT_AT_STAMP, CRANE_TURN_LEFT_FROM_STAMP, CRANE_ON_CONVEYOR_METALLIC, RELEASE, CRANE_LIFT_CONVEYOR, WAIT_AT_STAMP, STEP2);
    STATES_MAGAZIN : (INIT, START_MAGAZIN, GREEN_LAMP, MAGAZIN_INIT, MAGAZIN_INIT_2, INTERSTEP, CONVEY, STEP0, SLIDER_MOVE_BACK, STEP1);
    STATES_STAMP : (INIT, START_STAMP, GREEN_LAMP, STAMP_INIT_1, STAMP_INIT_2, STAMP_INIT_3, STAMP_INIT_4, INTERSTEP, INTERSTEP_2, STEP0, STAMPSLIDERBACK, STAMPPROCESS, STEP1, STAMPSLIDERFORWARD, STEP2);
END_TYPE


PROGRAM MAIN
    VAR_OUTPUT  
        ACTUATOR_ANALOGCRANEPRESSURE : INT := INT#0;
        ACTUATOR_CRANELOWER : BOOL := FALSE;
        ACTUATOR_CRANETURNCLOCKWISE : BOOL := FALSE;
        ACTUATOR_CRANETURNCOUNTERCLOCKWISE : BOOL := FALSE;
        ACTUATOR_MAGAZINGREENLAMP : BOOL := FALSE;
        ACTUATOR_MAGAZINSLIDER : BOOL := FALSE;
        ACTUATOR_MAGAZINVACUUMOFF : BOOL := FALSE;
        ACTUATOR_MAGAZINVACUUMON : BOOL := FALSE;
        ACTUATOR_MAGAZINWHITELAMP : BOOL := FALSE;
        ACTUATOR_SOMEACTUATOR : BOOL := FALSE;
        ACTUATOR_STAMPGREENLAMP : BOOL := FALSE;
        ACTUATOR_STAMPPUSHER : BOOL := FALSE;
        ACTUATOR_STAMPSLIDERMOVEDIN : BOOL := FALSE;
        ACTUATOR_STAMPSLIDERMOVEDOUT : BOOL := FALSE;
        ACTUATOR_STAMPWHITELAMP : BOOL := FALSE;
    END_VAR
    
    VAR  
        CRANE_CRANEDOWN : BOOL := FALSE;
        CRANE_CRANELOWER : BOOL := FALSE;
        CRANE_CRANEONCONVEYOR : BOOL := FALSE;
        CRANE_CRANEONMAGAZIN : BOOL := FALSE;
        CRANE_CRANEPOSITIONSTAMP : BOOL := FALSE;
        CRANE_CRANESUCKED : BOOL := FALSE;
        CRANE_CRANETURNCLOCKWISE : BOOL := FALSE;
        CRANE_CRANETURNCOUNTERCLOCKWISE : BOOL := FALSE;
        CRANE_CRANEUP : BOOL := FALSE;
        CRANE_DURATION1 : UINT := UINT#0;
        CRANE_MAGAZINCAPACITIVESENSOR : BOOL := FALSE;
        CRANE_MAGAZINVACUUMOFF : BOOL := FALSE;
        CRANE_MAGAZINVACUUMON : BOOL := FALSE;
        CRANE_SFCINIT : BOOL := FALSE;
        CRANE_SFCRESET : BOOL := FALSE;
        CRANE_SLIDERMOVEDOUT : BOOL := FALSE;
        CRANE_SLIDERNOTMOVEDOUT : BOOL := FALSE;
        CRANE_STAMPLOWERED : BOOL := FALSE;
        CRANE_STAMPSLIDERFILLED : BOOL := FALSE;
        CRANE_STARTBUTTONMAGAZIN : BOOL := FALSE;
        CRANE_STARTCOMMANDCRANE : BOOL := FALSE;
        CRANE_STARTVAR : BOOL := FALSE;
        CRANE_TIMEDELAY_TIMER_ET : UINT := UINT#0;
        CRANE_TIMEDELAY_TIMER_IN : BOOL := FALSE;
        CRANE_TIMEDELAY_TIMER_PT : UINT := UINT#0;
        CRANE_TIMEDELAY_TIMER_Q : BOOL := FALSE;
        CRANE_TIMEDELAY_TIMER_DURATION : UINT := UINT#0;
        CRANE_TIMEDELAY_TIMER_INTERCONNECT : BOOL := FALSE;
        CRANE_TIMER1_ET : UINT := UINT#0;
        CRANE_TIMER1_IN : BOOL := FALSE;
        CRANE_TIMER1_PT : UINT := UINT#0;
        CRANE_TIMER1_Q : BOOL := FALSE;
        CRANE_WORKPIECEREADY : BOOL := FALSE;
        CRANE_2_TRANSIT : BOOL := FALSE;
        CRANE_2STATE : STATES_CRANE := STATES_CRANE#INIT;
        CRANE_ACTUALTIME1 : UINT := UINT#0;
        CRANE_INTERCONNECT : BOOL := FALSE;
        CRANE_INTERCONNECTCRANESTARTCOMMAND : BOOL := FALSE;
        MAG_CRANEDOWN : BOOL := FALSE;
        MAG_CRANELOWER : BOOL := FALSE;
        MAG_CRANEONCONVEYOR : BOOL := FALSE;
        MAG_CRANEONMAGAZIN : BOOL := FALSE;
        MAG_CRANESUCKED : BOOL := FALSE;
        MAG_CRANETURNCLOCKWISE : BOOL := FALSE;
        MAG_CRANETURNCOUNTERCLOCKWISE : BOOL := FALSE;
        MAG_CRANEUP : BOOL := FALSE;
        MAG_MAGAZINGREENLAMP : BOOL := FALSE;
        MAG_MAGAZINSLIDER : BOOL := FALSE;
        MAG_MAGAZINVACUUMOFF : BOOL := FALSE;
        MAG_MAGAZINVACUUMON : BOOL := FALSE;
        MAG_MAGAZINWHITELAMP : BOOL := FALSE;
        MAG_SFCINIT : BOOL := FALSE;
        MAG_SFCRESET : BOOL := FALSE;
        MAG_SLIDERMOVEDOUT : BOOL := FALSE;
        MAG_SLIDERNOTMOVEDOUT : BOOL := FALSE;
        MAG_STARTBUTTONMAGAZIN : BOOL := FALSE;
        MAG_STARTCOMMANDMAGAZIN : BOOL := FALSE;
        MAG_STARTVAR : BOOL := FALSE;
        MAG_WORKPIECEREADY : BOOL := FALSE;
        MAG_2_TRANSIT : BOOL := FALSE;
        MAG_2STATE : STATES_MAGAZIN := STATES_MAGAZIN#INIT;
        MAG_INTERCONNECTMAGAZINSTARTCOMMAND : BOOL := FALSE;
        STAMP_CRANEDOWN : BOOL := FALSE;
        STAMP_CRANEONCONVEYOR : BOOL := FALSE;
        STAMP_CRANEPOSITIONSTAMP : BOOL := FALSE;
        STAMP_CRANESUCKED : BOOL := FALSE;
        STAMP_CRANEUP : BOOL := FALSE;
        STAMP_DURATION : UINT := UINT#0;
        STAMP_SFCINIT : BOOL := FALSE;
        STAMP_SFCRESET : BOOL := FALSE;
        STAMP_STAMPGREENLAMP : BOOL := FALSE;
        STAMP_STAMPLOWERED : BOOL := FALSE;
        STAMP_STAMPPRESSURE : BOOL := FALSE;
        STAMP_STAMPPUSHER : BOOL := FALSE;
        STAMP_STAMPSLIDERFILLED : BOOL := FALSE;
        STAMP_STAMPSLIDERMOVEDIN : BOOL := FALSE;
        STAMP_STAMPSLIDERMOVEDOUT : BOOL := FALSE;
        STAMP_STAMPSLIDERSENSORMOVEDIN : BOOL := FALSE;
        STAMP_STAMPSLIDERSENSORMOVEDOUT : BOOL := FALSE;
        STAMP_STAMPSTARTBUTTON : BOOL := FALSE;
        STAMP_STAMPUP : BOOL := FALSE;
        STAMP_STAMPWHITELAMP : BOOL := FALSE;
        STAMP_STARTCOMMANDSTAMP : BOOL := FALSE;
        STAMP_STARTVAR : BOOL := FALSE;
        STAMP_TIMER_ET : UINT := UINT#0;
        STAMP_TIMER_IN : BOOL := FALSE;
        STAMP_TIMER_PT : UINT := UINT#0;
        STAMP_TIMER_Q : BOOL := FALSE;
        STAMP_2_TRANSIT : BOOL := FALSE;
        STAMP_2STATE : STATES_STAMP := STATES_STAMP#INIT;
        STAMP_INTERCONNECT : BOOL := FALSE;
        STAMP_INTERCONNECTSTAMPSTARTCOMMAND : BOOL := FALSE;
    END_VAR
    
    VAR  
        CRANE_SFCPAUSE : BOOL := FALSE;
        MAG_SFCPAUSE : BOOL := FALSE;
        STAMP_SFCPAUSE : BOOL := FALSE;
    END_VAR
    
    VAR_INPUT  
        SENSOR_CRANEDOWN : BOOL := FALSE;
        SENSOR_CRANEONCONVEYOR : BOOL := FALSE;
        SENSOR_CRANEONMAGAZIN : BOOL := FALSE;
        SENSOR_CRANEPOSITION : BOOL := FALSE;
        SENSOR_CRANEPOSITIONSTAMP : BOOL := FALSE;
        SENSOR_CRANESUCKED : BOOL := FALSE;
        SENSOR_CRANEUP : BOOL := FALSE;
        SENSOR_MAGAZINCAPACITIVESENSOR : BOOL := FALSE;
        SENSOR_MAGAZINEMERGENCYSTOP : BOOL := FALSE;
        SENSOR_MAGAZINOPTICALSENSOR : BOOL := FALSE;
        SENSOR_MAGAZINSWITCHMANUELLAUTOMATIC : BOOL := FALSE;
        SENSOR_SLIDERMOVEDOUT : BOOL := FALSE;
        SENSOR_SLIDERNOTMOVEDOUT : BOOL := FALSE;
        SENSOR_STAMPEMERGENCYSTOP : BOOL := FALSE;
        SENSOR_STAMPLOWERED : BOOL := FALSE;
        SENSOR_STAMPSLIDERFILLED : BOOL := FALSE;
        SENSOR_STAMPSLIDERSENSORMOVEDIN : BOOL := FALSE;
        SENSOR_STAMPSLIDERSENSORMOVEDOUT : BOOL := FALSE;
        SENSOR_STAMPSTARTBUTTON : BOOL := FALSE;
        SENSOR_STAMPSWITCHMANUELLAUTOMATIC : BOOL := FALSE;
        SENSOR_STAMPUP : BOOL := FALSE;
        SENSOR_STARTBUTTONMAGAZIN : BOOL := FALSE;
        SENSOR_WORKPIECEREADY : BOOL := FALSE;
    END_VAR
    
    
    MAG_SLIDERNOTMOVEDOUT := SENSOR_SLIDERNOTMOVEDOUT;
    MAG_SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
    MAG_CRANEONMAGAZIN := SENSOR_CRANEONMAGAZIN;
    MAG_CRANEDOWN := SENSOR_CRANEDOWN;
    MAG_CRANEUP := SENSOR_CRANEUP;
    MAG_CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
    MAG_WORKPIECEREADY := SENSOR_WORKPIECEREADY;
    MAG_STARTBUTTONMAGAZIN := SENSOR_STARTBUTTONMAGAZIN;
    ACTUATOR_MAGAZINSLIDER := MAG_MAGAZINSLIDER;
    ACTUATOR_MAGAZINGREENLAMP := MAG_MAGAZINGREENLAMP;
    CRANE_CRANEUP := SENSOR_CRANEUP;
    CRANE_CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
    CRANE_CRANEDOWN := SENSOR_CRANEDOWN;
    CRANE_CRANESUCKED := SENSOR_CRANESUCKED;
    CRANE_CRANEONMAGAZIN := SENSOR_CRANEONMAGAZIN;
    CRANE_MAGAZINCAPACITIVESENSOR := SENSOR_MAGAZINCAPACITIVESENSOR;
    CRANE_CRANEPOSITIONSTAMP := SENSOR_CRANEPOSITIONSTAMP;
    CRANE_SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
    CRANE_WORKPIECEREADY := SENSOR_WORKPIECEREADY;
    CRANE_STAMPSLIDERFILLED := SENSOR_STAMPSLIDERFILLED;
    CRANE_SLIDERMOVEDOUT := SENSOR_SLIDERMOVEDOUT;
    CRANE_STARTBUTTONMAGAZIN := SENSOR_STARTBUTTONMAGAZIN;
    ACTUATOR_CRANETURNCOUNTERCLOCKWISE := CRANE_CRANETURNCOUNTERCLOCKWISE;
    ACTUATOR_CRANETURNCLOCKWISE := CRANE_CRANETURNCLOCKWISE;
    ACTUATOR_CRANELOWER := CRANE_CRANELOWER;
    ACTUATOR_MAGAZINVACUUMOFF := CRANE_MAGAZINVACUUMOFF;
    ACTUATOR_MAGAZINVACUUMON := CRANE_MAGAZINVACUUMON;
    STAMP_STAMPSLIDERSENSORMOVEDOUT := SENSOR_STAMPSLIDERSENSORMOVEDOUT;
    STAMP_STAMPSLIDERSENSORMOVEDIN := SENSOR_STAMPSLIDERSENSORMOVEDIN;
    STAMP_STAMPSLIDERFILLED := SENSOR_STAMPSLIDERFILLED;
    STAMP_STAMPUP := SENSOR_STAMPUP;
    STAMP_STAMPLOWERED := SENSOR_STAMPLOWERED;
    STAMP_CRANEDOWN := SENSOR_CRANEDOWN;
    STAMP_CRANEUP := SENSOR_CRANEUP;
    STAMP_CRANESUCKED := SENSOR_CRANESUCKED;
    STAMP_CRANEPOSITIONSTAMP := SENSOR_CRANEPOSITIONSTAMP;
    STAMP_CRANEONCONVEYOR := SENSOR_CRANEONCONVEYOR;
    STAMP_STAMPSTARTBUTTON := SENSOR_STAMPSTARTBUTTON;
    ACTUATOR_STAMPSLIDERMOVEDOUT := STAMP_STAMPSLIDERMOVEDOUT;
    ACTUATOR_STAMPSLIDERMOVEDIN := STAMP_STAMPSLIDERMOVEDIN;
    ACTUATOR_STAMPWHITELAMP := STAMP_STAMPWHITELAMP;
    ACTUATOR_STAMPPUSHER := STAMP_STAMPPUSHER;
    ACTUATOR_STAMPGREENLAMP := STAMP_STAMPGREENLAMP;
    ACTUATOR_ANALOGCRANEPRESSURE := INT#6000;
    IF (SENSOR_STAMPEMERGENCYSTOP AND SENSOR_MAGAZINEMERGENCYSTOP) THEN
        (* ! REGION MAG[MAG_SFCINIT, MAG_INTERCONNECTMAGAZINSTARTCOMMAND](MAG_CRANEDOWN, MAG_CRANEONCONVEYOR, MAG_CRANEONMAGAZIN, MAG_CRANESUCKED, MAG_CRANEUP, MAG_SFCRESET, MAG_SLIDERMOVEDOUT, MAG_SLIDERNOTMOVEDOUT, MAG_STARTBUTTONMAGAZIN, MAG_STARTVAR, MAG_WORKPIECEREADY) => (MAG_CRANELOWER, MAG_CRANETURNCLOCKWISE, MAG_CRANETURNCOUNTERCLOCKWISE, MAG_MAGAZINGREENLAMP, MAG_MAGAZINSLIDER, MAG_MAGAZINVACUUMOFF, MAG_MAGAZINVACUUMON, MAG_MAGAZINWHITELAMP, MAG_STARTCOMMANDMAGAZIN)
 *)            IF (MAG_SFCINIT OR MAG_SFCRESET) THEN
                MAG_CRANEDOWN := FALSE;
                MAG_CRANELOWER := FALSE;
                MAG_CRANEONCONVEYOR := FALSE;
                MAG_CRANEONMAGAZIN := FALSE;
                MAG_CRANESUCKED := FALSE;
                MAG_CRANETURNCLOCKWISE := FALSE;
                MAG_CRANETURNCOUNTERCLOCKWISE := FALSE;
                MAG_CRANEUP := FALSE;
                MAG_MAGAZINGREENLAMP := FALSE;
                MAG_MAGAZINSLIDER := FALSE;
                MAG_MAGAZINVACUUMOFF := FALSE;
                MAG_MAGAZINVACUUMON := FALSE;
                MAG_MAGAZINWHITELAMP := FALSE;
                MAG_SFCINIT := FALSE;
                MAG_SFCRESET := FALSE;
                MAG_SLIDERMOVEDOUT := FALSE;
                MAG_SLIDERNOTMOVEDOUT := FALSE;
                MAG_STARTBUTTONMAGAZIN := FALSE;
                MAG_STARTCOMMANDMAGAZIN := FALSE;
                MAG_STARTVAR := FALSE;
                MAG_WORKPIECEREADY := FALSE;
                MAG_2_TRANSIT := FALSE;
                MAG_2STATE := STATES_MAGAZIN#INIT;
                MAG_INTERCONNECTMAGAZINSTARTCOMMAND := FALSE;
            END_IF;
            IF NOT (MAG_SFCINIT OR MAG_SFCPAUSE) THEN
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                CASE MAG_2STATE OF 
                    STATES_MAGAZIN#INIT:
                        MAG_2_TRANSIT := FALSE;
                        IF TRUE THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#START_MAGAZIN;
                        END_IF;
                    
                    STATES_MAGAZIN#START_MAGAZIN:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: START_MAGAZIN_ACTIVE
 *)
                        MAG_MAGAZINSLIDER := FALSE;
                        MAG_MAGAZINGREENLAMP := FALSE;
                        MAG_STARTVAR := FALSE;
                        MAG_STARTCOMMANDMAGAZIN := FALSE;
                        IF (MAG_STARTBUTTONMAGAZIN = TRUE) THEN
                            MAG_INTERCONNECTMAGAZINSTARTCOMMAND := TRUE;
                        END_IF;
                        (* END OF ACTION CALL: START_MAGAZIN_ACTIVE
 *)
                        IF MAG_INTERCONNECTMAGAZINSTARTCOMMAND THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#GREEN_LAMP;
                        END_IF;
                    
                    STATES_MAGAZIN#GREEN_LAMP:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: GREEN_LAMP_ACTIVE
 *)
                        MAG_MAGAZINGREENLAMP := TRUE;
                        MAG_INTERCONNECTMAGAZINSTARTCOMMAND := FALSE;
                        (* END OF ACTION CALL: GREEN_LAMP_ACTIVE
 *)
                        IF TRUE THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#MAGAZIN_INIT;
                        END_IF;
                    
                    STATES_MAGAZIN#MAGAZIN_INIT:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: MAGAZIN_INIT_ACTIVE
 *)
                        MAG_MAGAZINSLIDER := TRUE;
                        (* END OF ACTION CALL: MAGAZIN_INIT_ACTIVE
 *)
                        IF TRUE THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#MAGAZIN_INIT_2;
                        END_IF;
                    
                    STATES_MAGAZIN#MAGAZIN_INIT_2:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: MAGAZIN_INIT_2_ACTIVE
 *)
                        MAG_MAGAZINSLIDER := FALSE;
                        (* END OF ACTION CALL: MAGAZIN_INIT_2_ACTIVE
 *)
                        IF TRUE THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#INTERSTEP;
                        END_IF;
                    
                    STATES_MAGAZIN#INTERSTEP:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: INTERSTEP_ACTIVE
 *)
                        MAG_STARTCOMMANDMAGAZIN := TRUE;
                        (* END OF ACTION CALL: INTERSTEP_ACTIVE
 *)
                        IF MAG_STARTVAR THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#CONVEY;
                        END_IF;
                    
                    STATES_MAGAZIN#CONVEY:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CONVEY_ACTIVE
 *)
                        IF MAG_SLIDERNOTMOVEDOUT THEN
                            MAG_MAGAZINSLIDER := TRUE;
                        END_IF;
                        (* END OF ACTION CALL: CONVEY_ACTIVE
 *)
                        IF MAG_CRANEONMAGAZIN THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#STEP0;
                        END_IF;
                    
                    STATES_MAGAZIN#STEP0:
                        MAG_2_TRANSIT := FALSE;
                        IF MAG_CRANEDOWN THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#SLIDER_MOVE_BACK;
                        END_IF;
                    
                    STATES_MAGAZIN#SLIDER_MOVE_BACK:
                        MAG_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: SLIDERMOVEBACK_ACTIVE
 *)
                        IF ((MAG_SLIDERMOVEDOUT = TRUE) AND (MAG_SLIDERNOTMOVEDOUT = FALSE)) THEN
                            MAG_MAGAZINSLIDER := FALSE;
                        END_IF;
                        (* END OF ACTION CALL: SLIDERMOVEBACK_ACTIVE
 *)
                        IF MAG_CRANEUP THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#STEP1;
                        END_IF;
                    
                    STATES_MAGAZIN#STEP1:
                        MAG_2_TRANSIT := FALSE;
                        IF MAG_CRANEONCONVEYOR THEN
                            MAG_2_TRANSIT := TRUE;
                            MAG_2STATE := STATES_MAGAZIN#INTERSTEP;
                        END_IF;
                    
                                    END_CASE;
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
            END_IF;
            (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
        (* ! END_REGION
 *)        (* ! REGION CRANE[CRANE_DURATION1, CRANE_SFCINIT, CRANE_TIMEDELAY_TIMER_ET, CRANE_TIMEDELAY_TIMER_IN, CRANE_TIMEDELAY_TIMER_PT, CRANE_TIMEDELAY_TIMER_Q, CRANE_TIMEDELAY_TIMER_DURATION, CRANE_TIMEDELAY_TIMER_INTERCONNECT, CRANE_TIMER1_ET, CRANE_TIMER1_IN, CRANE_TIMER1_PT, CRANE_TIMER1_Q, CRANE_ACTUALTIME1, CRANE_INTERCONNECT, CRANE_INTERCONNECTCRANESTARTCOMMAND](CRANE_CRANEDOWN, CRANE_CRANEONCONVEYOR, CRANE_CRANEONMAGAZIN, CRANE_CRANEPOSITIONSTAMP, CRANE_CRANESUCKED, CRANE_CRANEUP, CRANE_MAGAZINCAPACITIVESENSOR, CRANE_SFCRESET, CRANE_SLIDERMOVEDOUT, CRANE_SLIDERNOTMOVEDOUT, CRANE_STAMPLOWERED, CRANE_STAMPSLIDERFILLED, CRANE_STARTBUTTONMAGAZIN, CRANE_STARTVAR, CRANE_WORKPIECEREADY) => (CRANE_CRANELOWER, CRANE_CRANETURNCLOCKWISE, CRANE_CRANETURNCOUNTERCLOCKWISE, CRANE_MAGAZINVACUUMOFF, CRANE_MAGAZINVACUUMON, CRANE_STARTCOMMANDCRANE)
 *)            IF (CRANE_SFCINIT OR CRANE_SFCRESET) THEN
                CRANE_CRANEDOWN := FALSE;
                CRANE_CRANELOWER := FALSE;
                CRANE_CRANEONCONVEYOR := FALSE;
                CRANE_CRANEONMAGAZIN := FALSE;
                CRANE_CRANEPOSITIONSTAMP := FALSE;
                CRANE_CRANESUCKED := FALSE;
                CRANE_CRANETURNCLOCKWISE := FALSE;
                CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                CRANE_CRANEUP := FALSE;
                CRANE_DURATION1 := UINT#375;
                CRANE_MAGAZINCAPACITIVESENSOR := FALSE;
                CRANE_MAGAZINVACUUMOFF := FALSE;
                CRANE_MAGAZINVACUUMON := FALSE;
                CRANE_SFCINIT := FALSE;
                CRANE_SFCRESET := FALSE;
                CRANE_SLIDERMOVEDOUT := FALSE;
                CRANE_SLIDERNOTMOVEDOUT := FALSE;
                CRANE_STAMPLOWERED := FALSE;
                CRANE_STAMPSLIDERFILLED := FALSE;
                CRANE_STARTBUTTONMAGAZIN := FALSE;
                CRANE_STARTCOMMANDCRANE := FALSE;
                CRANE_STARTVAR := FALSE;
                CRANE_TIMEDELAY_TIMER_ET := UINT#0;
                CRANE_TIMEDELAY_TIMER_IN := FALSE;
                CRANE_TIMEDELAY_TIMER_PT := UINT#0;
                CRANE_TIMEDELAY_TIMER_Q := FALSE;
                CRANE_TIMEDELAY_TIMER_DURATION := UINT#12;
                CRANE_TIMEDELAY_TIMER_INTERCONNECT := FALSE;
                CRANE_TIMER1_ET := UINT#0;
                CRANE_TIMER1_IN := FALSE;
                CRANE_TIMER1_PT := UINT#0;
                CRANE_TIMER1_Q := FALSE;
                CRANE_WORKPIECEREADY := FALSE;
                CRANE_2_TRANSIT := FALSE;
                CRANE_2STATE := STATES_CRANE#INIT;
                CRANE_ACTUALTIME1 := UINT#0;
                CRANE_INTERCONNECT := FALSE;
                CRANE_INTERCONNECTCRANESTARTCOMMAND := FALSE;
            END_IF;
            IF NOT (CRANE_SFCINIT OR CRANE_SFCPAUSE) THEN
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                CASE CRANE_2STATE OF 
                    STATES_CRANE#INIT:
                        CRANE_2_TRANSIT := FALSE;
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#START_CRANE;
                        END_IF;
                    
                    STATES_CRANE#START_CRANE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: START_CRANE_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        CRANE_MAGAZINVACUUMOFF := TRUE;
                        CRANE_MAGAZINVACUUMON := FALSE;
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        CRANE_STARTVAR := FALSE;
                        CRANE_STARTCOMMANDCRANE := FALSE;
                        IF (CRANE_STARTBUTTONMAGAZIN = TRUE) THEN
                            CRANE_INTERCONNECTCRANESTARTCOMMAND := TRUE;
                        END_IF;
                        (* END OF ACTION CALL: START_CRANE_ACTIVE
 *)
                        IF CRANE_INTERCONNECTCRANESTARTCOMMAND THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_INIT;
                        END_IF;
                    
                    STATES_CRANE#CRANE_INIT:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_INIT_ACTIVE
 *)
                        CRANE_CRANELOWER := TRUE;
                        CRANE_INTERCONNECTCRANESTARTCOMMAND := FALSE;
                        (* END OF ACTION CALL: CRANE_INIT_ACTIVE
 *)
                        IF CRANE_CRANEDOWN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_INIT_2;
                        END_IF;
                    
                    STATES_CRANE#CRANE_INIT_2:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_INIT_2_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANE_INIT_2_ACTIVE
 *)
                        IF CRANE_CRANEUP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#INTERSTEP;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: INTERSTEP_ACTIVE
 *)
                        CRANE_STARTCOMMANDCRANE := TRUE;
                        (* END OF ACTION CALL: INTERSTEP_ACTIVE
 *)
                        IF CRANE_STARTVAR THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#INTERSTEP_2;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP_2:
                        CRANE_2_TRANSIT := FALSE;
                        IF CRANE_SLIDERMOVEDOUT THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#TIMEDELAY;
                        END_IF;
                    
                    STATES_CRANE#TIMEDELAY:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: TIMEDELAY_ACTIVE
 *)
                        CRANE_TIMEDELAY_TIMER_IN := TRUE;
                        CRANE_TIMEDELAY_TIMER_PT := CRANE_TIMEDELAY_TIMER_DURATION;
                        (* ! REGION TIMEDELAY_TIMER[](CRANE_TIMEDELAY_TIMER_IN, CRANE_TIMEDELAY_TIMER_PT) => (CRANE_TIMEDELAY_TIMER_ET, CRANE_TIMEDELAY_TIMER_Q)
 *)                            IF CRANE_TIMEDELAY_TIMER_IN THEN
                                CRANE_TIMEDELAY_TIMER_Q := (CRANE_TIMEDELAY_TIMER_ET = UINT#0);
                                IF (CRANE_TIMEDELAY_TIMER_ET > UINT#0) THEN
                                    CRANE_TIMEDELAY_TIMER_ET := (CRANE_TIMEDELAY_TIMER_ET - UINT#1);
                                ELSE
                                    CRANE_TIMEDELAY_TIMER_ET := UINT#0;
                                END_IF;
                            ELSE
                                CRANE_TIMEDELAY_TIMER_Q := FALSE;
                                CRANE_TIMEDELAY_TIMER_ET := CRANE_TIMEDELAY_TIMER_PT;
                            END_IF;
                        (* ! END_REGION
 *)                        CRANE_TIMEDELAY_TIMER_INTERCONNECT := CRANE_TIMEDELAY_TIMER_Q;
                        (* END OF ACTION CALL: TIMEDELAY_ACTIVE
 *)
                        IF CRANE_TIMEDELAY_TIMER_INTERCONNECT THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#TURN_RIGHT;
                        END_IF;
                    
                    STATES_CRANE#TURN_RIGHT:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STEP0_ACTIVE
 *)
                        CRANE_CRANETURNCLOCKWISE := TRUE;
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        (* END OF ACTION CALL: STEP0_ACTIVE
 *)
                        IF CRANE_CRANEONMAGAZIN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#INTERSTEP_CHECK_WORKPIECE;
                        END_IF;
                    
                    STATES_CRANE#INTERSTEP_CHECK_WORKPIECE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: INTERSTEP_CHECK_WORKPIECE_ACTIVE
 *)
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        (* END OF ACTION CALL: INTERSTEP_CHECK_WORKPIECE_ACTIVE
 *)
                        IF CRANE_WORKPIECEREADY THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_LOWER;
                        ELSIF (NOT CRANE_WORKPIECEREADY AND CRANE_STAMPSLIDERFILLED) THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#WAIT_AT_STAMP;
                        ELSIF (NOT CRANE_WORKPIECEREADY AND NOT CRANE_STAMPSLIDERFILLED) THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#STEP2;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LOWER:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: MAGAZINSTOP_ACTIVE
 *)
                        CRANE_MAGAZINVACUUMON := TRUE;
                        CRANE_MAGAZINVACUUMOFF := FALSE;
                        CRANE_CRANELOWER := TRUE;
                        (* END OF ACTION CALL: MAGAZINSTOP_ACTIVE
 *)
                        IF CRANE_CRANESUCKED THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#STEP0;
                        END_IF;
                    
                    STATES_CRANE#STEP0:
                        CRANE_2_TRANSIT := FALSE;
                        IF NOT CRANE_MAGAZINCAPACITIVESENSOR THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_LIFT_MAGAZIN;
                        ELSIF CRANE_MAGAZINCAPACITIVESENSOR THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_LIFT_MAGAZIN_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZIN:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANELIFTMAGAZIN_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANELIFTMAGAZIN_ACTIVE
 *)
                        IF CRANE_CRANEUP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_NOT_METALLIC:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANETURNLEFT_ACTIVE
 *)
                        CRANE_CRANETURNCOUNTERCLOCKWISE := TRUE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        (* END OF ACTION CALL: CRANETURNLEFT_ACTIVE
 *)
                        IF CRANE_CRANEONCONVEYOR THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_ON_CONVEYOR;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANEONCONVEYOR_ACTIVE
 *)
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        CRANE_CRANELOWER := TRUE;
                        (* END OF ACTION CALL: CRANEONCONVEYOR_ACTIVE
 *)
                        IF CRANE_CRANEDOWN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#RELEASE;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_MAGAZIN_METALLIC:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_LIFT_MAGAZIN_METALLIC_ACTIVE_0
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANE_LIFT_MAGAZIN_METALLIC_ACTIVE_0
 *)
                        IF CRANE_CRANEUP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_TURN_LEFT_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_METALLIC:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_TURN_LEFT_METALLIC_ACTIVE
 *)
                        CRANE_CRANETURNCOUNTERCLOCKWISE := TRUE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        (* END OF ACTION CALL: CRANE_TURN_LEFT_METALLIC_ACTIVE
 *)
                        IF CRANE_CRANEPOSITIONSTAMP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_ON_STAMP_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_STAMP_METALLIC:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_ON_CONVEYOR_METALLIC_ACTIVE
 *)
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        CRANE_CRANELOWER := TRUE;
                        (* END OF ACTION CALL: CRANE_ON_CONVEYOR_METALLIC_ACTIVE
 *)
                        IF CRANE_CRANEDOWN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#RELEASE_WORKPIECE;
                        END_IF;
                    
                    STATES_CRANE#RELEASE_WORKPIECE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: RELEASE_WORKPIECE_ACTIVE
 *)
                        CRANE_MAGAZINVACUUMOFF := TRUE;
                        CRANE_MAGAZINVACUUMON := FALSE;
                        (* END OF ACTION CALL: RELEASE_WORKPIECE_ACTIVE
 *)
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_GO_UP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_GO_UP:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_GO_UP_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANE_GO_UP_ACTIVE
 *)
                        IF CRANE_CRANEUP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#PAUSE;
                        END_IF;
                    
                    STATES_CRANE#PAUSE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: PAUSE_ACTIVE
 *)
                        CRANE_TIMER1_IN := CRANE_CRANEUP;
                        CRANE_TIMER1_PT := CRANE_DURATION1;
                        (* ! REGION TIMER1[](CRANE_TIMER1_IN, CRANE_TIMER1_PT) => (CRANE_TIMER1_ET, CRANE_TIMER1_Q)
 *)                            IF CRANE_TIMER1_IN THEN
                                CRANE_TIMER1_Q := (CRANE_TIMER1_ET = UINT#0);
                                IF (CRANE_TIMER1_ET > UINT#0) THEN
                                    CRANE_TIMER1_ET := (CRANE_TIMER1_ET - UINT#1);
                                ELSE
                                    CRANE_TIMER1_ET := UINT#0;
                                END_IF;
                            ELSE
                                CRANE_TIMER1_Q := FALSE;
                                CRANE_TIMER1_ET := CRANE_TIMER1_PT;
                            END_IF;
                        (* ! END_REGION
 *)                        CRANE_INTERCONNECT := CRANE_TIMER1_Q;
                        (* END OF ACTION CALL: PAUSE_ACTIVE
 *)
                        IF CRANE_INTERCONNECT THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#RESET_INTERCONNECT;
                        END_IF;
                    
                    STATES_CRANE#RESET_INTERCONNECT:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: RESET_INTERCONNECT_ACTIVE
 *)
                        CRANE_INTERCONNECT := FALSE;
                        CRANE_TIMER1_IN := FALSE;
                        CRANE_TIMER1_PT := UINT#0;
                        (* ! REGION TIMER1[](CRANE_TIMER1_IN, CRANE_TIMER1_PT) => (CRANE_TIMER1_ET, CRANE_TIMER1_Q)
 *)                            IF CRANE_TIMER1_IN THEN
                                CRANE_TIMER1_Q := (CRANE_TIMER1_ET = UINT#0);
                                IF (CRANE_TIMER1_ET > UINT#0) THEN
                                    CRANE_TIMER1_ET := (CRANE_TIMER1_ET - UINT#1);
                                ELSE
                                    CRANE_TIMER1_ET := UINT#0;
                                END_IF;
                            ELSE
                                CRANE_TIMER1_Q := FALSE;
                                CRANE_TIMER1_ET := CRANE_TIMER1_PT;
                            END_IF;
                        (* ! END_REGION
 *)                        (* END OF ACTION CALL: RESET_INTERCONNECT_ACTIVE
 *)
                        IF CRANE_SLIDERMOVEDOUT THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#LOWER_CRANE;
                        END_IF;
                    
                    STATES_CRANE#LOWER_CRANE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: LOWER_CRANE_ACTIVE
 *)
                        CRANE_CRANELOWER := TRUE;
                        (* END OF ACTION CALL: LOWER_CRANE_ACTIVE
 *)
                        IF CRANE_CRANEDOWN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#SUCK_AT_STAMP;
                        END_IF;
                    
                    STATES_CRANE#SUCK_AT_STAMP:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: SUCK_AT_STAMP_ACTIVE
 *)
                        CRANE_MAGAZINVACUUMON := TRUE;
                        CRANE_MAGAZINVACUUMOFF := FALSE;
                        (* END OF ACTION CALL: SUCK_AT_STAMP_ACTIVE
 *)
                        IF CRANE_CRANESUCKED THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_LIFT_AT_STAMP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_AT_STAMP:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_LIFT_AT_STAMP_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANE_LIFT_AT_STAMP_ACTIVE
 *)
                        IF CRANE_CRANEUP THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_TURN_LEFT_FROM_STAMP;
                        END_IF;
                    
                    STATES_CRANE#CRANE_TURN_LEFT_FROM_STAMP:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_TURN_LEFT_FROM_STAMP_ACTIVE
 *)
                        CRANE_CRANETURNCLOCKWISE := TRUE;
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        (* END OF ACTION CALL: CRANE_TURN_LEFT_FROM_STAMP_ACTIVE
 *)
                        IF CRANE_CRANEONCONVEYOR THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC;
                        END_IF;
                    
                    STATES_CRANE#CRANE_ON_CONVEYOR_METALLIC:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANE_ON_CONVEYOR_METALLIC_ACTIVE_0
 *)
                        CRANE_CRANETURNCOUNTERCLOCKWISE := FALSE;
                        CRANE_CRANETURNCLOCKWISE := FALSE;
                        CRANE_CRANELOWER := TRUE;
                        (* END OF ACTION CALL: CRANE_ON_CONVEYOR_METALLIC_ACTIVE_0
 *)
                        IF CRANE_CRANEDOWN THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#RELEASE;
                        END_IF;
                    
                    STATES_CRANE#RELEASE:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: RELEASE_ACTIVE
 *)
                        CRANE_MAGAZINVACUUMOFF := TRUE;
                        CRANE_MAGAZINVACUUMON := FALSE;
                        (* END OF ACTION CALL: RELEASE_ACTIVE
 *)
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#CRANE_LIFT_CONVEYOR;
                        END_IF;
                    
                    STATES_CRANE#CRANE_LIFT_CONVEYOR:
                        CRANE_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: CRANELIFTCONVEYOR_ACTIVE
 *)
                        CRANE_CRANELOWER := FALSE;
                        (* END OF ACTION CALL: CRANELIFTCONVEYOR_ACTIVE
 *)
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#INTERSTEP;
                        END_IF;
                    
                    STATES_CRANE#WAIT_AT_STAMP:
                        CRANE_2_TRANSIT := FALSE;
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#PAUSE;
                        END_IF;
                    
                    STATES_CRANE#STEP2:
                        CRANE_2_TRANSIT := FALSE;
                        IF TRUE THEN
                            CRANE_2_TRANSIT := TRUE;
                            CRANE_2STATE := STATES_CRANE#START_CRANE;
                        END_IF;
                    
                                    END_CASE;
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
            END_IF;
            (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
        (* ! END_REGION
 *)        (* ! REGION STAMP[STAMP_DURATION, STAMP_SFCINIT, STAMP_TIMER_ET, STAMP_TIMER_IN, STAMP_TIMER_PT, STAMP_TIMER_Q, STAMP_INTERCONNECT, STAMP_INTERCONNECTSTAMPSTARTCOMMAND](STAMP_CRANEDOWN, STAMP_CRANEONCONVEYOR, STAMP_CRANEPOSITIONSTAMP, STAMP_CRANESUCKED, STAMP_CRANEUP, STAMP_SFCRESET, STAMP_STAMPLOWERED, STAMP_STAMPSLIDERFILLED, STAMP_STAMPSLIDERSENSORMOVEDIN, STAMP_STAMPSLIDERSENSORMOVEDOUT, STAMP_STAMPSTARTBUTTON, STAMP_STAMPUP, STAMP_STARTVAR) => (STAMP_STAMPGREENLAMP, STAMP_STAMPPRESSURE, STAMP_STAMPPUSHER, STAMP_STAMPSLIDERMOVEDIN, STAMP_STAMPSLIDERMOVEDOUT, STAMP_STAMPWHITELAMP, STAMP_STARTCOMMANDSTAMP)
 *)            IF (STAMP_SFCINIT OR STAMP_SFCRESET) THEN
                STAMP_CRANEDOWN := FALSE;
                STAMP_CRANEONCONVEYOR := FALSE;
                STAMP_CRANEPOSITIONSTAMP := FALSE;
                STAMP_CRANESUCKED := FALSE;
                STAMP_CRANEUP := FALSE;
                STAMP_DURATION := UINT#125;
                STAMP_SFCINIT := FALSE;
                STAMP_SFCRESET := FALSE;
                STAMP_STAMPGREENLAMP := FALSE;
                STAMP_STAMPLOWERED := FALSE;
                STAMP_STAMPPRESSURE := FALSE;
                STAMP_STAMPPUSHER := FALSE;
                STAMP_STAMPSLIDERFILLED := FALSE;
                STAMP_STAMPSLIDERMOVEDIN := FALSE;
                STAMP_STAMPSLIDERMOVEDOUT := FALSE;
                STAMP_STAMPSLIDERSENSORMOVEDIN := FALSE;
                STAMP_STAMPSLIDERSENSORMOVEDOUT := FALSE;
                STAMP_STAMPSTARTBUTTON := FALSE;
                STAMP_STAMPUP := FALSE;
                STAMP_STAMPWHITELAMP := FALSE;
                STAMP_STARTCOMMANDSTAMP := FALSE;
                STAMP_STARTVAR := FALSE;
                STAMP_TIMER_ET := UINT#0;
                STAMP_TIMER_IN := FALSE;
                STAMP_TIMER_PT := UINT#0;
                STAMP_TIMER_Q := FALSE;
                STAMP_2_TRANSIT := FALSE;
                STAMP_2STATE := STATES_STAMP#INIT;
                STAMP_INTERCONNECT := FALSE;
                STAMP_INTERCONNECTSTAMPSTARTCOMMAND := FALSE;
            END_IF;
            IF NOT (STAMP_SFCINIT OR STAMP_SFCPAUSE) THEN
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.INTRODUCESTATEENUMVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_INTRODUCETRANSITVARIABLE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                CASE STAMP_2STATE OF 
                    STATES_STAMP#INIT:
                        STAMP_2_TRANSIT := FALSE;
                        IF TRUE THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#START_STAMP;
                        END_IF;
                    
                    STATES_STAMP#START_STAMP:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: START_STAMP_ACTIVE
 *)
                        STAMP_STAMPSLIDERMOVEDOUT := FALSE;
                        STAMP_STAMPSLIDERMOVEDIN := FALSE;
                        STAMP_STAMPPUSHER := FALSE;
                        STAMP_STAMPGREENLAMP := FALSE;
                        STAMP_STAMPPRESSURE := FALSE;
                        STAMP_STARTCOMMANDSTAMP := FALSE;
                        IF (STAMP_STAMPSTARTBUTTON = TRUE) THEN
                            STAMP_INTERCONNECTSTAMPSTARTCOMMAND := TRUE;
                        END_IF;
                        (* END OF ACTION CALL: START_STAMP_ACTIVE
 *)
                        IF STAMP_INTERCONNECTSTAMPSTARTCOMMAND THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#GREEN_LAMP;
                        END_IF;
                    
                    STATES_STAMP#GREEN_LAMP:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: GREEN_LAMP_ACTIVE
 *)
                        STAMP_STAMPGREENLAMP := TRUE;
                        STAMP_INTERCONNECTSTAMPSTARTCOMMAND := FALSE;
                        (* END OF ACTION CALL: GREEN_LAMP_ACTIVE
 *)
                        IF TRUE THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMP_INIT_1;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_1:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMP_INIT_1_ACTIVE
 *)
                        STAMP_STAMPSLIDERMOVEDIN := TRUE;
                        STAMP_STAMPSLIDERMOVEDOUT := FALSE;
                        (* END OF ACTION CALL: STAMP_INIT_1_ACTIVE
 *)
                        IF STAMP_STAMPSLIDERSENSORMOVEDIN THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMP_INIT_2;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_2:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMP_INIT_2_ACTIVE
 *)
                        STAMP_STAMPSLIDERMOVEDIN := FALSE;
                        STAMP_STAMPSLIDERMOVEDOUT := TRUE;
                        (* END OF ACTION CALL: STAMP_INIT_2_ACTIVE
 *)
                        IF STAMP_STAMPSLIDERSENSORMOVEDOUT THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMP_INIT_3;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_3:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMP_INIT_3_ACTIVE
 *)
                        STAMP_STAMPPUSHER := TRUE;
                        (* END OF ACTION CALL: STAMP_INIT_3_ACTIVE
 *)
                        IF STAMP_STAMPLOWERED THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMP_INIT_4;
                        END_IF;
                    
                    STATES_STAMP#STAMP_INIT_4:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMP_INIT_4_ACTIVE
 *)
                        STAMP_STAMPPUSHER := FALSE;
                        (* END OF ACTION CALL: STAMP_INIT_4_ACTIVE
 *)
                        IF STAMP_STAMPUP THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#INTERSTEP;
                        END_IF;
                    
                    STATES_STAMP#INTERSTEP:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: INTERSTEP_ACTIVE
 *)
                        STAMP_STARTCOMMANDSTAMP := TRUE;
                        (* END OF ACTION CALL: INTERSTEP_ACTIVE
 *)
                        IF STAMP_STARTVAR THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#INTERSTEP_2;
                        END_IF;
                    
                    STATES_STAMP#INTERSTEP_2:
                        STAMP_2_TRANSIT := FALSE;
                        IF STAMP_STAMPSLIDERFILLED THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STEP0;
                        END_IF;
                    
                    STATES_STAMP#STEP0:
                        STAMP_2_TRANSIT := FALSE;
                        IF STAMP_CRANEUP THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMPSLIDERBACK;
                        END_IF;
                    
                    STATES_STAMP#STAMPSLIDERBACK:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMPSLIDERBACK_ACTIVE
 *)
                        STAMP_STAMPSLIDERMOVEDIN := TRUE;
                        STAMP_STAMPSLIDERMOVEDOUT := FALSE;
                        (* END OF ACTION CALL: STAMPSLIDERBACK_ACTIVE
 *)
                        IF STAMP_STAMPSLIDERSENSORMOVEDIN THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMPPROCESS;
                        END_IF;
                    
                    STATES_STAMP#STAMPPROCESS:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMPPROCESS_ACTIVE
 *)
                        STAMP_STAMPSLIDERMOVEDIN := FALSE;
                        STAMP_STAMPPUSHER := TRUE;
                        (* END OF ACTION CALL: STAMPPROCESS_ACTIVE
 *)
                        IF STAMP_STAMPLOWERED THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STEP1;
                        END_IF;
                    
                    STATES_STAMP#STEP1:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STEP1_ACTIVE
 *)
                        STAMP_TIMER_IN := STAMP_STAMPLOWERED;
                        STAMP_TIMER_PT := UINT#0;
                        (* ! REGION TIMER[](STAMP_TIMER_IN, STAMP_TIMER_PT) => (STAMP_TIMER_ET, STAMP_TIMER_Q)
 *)                            IF STAMP_TIMER_IN THEN
                                STAMP_TIMER_Q := (STAMP_TIMER_ET = UINT#0);
                                IF (STAMP_TIMER_ET > UINT#0) THEN
                                    STAMP_TIMER_ET := (STAMP_TIMER_ET - UINT#1);
                                ELSE
                                    STAMP_TIMER_ET := UINT#0;
                                END_IF;
                            ELSE
                                STAMP_TIMER_Q := FALSE;
                                STAMP_TIMER_ET := STAMP_TIMER_PT;
                            END_IF;
                        (* ! END_REGION
 *)                        STAMP_INTERCONNECT := STAMP_TIMER_Q;
                        (* END OF ACTION CALL: STEP1_ACTIVE
 *)
                        IF STAMP_INTERCONNECT THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STAMPSLIDERFORWARD;
                        END_IF;
                    
                    STATES_STAMP#STAMPSLIDERFORWARD:
                        STAMP_2_TRANSIT := FALSE;
                        (* CALL OF ACTION: STAMPSLIDERFORWARD_ACTIVE
 *)
                        STAMP_STAMPPUSHER := FALSE;
                        STAMP_STAMPSLIDERMOVEDOUT := TRUE;
                        IF ((STAMP_STAMPLOWERED = FALSE) AND (STAMP_STAMPUP = TRUE)) THEN
                            STAMP_INTERCONNECT := FALSE;
                        END_IF;
                        STAMP_TIMER_IN := FALSE;
                        STAMP_TIMER_PT := UINT#0;
                        (* ! REGION TIMER[](STAMP_TIMER_IN, STAMP_TIMER_PT) => (STAMP_TIMER_ET, STAMP_TIMER_Q)
 *)                            IF STAMP_TIMER_IN THEN
                                STAMP_TIMER_Q := (STAMP_TIMER_ET = UINT#0);
                                IF (STAMP_TIMER_ET > UINT#0) THEN
                                    STAMP_TIMER_ET := (STAMP_TIMER_ET - UINT#1);
                                ELSE
                                    STAMP_TIMER_ET := UINT#0;
                                END_IF;
                            ELSE
                                STAMP_TIMER_Q := FALSE;
                                STAMP_TIMER_ET := STAMP_TIMER_PT;
                            END_IF;
                        (* ! END_REGION
 *)                        (* END OF ACTION CALL: STAMPSLIDERFORWARD_ACTIVE
 *)
                        IF STAMP_STAMPSLIDERMOVEDOUT THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#STEP2;
                        END_IF;
                    
                    STATES_STAMP#STEP2:
                        STAMP_2_TRANSIT := FALSE;
                        IF (STAMP_CRANEONCONVEYOR AND NOT STAMP_STAMPSLIDERFILLED) THEN
                            STAMP_2_TRANSIT := TRUE;
                            STAMP_2STATE := STATES_STAMP#INTERSTEP;
                        END_IF;
                    
                                    END_CASE;
                (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.TRANSLATIONSFCTOSTOLD_THEBIGSTATECASE
 *)
                (* RUNNING PIPELINE STEP: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
            END_IF;
            (* END OF: EDU.KIT.ITI.FORMAL.AUTOMATION.ST.SFCFLAGINTRODUCTION
 *)
        (* ! END_REGION
 *)        IF (ACTUATOR_MAGAZINGREENLAMP AND ACTUATOR_STAMPGREENLAMP) THEN
            IF ((STAMP_STARTCOMMANDSTAMP AND CRANE_STARTCOMMANDCRANE) AND MAG_STARTCOMMANDMAGAZIN) THEN
                CRANE_STARTVAR := TRUE;
                MAG_STARTVAR := TRUE;
                STAMP_STARTVAR := TRUE;
            END_IF;
        END_IF;
        CRANE_SFCRESET := FALSE;
        MAG_SFCRESET := FALSE;
        STAMP_SFCRESET := FALSE;
    ELSIF (NOT SENSOR_STAMPEMERGENCYSTOP OR NOT SENSOR_MAGAZINEMERGENCYSTOP) THEN
        ACTUATOR_MAGAZINSLIDER := FALSE;
        ACTUATOR_CRANELOWER := FALSE;
        ACTUATOR_MAGAZINVACUUMON := FALSE;
        ACTUATOR_MAGAZINVACUUMOFF := TRUE;
        ACTUATOR_MAGAZINGREENLAMP := FALSE;
        ACTUATOR_CRANETURNCOUNTERCLOCKWISE := FALSE;
        ACTUATOR_CRANETURNCLOCKWISE := FALSE;
        ACTUATOR_STAMPSLIDERMOVEDOUT := TRUE;
        ACTUATOR_STAMPSLIDERMOVEDIN := FALSE;
        ACTUATOR_STAMPGREENLAMP := FALSE;
        ACTUATOR_STAMPPUSHER := FALSE;
        ACTUATOR_ANALOGCRANEPRESSURE := INT#0;
        CRANE_SFCRESET := TRUE;
        MAG_SFCRESET := TRUE;
        STAMP_SFCRESET := TRUE;
        CRANE_STARTVAR := FALSE;
        MAG_STARTVAR := FALSE;
        STAMP_STARTVAR := FALSE;
    END_IF;
END_PROGRAM


CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK TASK0(INTERVAL := T#50MS, PRIORITY := 0);
    PROGRAM INSTANCE0 WITH TASK0 : MAIN;
  END_RESOURCE
END_CONFIGURATION
