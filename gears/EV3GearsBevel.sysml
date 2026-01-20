package EV3GearsBevel {
    doc /*
     * LEGO Technic Bevel and Conical Gears for EV3 Mindstorms
     *
     * Bevel gears transmit power between shafts at an angle, typically 90 degrees.
     * They are essential for changing the direction of rotation in mechanisms.
     *
     * Types:
     * - Single Bevel: Teeth on one conical face, meshes with another bevel gear
     * - Double Bevel: Teeth on both faces, can mesh from either side
     * - Half Bevel: Partial bevel for specific applications
     */

    import EV3Types::*;
    import EV3GearsStandard::GearProfile;
    import EV3GearsStandard::GearMaterial;
    import EV3GearsStandard::GearColor;

    // =========================================================================
    // Enumerations
    // =========================================================================

    /**
     * Bevel gear configuration types.
     */
    enum def BevelType {
        enum SingleBevel;       // Teeth on one face only
        enum DoubleBevel;       // Teeth on both faces
        enum HalfBevel;         // Partial bevel coverage
        enum Mitre;             // Equal-sized bevel pair (1:1 ratio)
    }

    /**
     * Shaft angle configurations for bevel gears.
     */
    enum def ShaftAngle {
        enum Perpendicular;     // 90 degree shaft angle
        enum Acute;             // Less than 90 degrees
        enum Obtuse;            // Greater than 90 degrees
    }

    // =========================================================================
    // Abstract Base Definitions
    // =========================================================================

    /**
     * Abstract base definition for bevel gears.
     */
    abstract part def BevelGear {
        // Identification
        attribute designId : String;
        attribute partName : String;

        // Gear geometry
        attribute toothCount : Integer;
        attribute module : Real = 1.0;
        attribute pitchDiameter : Real;
        attribute outsideDiameter : Real;
        attribute coneAngle : Real;                     // Half angle of pitch cone (degrees)

        // Bevel configuration
        attribute bevelType : BevelType;
        attribute shaftAngle : ShaftAngle = ShaftAngle::Perpendicular;
        attribute meshingAngle : Real = 90.0;           // Angle between meshing shafts

        // Profile
        attribute gearProfile : GearProfile = GearProfile::Bevel;
        attribute pressureAngle : Real = 20.0;

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor;
        attribute weightGrams : Real;

        // Mechanical properties
        attribute maxTorqueNcm : Real;
        attribute efficiency : Real = 0.90;             // Bevel gears slightly less efficient

        // Mounting
        attribute axleHoleDiameter : Real = 4.8;        // Standard Technic axle hole
    }

    // =========================================================================
    // Single Bevel Gears
    // =========================================================================

    /**
     * Technic Bevel Gear 12 Tooth - Single bevel for 90-degree transmission.
     * LEGO Design ID: 6589
     *
     * Small single-face bevel gear. Must be paired with another bevel gear.
     * Common use: Steering mechanisms, differential inputs.
     */
    part def Bevel12T :> BevelGear {
        attribute :>> designId = "6589";
        attribute :>> partName = "Technic Gear 12 Tooth Bevel";
        attribute :>> toothCount = 12;
        attribute :>> pitchDiameter = 12.0;
        attribute :>> outsideDiameter = 14.0;
        attribute :>> coneAngle = 45.0;
        attribute :>> bevelType = BevelType::SingleBevel;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 0.62;
        attribute :>> maxTorqueNcm = 10.0;
        attribute :>> efficiency = 0.88;

        // Single bevel specific
        attribute teethFace : String = "front";         // Teeth on front face only
    }

    // =========================================================================
    // Double Bevel Gears
    // =========================================================================

    /**
     * Technic Double Bevel Gear 12 Tooth - Versatile small bevel.
     * LEGO Design ID: 32270
     *
     * Can mesh with bevel gears from either side, providing flexibility
     * in mechanism design. Same tooth count allows 1:1 ratio pairs.
     */
    part def DoubleBevel12T :> BevelGear {
        attribute :>> designId = "32270";
        attribute :>> partName = "Technic Gear 12 Tooth Double Bevel";
        attribute :>> toothCount = 12;
        attribute :>> pitchDiameter = 12.0;
        attribute :>> outsideDiameter = 14.0;
        attribute :>> coneAngle = 45.0;
        attribute :>> bevelType = BevelType::DoubleBevel;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 0.68;
        attribute :>> maxTorqueNcm = 10.0;
        attribute :>> efficiency = 0.89;

        // Double bevel can mesh from either direction
        attribute bidirectionalMesh : Boolean = true;
    }

    /**
     * Technic Double Bevel Gear 20 Tooth - Medium double bevel.
     * LEGO Design ID: 32269
     *
     * Common gear for differential mechanisms and angle drives.
     * Pairs well with 12T for 12:20 ratio or another 20T for 1:1.
     * Gear ratio with 12T: 12:20 = 0.6 (speed reduction)
     */
    part def DoubleBevel20T :> BevelGear {
        attribute :>> designId = "32269";
        attribute :>> partName = "Technic Gear 20 Tooth Double Bevel";
        attribute :>> toothCount = 20;
        attribute :>> pitchDiameter = 20.0;
        attribute :>> outsideDiameter = 22.0;
        attribute :>> coneAngle = 45.0;
        attribute :>> bevelType = BevelType::DoubleBevel;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 1.12;
        attribute :>> maxTorqueNcm = 15.0;
        attribute :>> efficiency = 0.90;

        attribute bidirectionalMesh : Boolean = true;
    }

    /**
     * Technic Double Bevel Gear 36 Tooth - Large double bevel.
     * LEGO Design ID: 35185
     *
     * Large bevel gear for high-torque angle transmission.
     * Provides significant gear reduction when paired with smaller bevels.
     * Gear ratio with 12T: 12:36 = 1:3 (torque increase)
     */
    part def DoubleBevel36T :> BevelGear {
        attribute :>> designId = "35185";
        attribute :>> partName = "Technic Gear 36 Tooth Double Bevel";
        attribute :>> toothCount = 36;
        attribute :>> pitchDiameter = 36.0;
        attribute :>> outsideDiameter = 38.0;
        attribute :>> coneAngle = 45.0;
        attribute :>> bevelType = BevelType::DoubleBevel;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 2.45;
        attribute :>> maxTorqueNcm = 22.0;
        attribute :>> efficiency = 0.91;

        attribute bidirectionalMesh : Boolean = true;
    }

    // =========================================================================
    // Half Bevel Gears
    // =========================================================================

    /**
     * Technic Half Bevel Gear 20 Tooth - Knob wheel/clutch gear.
     * LEGO Design ID: 87407
     *
     * Partial bevel gear that can engage/disengage along the axis.
     * Used for selective power transmission and clutch mechanisms.
     * The half-bevel profile allows for axial engagement.
     */
    part def BevelHalf20T :> BevelGear {
        attribute :>> designId = "87407";
        attribute :>> partName = "Technic Gear 20 Tooth Half Bevel";
        attribute :>> toothCount = 20;
        attribute :>> pitchDiameter = 20.0;
        attribute :>> outsideDiameter = 22.0;
        attribute :>> coneAngle = 22.5;                 // Shallower cone for half bevel
        attribute :>> bevelType = BevelType::HalfBevel;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 0.95;
        attribute :>> maxTorqueNcm = 12.0;
        attribute :>> efficiency = 0.85;

        // Half bevel specific properties
        attribute engagementTravel : Real = 4.0;        // Axial travel for engagement (mm)
        attribute canDisengage : Boolean = true;        // Supports clutch operation
    }

    // =========================================================================
    // Bevel Gear Assemblies
    // =========================================================================

    /**
     * Mitre gear pair - Two identical bevel gears at 90 degrees.
     * Provides 1:1 ratio with direction change.
     */
    part def MitreGearPair {
        part gear1 : BevelGear;
        part gear2 : BevelGear;

        attribute gearRatio : Real = 1.0;               // Mitre pairs are always 1:1
        attribute shaftAngle : Real = 90.0;             // Perpendicular shafts
        attribute pairEfficiency : Real;
    }

    /**
     * Bevel gear pair for angled power transmission.
     */
    part def BevelGearPair {
        part driverGear : BevelGear;
        part drivenGear : BevelGear;

        attribute gearRatio : Real;                     // driven/driver tooth count
        attribute shaftAngle : Real = 90.0;
        attribute pairEfficiency : Real;

        // Mounting distance
        attribute mountingDistance : Real;              // Distance from pitch apex
    }

    /**
     * Right-angle drive using bevel gears.
     * Common configuration for changing drive direction.
     */
    part def RightAngleDrive {
        part inputBevel : BevelGear;
        part outputBevel : BevelGear;

        attribute inputShaftAxis : String;              // e.g., "X"
        attribute outputShaftAxis : String;             // e.g., "Y" (perpendicular)
        attribute totalRatio : Real;
        attribute driveEfficiency : Real;
    }

    // =========================================================================
    // Common Bevel Gear Ratios
    // =========================================================================

    /**
     * Standard bevel gear ratio configurations.
     */
    part def BevelGearRatios {
        // Mitre (1:1) configurations
        attribute mitre_12_12 : Real = 1.0;             // 12T:12T
        attribute mitre_20_20 : Real = 1.0;             // 20T:20T

        // Speed reduction (torque increase)
        attribute ratio_12_20 : Real = 1.667;           // 12T:20T = 1:1.667
        attribute ratio_12_36 : Real = 3.0;             // 12T:36T = 1:3
        attribute ratio_20_36 : Real = 1.8;             // 20T:36T = 1:1.8

        // Speed increase (torque reduction)
        attribute ratio_20_12 : Real = 0.6;             // 20T:12T = 1:0.6
        attribute ratio_36_12 : Real = 0.333;           // 36T:12T = 1:0.333
        attribute ratio_36_20 : Real = 0.556;           // 36T:20T = 1:0.556
    }
}
