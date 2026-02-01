package EV3Tracks {
    doc /*
     * EV3 Track and Belt Definitions
     *
     * This package defines track links, sprockets, pulleys, and belts
     * compatible with the LEGO Mindstorms EV3 system. Tracks provide
     * continuous traction for tank-style drive configurations.
     */

    import ScalarValues::*;
    import EV3Wheels::*;

    /**
     * Track component types.
     */
    enum def TrackType {
        enum PlasticLink;       // Rigid plastic track link
        enum RubberSegment;     // Flexible rubber track
        enum RubberBelt;        // Continuous rubber belt
    }

    /**
     * Sprocket and pulley types.
     */
    enum def SprocketType {
        enum DriveSprocket;     // Motor-driven sprocket
        enum GuideSprocket;     // Idler/guide sprocket
        enum TensionSprocket;   // Track tensioner sprocket
        enum PulleyWheel;       // Belt pulley
    }

    /**
     * Abstract base definition for track links.
     */
    abstract part def TrackLinkBase {
        doc /* Base track link definition */

        // LEGO identification
        attribute designId : String;
        attribute partName : String;

        // Physical dimensions (mm)
        attribute length : Real;
        attribute width : Real;
        attribute height : Real;

        // Construction
        attribute material : WheelMaterial;
        attribute color : String;
        attribute trackType : TrackType;
    }

    /**
     * Large plastic track link.
     * LEGO Design ID: 57518
     * Rigid track link for heavy-duty tracked vehicles.
     */
    part def TrackLinkLarge :> TrackLinkBase {
        doc /* Large plastic track link for tank-style drive */

        attribute :>> designId = "57518";
        attribute :>> partName = "Track Link Large";
        attribute :>> length = 12.8;
        attribute :>> width = 25.6;
        attribute :>> height = 5.0;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> color = "Black";
        attribute :>> trackType = TrackType::PlasticLink;

        // Link connection attributes
        attribute pinDiameter : Real = 4.8;
        attribute pinSpacing : Real = 8.0;
        attribute linksPerTrack : Integer = 20;
    }

    /**
     * Rubber track segment.
     * LEGO Design ID: 24375
     * Flexible rubber track for smooth operation.
     */
    part def TrackRubber :> TrackLinkBase {
        doc /* Rubber track segment for flexible tracked drive */

        attribute :>> designId = "24375";
        attribute :>> partName = "Track Rubber Segment";
        attribute :>> length = 16.0;
        attribute :>> width = 14.0;
        attribute :>> height = 4.0;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> trackType = TrackType::RubberSegment;

        // Rubber track attributes
        attribute toothPitch : Real = 8.0;
        attribute teethPerSegment : Integer = 2;
        attribute segmentsPerTrack : Integer = 15;
    }

    /**
     * Abstract base definition for sprockets and pulleys.
     */
    abstract part def SprocketBase {
        doc /* Base sprocket/pulley definition */

        // LEGO identification
        attribute designId : String;
        attribute partName : String;

        // Physical dimensions (mm)
        attribute outerDiameter : Real;
        attribute width : Real;
        attribute hubDiameter : Real;

        // Construction
        attribute material : WheelMaterial;
        attribute color : String;
        attribute sprocketType : SprocketType;

        // Tooth/groove configuration
        attribute teethCount : Integer;
        attribute toothPitch : Real;
    }

    /**
     * Large drive sprocket 40mm.
     * LEGO Design ID: 57520
     * Primary drive sprocket for tank tracks.
     */
    part def Sprocket40 :> SprocketBase {
        doc /* 40.7mm drive sprocket for large track links */

        attribute :>> designId = "57520";
        attribute :>> partName = "Sprocket 40.7 x 15 Drive";
        attribute :>> outerDiameter = 40.7;
        attribute :>> width = 15.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> color = "Light Bluish Gray";
        attribute :>> sprocketType = SprocketType::DriveSprocket;
        attribute :>> teethCount = 16;
        attribute :>> toothPitch = 8.0;

        // Hub configuration
        attribute hubType : HubType = HubType::AxleHole;
    }

    /**
     * Small guide sprocket 20mm.
     * LEGO Design ID: 57519
     * Idler sprocket for track guidance and tensioning.
     */
    part def Sprocket20 :> SprocketBase {
        doc /* 20mm guide sprocket for track tensioning */

        attribute :>> designId = "57519";
        attribute :>> partName = "Sprocket 20 x 15 Guide";
        attribute :>> outerDiameter = 20.0;
        attribute :>> width = 15.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> color = "Light Bluish Gray";
        attribute :>> sprocketType = SprocketType::GuideSprocket;
        attribute :>> teethCount = 8;
        attribute :>> toothPitch = 8.0;

        attribute hubType : HubType = HubType::AxleHole;
    }

    /**
     * Belt pulley wheel 24mm.
     * LEGO Design ID: 55817
     * Grooved pulley for rubber belt drive systems.
     */
    part def BeltWheel24 :> SprocketBase {
        doc /* 24mm pulley wheel for rubber belts */

        attribute :>> designId = "55817";
        attribute :>> partName = "Pulley Wheel 24 x 4";
        attribute :>> outerDiameter = 24.0;
        attribute :>> width = 4.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> color = "Light Bluish Gray";
        attribute :>> sprocketType = SprocketType::PulleyWheel;
        attribute :>> teethCount = 0;
        attribute :>> toothPitch = 0.0;

        // Pulley-specific attributes
        attribute grooveDepth : Real = 1.5;
        attribute grooveWidth : Real = 2.0;
        attribute hubType : HubType = HubType::AxleHole;
    }

    /**
     * Rubber belt definition.
     */
    part def BeltBase {
        doc /* Base rubber belt definition */

        // LEGO identification
        attribute designId : String;
        attribute partName : String;

        // Belt dimensions (mm)
        attribute length : Real;
        attribute width : Real;
        attribute thickness : Real;

        // Construction
        attribute material : WheelMaterial;
        attribute color : String;
    }

    /**
     * Rubber drive belt.
     * LEGO Design ID: 70905
     * Continuous rubber belt for pulley drive systems.
     */
    part def BeltRubber :> BeltBase {
        doc /* Rubber drive belt for pulley systems */

        attribute :>> designId = "70905";
        attribute :>> partName = "Rubber Belt Medium";
        attribute :>> length = 75.0;
        attribute :>> width = 3.0;
        attribute :>> thickness = 1.5;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Yellow";

        // Belt-specific attributes
        attribute stretchFactor : Real = 1.05;
        attribute minPulleyDiameter : Real = 12.0;
        attribute maxTension : Real = 5.0;
    }

    /**
     * Complete tracked drive assembly.
     * Represents one side of a tank-style drive system.
     */
    part def TrackedDriveUnit {
        doc /* Complete tracked drive unit assembly */

        // Sprocket components
        part driveSprocket : Sprocket40;
        part guideSprocket : Sprocket20;

        // Track components
        part trackLinks : TrackLinkLarge[1..*];

        // Configuration attributes
        attribute trackLength : Real;
        attribute sprocketCenterDistance : Real;
        attribute totalLinkCount : Integer;
    }

    /**
     * Dual tracked drive configuration.
     * Complete tank-style drive system with two track units.
     */
    part def DualTrackedDrive {
        doc /* Complete dual-track tank drive system */

        part leftTrack : TrackedDriveUnit;
        part rightTrack : TrackedDriveUnit;

        // Drive geometry
        attribute trackWidth : Real;
        attribute trackBase : Real;
        attribute groundContactLength : Real;

        // Performance characteristics
        attribute maxSpeed : Real;
        attribute turningRadius : Real;
    }

    /**
     * Belt drive assembly.
     * Power transmission system using pulleys and rubber belts.
     */
    part def BeltDriveAssembly {
        doc /* Belt drive power transmission assembly */

        part drivePulley : BeltWheel24;
        part drivenPulley : BeltWheel24;
        part belt : BeltRubber;

        // Configuration
        attribute centerDistance : Real;
        attribute gearRatio : Real;
        attribute beltTension : Real;
    }

}
