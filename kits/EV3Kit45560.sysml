package EV3Kit45560 {
    doc /*
     * LEGO Mindstorms EV3 Expansion Set (Set #45560)
     *
     * Complete Bill of Materials with 853 pieces
     * Released: 2013
     * Recommended Age: 10+
     *
     * Expansion set adds additional structural elements, gears,
     * wheels, tracks, universal joints, and specialty parts.
     * Designed to complement the 45544 Education Core Set.
     */

    // Import all component packages
    import EV3BeamsStraight::*;
    import EV3BeamsAngular::*;
    import EV3Frames::*;
    import EV3Panels::*;
    import EV3Pins::*;
    import EV3AxleConnectors::*;
    import EV3Bushings::*;
    import EV3Axles::*;
    import EV3GearsStandard::*;
    import EV3GearsBevel::*;
    import EV3GearsSpecial::*;
    import EV3Wheels::*;
    import EV3Tires::*;
    import EV3Tracks::*;
    import EV3Specialty::*;

    /**
     * Kit identification and metadata
     */
    part def Kit45560Metadata {
        attribute setNumber : String = "45560";
        attribute setName : String = "LEGO Mindstorms Education EV3 Expansion Set";
        attribute edition : String = "Education Expansion Set";
        attribute pieceCount : Integer = 853;
        attribute releaseYear : Integer = 2013;
        attribute ageRange : String = "10+";
        attribute theme : String = "Mindstorms Education";
        attribute requiresCoreSet : Boolean = true;
        attribute includesStorageBox : Boolean = true;
    }

    /**
     * LEGO Mindstorms EV3 Expansion Set (45560)
     * Complete Bill of Materials with quantities
     */
    part def EV3ExpansionSet {
        doc /* Complete EV3 Expansion Set with all 853 pieces */

        part metadata : Kit45560Metadata;

        // =====================================================================
        // STRAIGHT BEAMS (54 pieces)
        // =====================================================================

        part beam1x2 : TechnicBeam1x2[3];
        part beam1x3 : TechnicBeam1x3[13];
        part beam1x5 : TechnicBeam1x5[5];
        part beam1x7 : TechnicBeam1x7[16];
        part beam1x9 : TechnicBeam1x9[7];
        part beam1x11 : TechnicBeam1x11[6];
        part beam1x15 : TechnicBeam1x15[13];
        part thinBeam1x5 : ThinBeam1x5[10];
        part thinBeam1x5WithAxle : ThinBeam1x5WithAxle[4];

        // =====================================================================
        // ANGULAR BEAMS (26 pieces)
        // =====================================================================

        part lBeam2x4 : LBeam2x4[12];
        part lBeam3x5 : LBeam3x5[6];
        part bentBeam3x4 : BentBeam3x4[2];
        part doubleBentBeam3x7 : DoubleBentBeam3x7[6];

        // =====================================================================
        // FRAME BEAMS (15 pieces)
        // =====================================================================

        part frame5x7 : FrameBeam5x7[9];
        part frame5x11 : FrameBeam5x11[6];

        // =====================================================================
        // CURVED PANELS (20 pieces)
        // =====================================================================

        part panel3x6Left : Panel3x6CurvedLeft[2];
        part panel3x6Right : Panel3x6CurvedRight[2];
        part panel3x7Left : Panel3x7CurvedLeft[2];
        part panel3x7Right : Panel3x7CurvedRight[2];
        part panel3x11Left : Panel3x11CurvedLeft[1];
        part panel3x11Right : Panel3x11CurvedRight[1];
        part panel5x7Left : Panel5x7CurvedLeft[1];
        part panel5x7Right : Panel5x7CurvedRight[1];
        part panel11x3Left : Panel11x3CurvedLeft[2];
        part panel11x3Right : Panel11x3CurvedRight[2];
        part panel2x5Left : Panel2x5Left[2];
        part panel2x5Right : Panel2x5Right[2];

        // =====================================================================
        // PINS (286 pieces)
        // =====================================================================

        part pin2LFriction : Pin2LFriction[170];
        part pin3LFriction : Pin3LFriction[33];
        part pin3LNoFriction : Pin3LNoFriction[14];
        part halfPin : HalfPin[6];
        part axlePin : AxlePin[57];
        part pinConnector1_5 : PinConnector1_5[6];

        // =====================================================================
        // AXLE CONNECTORS (52 pieces)
        // =====================================================================

        part crossBlock3M : CrossBlock3M[4];
        part crossBlock90 : CrossBlock90[1];
        part doubleCrossBlock : DoubleCrossBlock[4];
        part crossBlock3L : CrossBlock3L[14];
        part angleConnector1 : AngleConnector1[6];
        part angleConnector2 : AngleConnector2[5];
        part angleConnector3 : AngleConnector3[4];
        part angleConnector5 : AngleConnector5[3];
        part angleConnector6 : AngleConnector6[2];

        // =====================================================================
        // BUSHINGS (61 pieces)
        // =====================================================================

        part halfBushing : HalfBushing[16];
        part fullBushing : FullBushing[45];

        // =====================================================================
        // AXLES (87 pieces)
        // =====================================================================

        part axle2L : Axle2L[22];
        part axle3L : Axle3L[12];
        part axle3LWithStud : Axle3LWithStud[16];
        part axle4L : Axle4L[5];
        part axle4LWithStop : Axle4LWithStop[10];
        part axle5L : Axle5L[8];
        part axle6L : Axle6L[1];
        part axle7L : Axle7L[2];
        part axle8L : Axle8L[1];
        part axle8LWithStop : Axle8LWithStop[6];
        part axle9L : Axle9L[5];
        part axle10L : Axle10L[1];
        part axle12L : Axle12L[1];

        // =====================================================================
        // GEARS - STANDARD (9 pieces)
        // =====================================================================

        part gear8T : Gear8T[2];
        part gear16T : Gear16T[2];
        part gear24T : Gear24T[3];
        part gear40T : Gear40T[2];

        // =====================================================================
        // GEARS - BEVEL (8 pieces)
        // =====================================================================

        part doubleBevel12T : DoubleBevel12T[2];
        part doubleBevel20T : DoubleBevel20T[3];
        part bevelHalf20T : BevelHalf20T[3];

        // =====================================================================
        // GEARS - SPECIAL (4 pieces)
        // =====================================================================

        part differential : Differential[1];
        part turntable60T : Turntable60T[1];
        part gearRack13M : GearRack13M[2];

        // =====================================================================
        // WHEELS & RIMS (17 pieces)
        // =====================================================================

        part rim11x8 : Rim11x8[7];
        part rim18x14 : Rim18x14[5];
        part rim30x20 : Rim30x20[3];
        part rim43x26 : Rim43x26[2];

        // =====================================================================
        // TIRES (10 pieces)
        // =====================================================================

        part tire24x14 : Tire24x14[2];
        part tire43x22 : Tire43x22[2];
        part tire56x28 : Tire56x28[2];
        part tire68x36 : Tire68x36[4];

        // =====================================================================
        // TRACKS (35 pieces)
        // =====================================================================

        part trackLinkLarge : TrackLinkLarge[5];
        part trackRubber : TrackRubber[28];
        part sprocket40 : Sprocket40[2];

        // =====================================================================
        // UNIVERSAL JOINTS (6 pieces)
        // =====================================================================

        part universalJoint3L : UniversalJoint3L[2];
        part cvJointInput : CVJointInput[2];
        part cvJointOutput : CVJointOutput[2];

        // =====================================================================
        // RUBBER BANDS (4 pieces)
        // =====================================================================

        part rubberBand25mm : RubberBand25mm[2];
        part rubberBand26mm : RubberBand26mm[2];

        // =====================================================================
        // HOSES (4 pieces)
        // =====================================================================

        part hoseCorrugated : HoseCorrugated[4];
    }

    /**
     * Advanced models enabled by combining 45544 + 45560
     */
    part def ExpansionSetModels {
        doc /* Advanced robot designs enabled by expansion set */

        attribute model1 : String = "Elephant - Large walking quadruped";
        attribute model2 : String = "Spinner Factory - Production line simulator";
        attribute model3 : String = "Stair Climber - Advanced mobility robot";
        attribute model4 : String = "Tank Bot - Heavy tracked vehicle";
        attribute model5 : String = "Znap - Articulated grabber robot";
        attribute model6 : String = "Remote Control - Joystick controller";
    }

    /**
     * Combined kit providing all pieces from both sets
     */
    part def CombinedEducationKit {
        doc /* Combined 45544 + 45560 totaling 1394 pieces */

        attribute totalPieces : Integer = 1394;
        attribute coreSetNumber : String = "45544";
        attribute expansionSetNumber : String = "45560";
    }
}
