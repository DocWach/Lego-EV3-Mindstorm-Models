package EV3Kit45544 {
    doc /*
     * LEGO Mindstorms EV3 Education Core Set (Set #45544)
     *
     * Complete Bill of Materials with 541 pieces
     * Released: 2013
     * Recommended Age: 10+
     *
     * Education version includes ultrasonic and gyro sensors,
     * rechargeable battery, and educational-focused parts selection.
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

    /**
     * Kit identification and metadata
     */
    part def Kit45544Metadata {
        attribute setNumber : String = "45544";
        attribute setName : String = "LEGO Mindstorms Education EV3 Core Set";
        attribute edition : String = "Education Core Set";
        attribute pieceCount : Integer = 541;
        attribute releaseYear : Integer = 2013;
        attribute ageRange : String = "10+";
        attribute theme : String = "Mindstorms Education";
        attribute includesCharger : Boolean = true;
        attribute includesStorageBox : Boolean = true;
    }

    /**
     * LEGO Mindstorms EV3 Education Core Set (45544)
     * Complete Bill of Materials with quantities
     */
    part def EV3EducationCoreSet {
        doc /* Complete EV3 Education Core Set with all 541 pieces */

        part metadata : Kit45544Metadata;

        // =====================================================================
        // ELECTRONICS (17 pieces)
        // =====================================================================

        part ev3Brick : EV3IntelligentBrick[1];
        part largeMotor : LargeServoMotor[2];
        part mediumMotor : MediumServoMotor[1];
        part touchSensor : TouchSensor[2];
        part colorSensor : ColorSensor[1];
        part ultrasonicSensor : UltrasonicSensor[1];
        part gyroSensor : GyroSensor[1];
        part rechargeableBattery : RechargeableBattery[1];
        part cable25cm : ConnectionCable25cm[4];
        part cable35cm : ConnectionCable35cm[2];
        part cable50cm : ConnectionCable50cm[1];
        part usbCable : USBCable[1];

        // =====================================================================
        // STRAIGHT BEAMS (26 pieces)
        // =====================================================================

        part beam1x3 : TechnicBeam1x3[6];
        part beam1x5 : TechnicBeam1x5[4];
        part beam1x7 : TechnicBeam1x7[4];
        part beam1x9 : TechnicBeam1x9[2];
        part beam1x11 : TechnicBeam1x11[2];
        part beam1x13 : TechnicBeam1x13[2];
        part beam1x15 : TechnicBeam1x15[2];

        // =====================================================================
        // ANGULAR BEAMS (16 pieces)
        // =====================================================================

        part lBeam2x4 : LBeam2x4[6];
        part lBeam3x5 : LBeam3x5[2];
        part bentBeam3x4 : BentBeam3x4[4];
        part angularBeam4x6 : AngularBeam4x6[4];

        // =====================================================================
        // FRAME BEAMS (4 pieces)
        // =====================================================================

        part frame5x7 : FrameBeam5x7[2];
        part frame5x11 : FrameBeam5x11[2];

        // =====================================================================
        // PINS (158 pieces)
        // =====================================================================

        part pin2LFriction : Pin2LFriction[60];
        part pin3LFriction : Pin3LFriction[30];
        part pin2LNoFriction : Pin2LNoFriction[20];
        part pin3LNoFriction : Pin3LNoFriction[10];
        part halfPin : HalfPin[10];
        part axlePin : AxlePin[20];
        part axlePinNoFriction : AxlePinNoFriction[10];
        part pinAxle1L2L : PinAxle1L2L[8];

        // =====================================================================
        // AXLE CONNECTORS (28 pieces)
        // =====================================================================

        part crossBlock3M : CrossBlock3M[8];
        part crossBlock90 : CrossBlock90[8];
        part doubleCrossBlock : DoubleCrossBlock[8];
        part crossBlock3L : CrossBlock3L[4];

        // =====================================================================
        // BUSHINGS (24 pieces)
        // =====================================================================

        part halfBushing : HalfBushing[10];
        part fullBushing : FullBushing[10];
        part bushWith2Studs : BushWith2Studs[4];

        // =====================================================================
        // AXLES (59 pieces)
        // =====================================================================

        part axle2L : Axle2L[10];
        part axle3L : Axle3L[14];
        part axle4L : Axle4L[4];
        part axle4LWithStop : Axle4LWithStop[4];
        part axle5L : Axle5L[6];
        part axle5LWithStop : Axle5LWithStop[2];
        part axle6L : Axle6L[4];
        part axle7L : Axle7L[5];
        part axle8L : Axle8L[2];
        part axle8LWithStop : Axle8LWithStop[2];
        part axle9L : Axle9L[2];
        part axle10L : Axle10L[2];
        part axle12L : Axle12L[2];

        // =====================================================================
        // GEARS - STANDARD (16 pieces)
        // =====================================================================

        part gear8T : Gear8T[4];
        part gear16T : Gear16T[4];
        part gear24T : Gear24T[4];
        part gear40T : Gear40T[2];

        // =====================================================================
        // GEARS - BEVEL (10 pieces)
        // =====================================================================

        part bevel12T : Bevel12T[2];
        part doubleBevel12T : DoubleBevel12T[2];
        part doubleBevel20T : DoubleBevel20T[2];
        part doubleBevel36T : DoubleBevel36T[2];

        // =====================================================================
        // GEARS - SPECIAL (4 pieces)
        // =====================================================================

        part wormGear : WormGear[2];
        part wormGear2L : WormGear2L[2];

        // =====================================================================
        // WHEELS & TIRES (6 pieces)
        // =====================================================================

        part rim30x20 : Rim30x20[2];
        part tire56x28 : Tire56x28[2];

        // =====================================================================
        // TRACKS (62 pieces)
        // =====================================================================

        part trackLinkLarge : TrackLinkLarge[54];
        part sprocket40 : Sprocket40[4];
        part beltWheel24 : BeltWheel24[4];
    }

    /**
     * Educational curriculum models for 45544
     */
    part def EducationCoreModels {
        doc /* Educational robot designs included with 45544 curriculum */

        attribute model1 : String = "Driving Base - Standard mobile robot platform";
        attribute model2 : String = "Educator Vehicle - Primary teaching robot";
        attribute model3 : String = "Color Sorter - Automated sorting machine";
        attribute model4 : String = "Gyro Boy - Self-balancing robot";
        attribute model5 : String = "Puppy - Interactive pet robot";
        attribute model6 : String = "Robot Arm H25 - Industrial arm simulation";
    }
}
