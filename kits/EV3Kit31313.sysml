package EV3Kit31313 {
    doc /*
     * LEGO Mindstorms EV3 Home Edition (Set #31313)
     *
     * Complete Bill of Materials with 601 pieces
     * Released: 2013
     * Recommended Age: 10+
     *
     * This kit includes the EV3 Intelligent Brick, 3 motors, 3 sensors,
     * IR beacon, rechargeable battery, and a variety of Technic elements.
     */

    // Import all component packages
    import EV3Electronics::Brick::*;
    import EV3Electronics::Motors::*;
    import EV3Electronics::Sensors::*;
    import EV3Electronics::Cables::*;
    import EV3Electronics::Battery::*;
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
    import EV3Balls::*;
    import EV3Specialty::*;
    import EV3Decorative::*;

    /**
     * Kit identification and metadata
     */
    part def Kit31313Metadata {
        attribute setNumber : String = "31313";
        attribute setName : String = "LEGO Mindstorms EV3";
        attribute edition : String = "Home Edition";
        attribute pieceCount : Integer = 601;
        attribute releaseYear : Integer = 2013;
        attribute ageRange : String = "10+";
        attribute theme : String = "Mindstorms";
    }

    /**
     * LEGO Mindstorms EV3 Home Edition Kit (31313)
     * Complete Bill of Materials with quantities
     */
    part def EV3HomeEditionKit {
        doc /* Complete EV3 Home Edition set with all 601 pieces */

        part metadata : Kit31313Metadata;

        // =====================================================================
        // ELECTRONICS (14 pieces)
        // =====================================================================

        part ev3Brick : EV3IntelligentBrick[1];
        part largeMotor : LargeServoMotor[2];
        part mediumMotor : MediumServoMotor[1];
        part touchSensor : TouchSensor[1];
        part colorSensor : ColorSensor[1];
        part infraredSensor : InfraredSensor[1];
        part infraredBeacon : InfraredBeacon[1];
        part cable25cm : ConnectionCable25cm[4];
        part cable35cm : ConnectionCable35cm[2];
        part cable50cm : ConnectionCable50cm[1];

        // =====================================================================
        // STRAIGHT BEAMS (32 pieces)
        // =====================================================================

        part beam1x3 : TechnicBeam1x3[4];
        part beam1x5 : TechnicBeam1x5[4];
        part beam1x7 : TechnicBeam1x7[6];
        part beam1x9 : TechnicBeam1x9[4];
        part beam1x11 : TechnicBeam1x11[4];
        part beam1x13 : TechnicBeam1x13[4];
        part beam1x15 : TechnicBeam1x15[2];

        // =====================================================================
        // ANGULAR BEAMS (14 pieces)
        // =====================================================================

        part lBeam2x4 : LBeam2x4[4];
        part lBeam3x5 : LBeam3x5[4];
        part bentBeam4x4 : BentBeam4x4[2];
        part bentBeam3x4 : BentBeam3x4[4];

        // =====================================================================
        // FRAME BEAMS (4 pieces)
        // =====================================================================

        part frame5x7 : FrameBeam5x7[2];
        part frame5x11 : FrameBeam5x11[2];

        // =====================================================================
        // CURVED PANELS (4 pieces)
        // =====================================================================

        part panel3x6Left : Panel3x6CurvedLeft[2];
        part panel3x6Right : Panel3x6CurvedRight[2];

        // =====================================================================
        // PINS (134 pieces)
        // =====================================================================

        part pin2LFriction : Pin2LFriction[60];
        part pin3LFriction : Pin3LFriction[20];
        part pin2LNoFriction : Pin2LNoFriction[10];
        part pin3LNoFriction : Pin3LNoFriction[8];
        part halfPin : HalfPin[10];
        part axlePin : AxlePin[20];
        part axlePinNoFriction : AxlePinNoFriction[10];
        part pinAxle1L2L : PinAxle1L2L[6];

        // =====================================================================
        // AXLE CONNECTORS (22 pieces)
        // =====================================================================

        part crossBlock3M : CrossBlock3M[8];
        part crossBlock90 : CrossBlock90[6];
        part doubleCrossBlock : DoubleCrossBlock[4];
        part crossBlock3L : CrossBlock3L[4];

        // =====================================================================
        // BUSHINGS (20 pieces)
        // =====================================================================

        part halfBushing : HalfBushing[10];
        part fullBushing : FullBushing[10];

        // =====================================================================
        // AXLES (56 pieces)
        // =====================================================================

        part axle2L : Axle2L[12];
        part axle3L : Axle3L[10];
        part axle4L : Axle4L[8];
        part axle4LWithStop : Axle4LWithStop[4];
        part axle5L : Axle5L[6];
        part axle5LWithStop : Axle5LWithStop[2];
        part axle6L : Axle6L[4];
        part axle7L : Axle7L[4];
        part axle8L : Axle8L[2];
        part axle8LWithStop : Axle8LWithStop[2];
        part axle10L : Axle10L[2];
        part axle12L : Axle12L[2];

        // =====================================================================
        // GEARS - STANDARD (10 pieces)
        // =====================================================================

        part gear16T : Gear16T[4];
        part gear24T : Gear24T[4];
        part gear40T : Gear40T[2];

        // =====================================================================
        // GEARS - BEVEL (14 pieces)
        // =====================================================================

        part bevel12T : Bevel12T[4];
        part doubleBevel12T : DoubleBevel12T[4];
        part doubleBevel20T : DoubleBevel20T[4];
        part doubleBevel36T : DoubleBevel36T[2];

        // =====================================================================
        // GEARS - SPECIAL (4 pieces)
        // =====================================================================

        part wormGear : WormGear[2];
        part wormGear2L : WormGear2L[2];

        // =====================================================================
        // WHEELS & TIRES (10 pieces)
        // =====================================================================

        part rim30x20 : Rim30x20[4];
        part rim43x26 : Rim43x26[2];
        part tire56x28 : Tire56x28[4];

        // =====================================================================
        // TRACKS (6 pieces)
        // =====================================================================

        part trackRubber : TrackRubber[2];
        part beltWheel24 : BeltWheel24[4];

        // =====================================================================
        // BALLS & BALL ELEMENTS (11 pieces)
        // =====================================================================

        part ball16_5 : Ball16_5[3];
        part ballWithSnap : BallWithSnap[6];
        part ballMagazine : BallMagazine[1];
        part ballShooter : BallShooter[1];

        // =====================================================================
        // DECORATIVE ELEMENTS (4+ pieces)
        // =====================================================================

        part eye : Eye[2];
        part eyeSocket : EyeSocket[2];
    }

    /**
     * Robots that can be built with 31313 Home Edition
     */
    part def HomeEditionModels {
        doc /* Official building instructions included with 31313 */

        attribute model1 : String = "TRACK3R - Tracked robot with tools";
        attribute model2 : String = "SPIK3R - Scorpion-like robot";
        attribute model3 : String = "R3PTAR - Striking snake robot";
        attribute model4 : String = "GRIPP3R - Humanoid grabber robot";
        attribute model5 : String = "EV3RSTORM - Main humanoid robot";
    }
}
