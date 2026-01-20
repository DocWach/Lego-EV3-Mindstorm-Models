package EV3Frames {
    import EV3BeamsStraight::TechnicMaterial;
    import EV3BeamsStraight::BeamColor;

    /**
     * Abstract base definition for Technic frame beams.
     * Frame beams are rectangular structural elements with holes on multiple sides.
     */
    abstract part def FrameBeamBase {
        // Part identification
        attribute designId : String;
        attribute partName : String;

        // Frame dimensions (in modules, 1M = 8mm)
        attribute widthModules : Integer;   // Width of frame in modules
        attribute lengthModules : Integer;  // Length of frame in modules
        attribute heightModules : Real;     // Height (thickness) in modules

        // Hole configuration
        attribute holesPerWidth : Integer;   // Number of holes along width
        attribute holesPerLength : Integer;  // Number of holes along length
        attribute totalHoleCount : Integer;  // Total accessible holes
        attribute holeSpacing : Real = 8.0;  // mm between hole centers

        // Physical properties
        attribute thicknessMM : Real;
        attribute material : TechnicMaterial = TechnicMaterial::ABS;
        attribute color : BeamColor;

        // Weight (approximate)
        attribute weightGrams : Real;

        // Frame type
        attribute isOpenCenter : Boolean;  // Whether frame has open center
    }

    // =========================================================================
    // FRAME BEAMS
    // =========================================================================

    /**
     * Technic Frame Beam 5x7 - Medium rectangular frame.
     * LEGO Design ID: 64178
     * Open-center frame with 5-module width and 7-module length.
     * Common structural element for EV3 robot chassis.
     */
    part def FrameBeam5x7 :> FrameBeamBase {
        attribute :>> designId = "64178";
        attribute :>> partName = "Technic Frame Beam 5x7";
        attribute :>> widthModules = 5;
        attribute :>> lengthModules = 7;
        attribute :>> heightModules = 1.0;
        attribute :>> holesPerWidth = 5;
        attribute :>> holesPerLength = 7;
        attribute :>> totalHoleCount = 20;  // Perimeter holes
        attribute :>> thicknessMM = 7.8;
        attribute :>> weightGrams = 8.5;
        attribute :>> isOpenCenter = true;

        // Open center dimensions
        attribute openingWidthModules : Integer = 3;
        attribute openingLengthModules : Integer = 5;

        // Corner reinforcement
        attribute hasReinforcedCorners : Boolean = true;
    }

    /**
     * Technic Frame Beam 5x11 - Large rectangular frame.
     * LEGO Design ID: 64179
     * Open-center frame with 5-module width and 11-module length.
     * Extended frame for larger robot structures and chassis.
     */
    part def FrameBeam5x11 :> FrameBeamBase {
        attribute :>> designId = "64179";
        attribute :>> partName = "Technic Frame Beam 5x11";
        attribute :>> widthModules = 5;
        attribute :>> lengthModules = 11;
        attribute :>> heightModules = 1.0;
        attribute :>> holesPerWidth = 5;
        attribute :>> holesPerLength = 11;
        attribute :>> totalHoleCount = 28;  // Perimeter holes
        attribute :>> thicknessMM = 7.8;
        attribute :>> weightGrams = 12.3;
        attribute :>> isOpenCenter = true;

        // Open center dimensions
        attribute openingWidthModules : Integer = 3;
        attribute openingLengthModules : Integer = 9;

        // Corner reinforcement
        attribute hasReinforcedCorners : Boolean = true;
    }

    // =========================================================================
    // FRAME ASSEMBLY CONFIGURATIONS
    // =========================================================================

    /**
     * Chassis frame configuration using frame beams.
     * Combines frame beams for a complete robot base structure.
     */
    part def ChassisFrame {
        // Frame components
        part primaryFrame : FrameBeam5x11[0..1];
        part secondaryFrame : FrameBeam5x7[0..2];

        // Configuration attributes
        attribute totalWidthModules : Integer;
        attribute totalLengthModules : Integer;
        attribute mountingHoleCount : Integer;

        // Structural properties
        attribute maxLoadCapacityGrams : Real;
        attribute torsionalRigidity : Real;  // Relative measure
    }

    /**
     * Complete frame beam assortment for EV3 builds.
     */
    part def FrameBeamAssortment {
        part frame5x7 : FrameBeam5x7[0..*];
        part frame5x11 : FrameBeam5x11[0..*];
    }
}
