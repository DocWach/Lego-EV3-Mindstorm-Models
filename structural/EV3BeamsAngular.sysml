package EV3BeamsAngular {
    import EV3BeamsStraight::TechnicMaterial;
    import EV3BeamsStraight::BeamColor;
    import EV3BeamsStraight::BeamThickness;

    /**
     * Abstract base definition for angular/bent Technic beams.
     * Provides common attributes for L-shaped and angled beam components.
     */
    abstract part def AngularBeamBase {
        // Part identification
        attribute designId : String;
        attribute partName : String;

        // Angular geometry
        attribute angleDegrees : Real;  // Bend angle in degrees

        // Dimensional attributes
        attribute arm1Modules : Integer;  // Length of first arm in modules
        attribute arm2Modules : Integer;  // Length of second arm in modules
        attribute totalHoleCount : Integer;

        // Physical properties
        attribute thickness : BeamThickness = BeamThickness::Standard;
        attribute thicknessMM : Real = 7.8;
        attribute material : TechnicMaterial = TechnicMaterial::ABS;
        attribute color : BeamColor;

        // Weight (approximate)
        attribute weightGrams : Real;
    }

    /**
     * Abstract definition for angle connectors.
     * Small connectors that join beams at fixed angles.
     */
    abstract part def AngleConnectorBase {
        // Part identification
        attribute designId : String;
        attribute partName : String;

        // Angular geometry
        attribute angleDegrees : Real;  // Connector angle in degrees

        // Physical properties
        attribute holeCount : Integer = 2;
        attribute material : TechnicMaterial = TechnicMaterial::ABS;
        attribute color : BeamColor;
        attribute weightGrams : Real;
    }

    // =========================================================================
    // L-SHAPED BEAMS (90 DEGREE)
    // =========================================================================

    /**
     * Technic L-Beam 2x4 - Small L-shaped beam.
     * LEGO Design ID: 32140
     * 90-degree angle with 2-module and 4-module arms.
     */
    part def LBeam2x4 :> AngularBeamBase {
        attribute :>> designId = "32140";
        attribute :>> partName = "Technic L-Beam 2x4";
        attribute :>> angleDegrees = 90.0;
        attribute :>> arm1Modules = 2;
        attribute :>> arm2Modules = 4;
        attribute :>> totalHoleCount = 5;  // Corner hole shared
        attribute :>> weightGrams = 2.1;
    }

    /**
     * Technic L-Beam 3x5 - Medium L-shaped beam.
     * LEGO Design ID: 32526
     * 90-degree angle with 3-module and 5-module arms.
     */
    part def LBeam3x5 :> AngularBeamBase {
        attribute :>> designId = "32526";
        attribute :>> partName = "Technic L-Beam 3x5";
        attribute :>> angleDegrees = 90.0;
        attribute :>> arm1Modules = 3;
        attribute :>> arm2Modules = 5;
        attribute :>> totalHoleCount = 7;  // Corner hole shared
        attribute :>> weightGrams = 3.3;
    }

    // =========================================================================
    // BENT BEAMS (53 DEGREE)
    // =========================================================================

    /**
     * Technic Bent Beam 4x4 - Square bent beam.
     * LEGO Design ID: 32348
     * 53-degree bend angle with equal 4-module arms.
     */
    part def BentBeam4x4 :> AngularBeamBase {
        attribute :>> designId = "32348";
        attribute :>> partName = "Technic Bent Beam 4x4";
        attribute :>> angleDegrees = 53.0;
        attribute :>> arm1Modules = 4;
        attribute :>> arm2Modules = 4;
        attribute :>> totalHoleCount = 7;
        attribute :>> weightGrams = 3.5;
    }

    /**
     * Technic Bent Beam 3x4 - Rectangular bent beam.
     * LEGO Design ID: 32009
     * 53-degree bend angle with 3-module and 4-module arms.
     */
    part def BentBeam3x4 :> AngularBeamBase {
        attribute :>> designId = "32009";
        attribute :>> partName = "Technic Bent Beam 3x4";
        attribute :>> angleDegrees = 53.0;
        attribute :>> arm1Modules = 3;
        attribute :>> arm2Modules = 4;
        attribute :>> totalHoleCount = 6;
        attribute :>> weightGrams = 2.9;
    }

    // =========================================================================
    // VARIABLE ANGLE BEAMS
    // =========================================================================

    /**
     * Technic Angular Beam 4x6 - Large angular beam.
     * LEGO Design ID: 32271
     * Variable angle configuration with 4-module and 6-module arms.
     */
    part def AngularBeam4x6 :> AngularBeamBase {
        attribute :>> designId = "32271";
        attribute :>> partName = "Technic Angular Beam 4x6";
        attribute :>> angleDegrees = 53.0;  // Default angle
        attribute :>> arm1Modules = 4;
        attribute :>> arm2Modules = 6;
        attribute :>> totalHoleCount = 9;
        attribute :>> weightGrams = 4.2;

        // Variable angle feature
        attribute isVariableAngle : Boolean = true;
        attribute minAngle : Real = 0.0;
        attribute maxAngle : Real = 180.0;
    }

    // =========================================================================
    // DOUBLE BENT BEAMS
    // =========================================================================

    /**
     * Technic Double Bent Beam 3x7 - S-shaped beam.
     * LEGO Design ID: 64179
     * Double bent configuration for offset connections.
     */
    part def DoubleBentBeam3x7 :> AngularBeamBase {
        attribute :>> designId = "64179";
        attribute :>> partName = "Technic Double Bent Beam 3x7";
        attribute :>> angleDegrees = 53.0;  // Each bend angle
        attribute :>> arm1Modules = 3;
        attribute :>> arm2Modules = 7;
        attribute :>> totalHoleCount = 9;
        attribute :>> weightGrams = 4.5;

        // Double bent specific
        attribute isDoubleBent : Boolean = true;
        attribute offsetModules : Integer = 2;  // Vertical offset between ends
    }

    // =========================================================================
    // ANGLE CONNECTORS
    // =========================================================================

    /**
     * Technic Angle Connector #1 - Straight connector.
     * LEGO Design ID: 32013
     * 0-degree (180 degree relative) straight-through connector.
     */
    part def AngleConnector1 :> AngleConnectorBase {
        attribute :>> designId = "32013";
        attribute :>> partName = "Technic Angle Connector #1";
        attribute :>> angleDegrees = 0.0;  // Straight (180 relative)
        attribute :>> weightGrams = 0.4;
    }

    /**
     * Technic Angle Connector #2 - 180-degree connector.
     * LEGO Design ID: 32034
     * Full 180-degree (straight line) connection.
     */
    part def AngleConnector2 :> AngleConnectorBase {
        attribute :>> designId = "32034";
        attribute :>> partName = "Technic Angle Connector #2";
        attribute :>> angleDegrees = 180.0;
        attribute :>> weightGrams = 0.5;
    }

    /**
     * Technic Angle Connector #3 - 157.5-degree connector.
     * LEGO Design ID: 32016
     * Slight angle offset of 22.5 degrees from straight.
     */
    part def AngleConnector3 :> AngleConnectorBase {
        attribute :>> designId = "32016";
        attribute :>> partName = "Technic Angle Connector #3";
        attribute :>> angleDegrees = 157.5;
        attribute :>> weightGrams = 0.5;
    }

    /**
     * Technic Angle Connector #5 - 112.5-degree connector.
     * LEGO Design ID: 32015
     * Medium angle offset of 67.5 degrees from straight.
     */
    part def AngleConnector5 :> AngleConnectorBase {
        attribute :>> designId = "32015";
        attribute :>> partName = "Technic Angle Connector #5";
        attribute :>> angleDegrees = 112.5;
        attribute :>> weightGrams = 0.5;
    }

    /**
     * Technic Angle Connector #6 - 90-degree connector.
     * LEGO Design ID: 32014
     * Right angle (perpendicular) connection.
     */
    part def AngleConnector6 :> AngleConnectorBase {
        attribute :>> designId = "32014";
        attribute :>> partName = "Technic Angle Connector #6";
        attribute :>> angleDegrees = 90.0;
        attribute :>> weightGrams = 0.5;
    }

    // =========================================================================
    // UTILITY PARTS
    // =========================================================================

    /**
     * Collection of angular beams for a typical EV3 build.
     */
    part def AngularBeamAssortment {
        // L-shaped beams
        part lBeam2x4 : LBeam2x4[0..*];
        part lBeam3x5 : LBeam3x5[0..*];

        // Bent beams
        part bentBeam4x4 : BentBeam4x4[0..*];
        part bentBeam3x4 : BentBeam3x4[0..*];

        // Angular beams
        part angularBeam4x6 : AngularBeam4x6[0..*];

        // Double bent beams
        part doubleBentBeam3x7 : DoubleBentBeam3x7[0..*];
    }

    /**
     * Complete set of angle connectors.
     */
    part def AngleConnectorSet {
        part connector1 : AngleConnector1[0..*];
        part connector2 : AngleConnector2[0..*];
        part connector3 : AngleConnector3[0..*];
        part connector5 : AngleConnector5[0..*];
        part connector6 : AngleConnector6[0..*];
    }
}
