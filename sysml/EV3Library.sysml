package EV3Library {
    doc /*
     * LEGO Mindstorms EV3 SysML v2 Library
     * =====================================
     *
     * Comprehensive SysML v2 model for the LEGO Mindstorms EV3 ecosystem
     * covering all three official sets:
     *
     *   - 31313 Home Edition (601 pieces)
     *   - 45544 Education Core Set (541 pieces)
     *   - 45560 Expansion Set (853 pieces)
     *
     * Total unique part definitions: ~150
     * All parts include official LEGO Design IDs and specifications.
     *
     * Repository: https://github.com/DocWach/Lego-EV3-Mindstorm-Models
     *
     * Structure:
     * ----------
     * domain/       - Type definitions, enumerations, units
     * electronics/  - EV3 Brick, motors, sensors, cables, battery
     * structural/   - Beams (straight, angular, frames, panels)
     * connectors/   - Pins, axle connectors, bushings
     * axles/        - All axle lengths (2L-12L)
     * gears/        - Standard, bevel, and special gears
     * wheels/       - Rims, tires, tracks
     * other/        - Balls, specialty parts, decorative elements
     * kits/         - Complete BOMs for each set
     */

    // =========================================================================
    // DOMAIN DEFINITIONS
    // =========================================================================

    import EV3Types::*;
    import EV3Units::*;
    import EV3Interfaces::*;

    // =========================================================================
    // ELECTRONICS COMPONENTS
    // =========================================================================

    import EV3Electronics::Brick::*;
    import EV3Electronics::Motors::*;
    import EV3Electronics::Sensors::*;
    import EV3Electronics::Cables::*;
    import EV3Electronics::Battery::*;

    // =========================================================================
    // STRUCTURAL ELEMENTS
    // =========================================================================

    import EV3BeamsStraight::*;
    import EV3BeamsAngular::*;
    import EV3Frames::*;
    import EV3Panels::*;

    // =========================================================================
    // CONNECTORS
    // =========================================================================

    import EV3Pins::*;
    import EV3AxleConnectors::*;
    import EV3Bushings::*;

    // =========================================================================
    // AXLES
    // =========================================================================

    import EV3Axles::*;

    // =========================================================================
    // GEARS
    // =========================================================================

    import EV3GearsStandard::*;
    import EV3GearsBevel::*;
    import EV3GearsSpecial::*;

    // =========================================================================
    // WHEELS, TIRES, AND TRACKS
    // =========================================================================

    import EV3Wheels::*;
    import EV3Tires::*;
    import EV3Tracks::*;

    // =========================================================================
    // SPECIALTY AND DECORATIVE PARTS
    // =========================================================================

    import EV3Balls::*;
    import EV3Specialty::*;
    import EV3Decorative::*;

    // =========================================================================
    // KIT BILLS OF MATERIALS
    // =========================================================================

    import EV3Kit31313::*;
    import EV3Kit45544::*;
    import EV3Kit45560::*;

    // =========================================================================
    // LIBRARY METADATA
    // =========================================================================

    /**
     * EV3 Library version and metadata
     */
    part def EV3LibraryInfo {
        attribute version : String = "1.0.0";
        attribute sysmlVersion : String = "2.0";
        attribute lastUpdated : String = "2026-01-20";
        attribute author : String = "DocWach";
        attribute license : String = "MIT";

        // Part statistics
        attribute totalUniquePartDefs : Integer = 150;
        attribute totalElectronics : Integer = 15;
        attribute totalStructural : Integer = 36;
        attribute totalConnectors : Integer = 38;
        attribute totalAxles : Integer = 15;
        attribute totalGears : Integer = 18;
        attribute totalWheelsTiresTracks : Integer = 17;
        attribute totalSpecialty : Integer = 21;

        // Kit statistics
        attribute kit31313Pieces : Integer = 601;
        attribute kit45544Pieces : Integer = 541;
        attribute kit45560Pieces : Integer = 853;
        attribute totalAllKitsPieces : Integer = 1995;
    }

    /**
     * Part number cross-reference
     */
    part def PartNumberReference {
        doc /*
         * Quick reference for common EV3 parts by Design ID
         *
         * Electronics:
         *   95646 - EV3 Intelligent Brick
         *   95658 - Large Servo Motor
         *   99455 - Medium Servo Motor
         *   95648 - Touch Sensor
         *   95650 - Color Sensor
         *   95652 - Ultrasonic Sensor
         *   99380 - Gyro Sensor
         *   95654 - Infrared Sensor
         *   72156 - IR Beacon
         *   95656 - Rechargeable Battery
         *
         * Common Beams:
         *   32523 - Beam 1x3
         *   32316 - Beam 1x5
         *   32524 - Beam 1x7
         *   40490 - Beam 1x9
         *   32525 - Beam 1x11
         *   41239 - Beam 1x13
         *   32278 - Beam 1x15
         *
         * Common Pins:
         *   2780  - Pin 2L Friction (Black)
         *   6558  - Pin 3L Friction (Blue)
         *   3673  - Pin 2L No Friction (Gray)
         *   43093 - Axle Pin (Blue)
         *
         * Common Gears:
         *   10928 - Gear 8T
         *   94925 - Gear 16T
         *   3648  - Gear 24T
         *   3649  - Gear 40T
         *   4716  - Worm Gear
         */
    }

    /**
     * Usage example: Creating a simple robot
     */
    part def ExampleRobot {
        doc /* Example usage of EV3 Library parts */

        // Electronics
        part brick : EV3IntelligentBrick[1];
        part leftMotor : LargeServoMotor[1];
        part rightMotor : LargeServoMotor[1];
        part colorSensor : ColorSensor[1];

        // Structure
        part mainBeam : TechnicBeam1x15[2];
        part crossBeam : TechnicBeam1x11[2];
        part frame : FrameBeam5x7[1];

        // Connectors
        part pins : Pin2LFriction[20];
        part axlePins : AxlePin[8];

        // Drive
        part driveAxle : Axle7L[2];
        part wheels : Rim43x26[2];
        part tires : Tire56x28[2];
    }
}
