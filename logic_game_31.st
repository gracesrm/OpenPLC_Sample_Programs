PROGRAM PLC_PRG 
    VAR_EXTERNAL    
        (* Inputs *) 
        PB1 : BOOL;
        PB2 : BOOL;
        PB3 : BOOL;
        PB4 : BOOL;
        PB5 : BOOL;
        PB6 : BOOL;
        PBStart : BOOL; 
        (* Outputs *) 
        Out1 : BOOL;
        Out2 : BOOL;
        Out3 : BOOL;
        Out4 : BOOL;
        Out5 : BOOL;
        Out6 : BOOL;
        PLCWin : BOOL;
        ManWin : BOOL;
        Turn : BOOL; 
    END_VAR 

    VAR 
        V1 : UINT := 4;
        V2 : UINT := 4;
        V3 : UINT := 4;
        V4 : UINT := 4;
        V5 : UINT := 4;
        V6 : UINT := 4;
        _V1 : UINT := 4;
        _V2 : UINT := 4;
        _V3 : UINT := 4;
        _V4 : UINT := 4;
        _V5 : UINT := 4;
        _V6 : UINT := 4; 
        Mv : BOOL; 
        Mv1 : BOOL;
        Mv2 : BOOL;
        Mv3 : BOOL;
        Mv4 : BOOL;
        Mv5 : BOOL;
        Mv6 : BOOL; 
        Sum : UINT; 
        _Sum : UINT; 
        Skp : BOOL;
        Lck : BOOL; 
        _Lck : BOOL; 
        Rst : BOOL;
        _Rst : BOOL;
        _Turn : BOOL;
        _PLCWin : BOOL;
        _ManWin : BOOL; 
        _Out1 : BOOL := True;
        _Out2 : BOOL := True;
        _Out3 : BOOL := True;
        _Out4 : BOOL := True;
        _Out5 : BOOL := True;
        _Out6 : BOOL := True; 
        _PB1 : BOOL;
        _PB2 : BOOL;
        _PB3 : BOOL;
        _PB4 : BOOL;
        _PB5 : BOOL;
        _PB6 : BOOL;
    END_VAR 

    (* Pseudo-operator section *)
    Rst := PBStart; (* Rst *) 

    Skp := (BOOL_TO_UINT(PB1) + BOOL_TO_UINT(PB2) + BOOL_TO_UINT(PB3) + BOOL_TO_UINT(PB4)+ BOOL_TO_UINT(PB5) + BOOL_TO_UINT(PB6)) > 1; (* Skp *) 

    Mv1 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V1>=1 AND _V1<=4) AND (NOT _Turn AND NOT _PB1 AND PB1 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 1 OR _Lck)); (* Mv1 *) 
 
    IF (_V1>=0 AND _V1<=3) AND Rst THEN 
        V1 := 4; (* V1+ *) 
    END_IF;

    IF (_V1>=1 AND _V1<=4) AND Mv1 THEN
        V1 := _V1 - 1; (* V1- *) 
    END_IF;

    Mv2 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V2>=1 AND _V2<=4) AND (NOT _Turn AND NOT _PB2 AND PB2 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 2 OR _Lck AND NOT Mv1)); (* Mv2 *) 

    IF (_V2>=0 AND _V2<=3) AND Rst THEN 
        V2 := 4; (* V2+ *) 
    END_IF;

    IF (_V2>=1 AND _V2<=4) AND Mv2 THEN 
        V2 := _V2-1; (* V2- *) 
    END_IF; 

    Mv3 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V3>=1 AND _V3<=4) AND (NOT _Turn AND NOT _PB3 AND PB3 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 3 OR _Lck AND NOT(Mv1 OR Mv2))); (* Mv3 *) 

    IF (_V3>=0 AND _V3<=3) AND Rst THEN 
        V3 := 4; (* V3+ *) 
    END_IF;
    
    IF (_V3>=1 AND _V3<=4) AND Mv3 THEN 
        V3 := _V3-1; (* V3- *) 
    END_IF;

    Mv4 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V4>=1 AND _V4<=4) AND (NOT _Turn AND NOT _PB4 AND PB4 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 4 OR (31 - _Sum) MOD 7 = 0 OR _Lck AND NOT(Mv1 OR Mv2 OR Mv3))); (* Mv4 *) 

    IF (_V4>=0 AND _V4<=3) AND Rst THEN 
        V4 := 4; (* V4+ *) 
    END_IF;
    
    IF (_V4>=1 AND _V4<=4) AND Mv4 THEN 
        V4 := _V4-1; (* V4- *) 
    END_IF;

    Mv5 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V5>=1 AND _V5<=4) AND (NOT _Turn AND NOT _PB5 AND PB5 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 5 OR _Lck AND NOT(Mv1 OR Mv2 OR Mv3 OR Mv4))); (* Mv5 *) 

    IF (_V5>=0 AND _V5<=3) AND Rst THEN 
        V5 := 4; (* V5+ *) 
    END_IF;
    
    IF (_V5>=1 AND _V5<=4) AND Mv5 THEN 
        V5 := _V5-1; (* V5- *) 
    END_IF;

    Mv6 := NOT Rst AND NOT(_PLCWin OR _ManWin) AND (_V6>=1 AND _V6<=4) AND (NOT _Turn AND NOT _PB6 AND PB6 AND NOT Skp OR _Turn AND ((31 - _Sum) MOD 7 = 6 OR _Lck AND NOT(Mv1 OR Mv2 OR Mv3 OR Mv4 OR Mv5))); (* Mv6 *) 

    IF (_V6>=0 AND _V6<=3) AND Rst THEN 
        V6 := 4; (* V6+ *) 
    END_IF;
    
    IF (_V6>=1 AND _V6<=4) AND Mv6 THEN 
        V6 := _V6-1; (* V6- *) 
    END_IF; 

    Sum := 84-V1-2*V2-3*V3-4*V4-5*V5-6*V6; (* Sum *) 
    Lck := (V1=0 AND (31 -Sum) MOD 7 = 1) OR 
        (V2=0 AND (31 -Sum) MOD 7 = 2) OR 
        (V3=0 AND (31 -Sum) MOD 7 = 3) OR 
        (V4=0 AND (31 -Sum) MOD 7 = 4) OR 
        (V5=0 AND (31 -Sum) MOD 7 = 5) OR 
        (V6=0 AND (31 -Sum) MOD 7 = 6) OR 
        (V4=0 AND (31 -Sum) MOD 7 = 0); (* Lck *) 
        
    Mv := Mv1 OR Mv2 OR Mv3 OR Mv4 OR Mv5 OR Mv6; (* Mv *) 

    IF NOT _Turn AND Mv THEN 
        Turn := True; (* Turn+ *) 
    ELSIF _Turn AND (Mv OR Rst) THEN 
        Turn := False; (* Turn- *) 
    END_IF; 

    IF NOT _ManWin AND _Turn AND Sum>31 AND Mv THEN 
        ManWin := True; (* ManWin+ *) 
    ELSIF _ManWin AND Rst THEN 
        ManWin := False; 
    END_IF; (* Man Win- *) 

    IF NOT _PLCWin AND NOT _Turn AND Sum>31 AND Mv THEN 
        PLCWin := True; (* PLCWin+ *) 
    ELSIF _PLCWin AND Rst THEN 
        PLCWin := False; (* PLCWin- *) 
    END_IF; 

    IF NOT _Out1 AND (Mv1 OR Rst) THEN 
        Out1 := True; (* Out1+ *) 
    ELSIF _Out1 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv1) THEN 
        Out1 := False; (* Out1- *) 
    END_IF;

    IF NOT _Out2 AND (Mv2 OR Rst) THEN 
        Out2 := True; (* Out2+ *) 
    ELSIF _Out2 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv2) THEN 
        Out2 := False; (* Out2- *) 
    END_IF; 

    IF NOT _Out3 AND (Mv3 OR Rst) THEN 
        Out3 := True; (* Out3+ *) 
    ELSIF _Out3 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv3) THEN 
        Out3 := False; (* Out3- *) 
    END_IF;

    IF NOT _Out4 AND (Mv4 OR Rst) THEN 
        Out4 := True; (* Out4+ *) 
    ELSIF _Out4 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv4) THEN 
        Out4 := False; (* Out4- *) 
    END_IF; 

    IF NOT _Out5 AND (Mv5 OR Rst) THEN 
        Out5 := True; (* Out5+ *) 
    ELSIF _Out5 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv5) THEN 
        Out5 := False; (* Out5- *) 
    END_IF; 

    IF NOT _Out6 AND (Mv6 OR Rst) THEN 
        Out6 := True; (* Out6+ *) 
    ELSIF _Out6 AND (_Rst AND NOT Rst AND NOT Mv OR Mv AND NOT Mv6) THEN
        Out6 := False; (* Out6- *)
    END_IF;

    _Lck := Lck;
    _Rst := Rst;
    _PLCWin := PLCWin;
    _ManWin := ManWin;
    _Out1 := Out1;
    _Out2 := Out2;
    _Out3 := Out3;
    _Out4 := Out4;
    _Out5 := Out5;
    _Out6 := Out6;
    _PB1 := PB1;
    _PB2 := PB2;
    _PB3 := PB3;
    _PB4 := PB4;
    _PB5 := PB5;
    _PB6 := PB6;
    _V1 := V1;
    _V2 := V2;
    _V3 := V3;
    _V4 := V4;
    _V5 := V5;
    _V6 := V6;

    _Turn := Turn;
    _Sum := Sum;

END_PROGRAM

CONFIGURATION Config0
    RESOURCE Res0 ON PLC
    VAR_GLOBAL 
        (* Inputs *) 
        PB1 : BOOL;
        PB2 : BOOL;
        PB3 : BOOL;
        PB4 : BOOL;
        PB5 : BOOL;
        PB6 : BOOL;
        PBStart : BOOL; 
        (* Outputs *) 
        Out1 : BOOL := True;
        Out2 : BOOL := True;
        Out3 : BOOL := True;
        Out4 : BOOL := True;
        Out5 : BOOL := True;
        Out6 : BOOL := True;
        PLCWin : BOOL;
        ManWin : BOOL;
        Turn : BOOL; 
    END_VAR 
    TASK task0(INTERVAL := T#100ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : PLC_PRG;
    END_RESOURCE
END_CONFIGURATION
