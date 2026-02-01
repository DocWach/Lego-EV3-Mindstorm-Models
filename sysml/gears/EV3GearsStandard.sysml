package EV3GearsStandard {
    doc /*
     * LEGO Technic Standard Spur Gears for EV3 Mindstorms
     *
     * Spur gears are the most common gear type, featuring straight teeth
     * parallel to the axis of rotation. They provide efficient power
     * transmission between parallel shafts.
     *
     * Gear module (pitch): 1M = 1mm pitch diameter per tooth
     * Standard LEGO Technic gears use module 1 (m=1).
     */

    import EV3Types::*;

    // =========================================================================
    // Enumerations
    // =========================================================================

    /**
     * Gear tooth profile types.
     */
    enum def GearProfile {
        enum Spur;              // Straight teeth, parallel to axis
        enum Helical;           // Angled teeth for smoother operation
        enum Bevel;             // Conical for angle transmission
        enum Worm;              // Screw-type for high reduction
        enum Rack;              // Linear gear for translation
    }

    /**
     * Gear material options.
     */
    enum def GearMaterial {
        enum ABS;               // Standard plastic
        enum Reinforced;        // Glass-fiber reinforced
        enum Nylon;             // Low friction variant
    }

    /**
     * Gear color variants.
     */
    enum def GearColor {
        enum LightBluishGray;
        enum DarkBluishGray;
        enum Black;
        enum Tan;
        enum White;
        enum Red;
    }

    // =========================================================================
    // Abstract Base Definitions
    // =========================================================================

    /**
     * Abstract base definition for all Technic gears.
     * Defines common attributes for gear calculations and compatibility.
     */
    abstract part def TechnicGear {
        // Identification
        attribute designId : String;
        attribute partName : String;

        // Gear geometry
        attribute toothCount : Integer;                 // Number of teeth (Z)
        attribute module : Real = 1.0;                  // Gear module (m) in mm
        attribute pitchDiameter : Real;                 // d = m * Z (mm)
        attribute outsideDiameter : Real;               // d_o = m * (Z + 2) (mm)
        attribute rootDiameter : Real;                  // d_r = m * (Z - 2.5) (mm)
        attribute faceWidth : Real;                     // Tooth width (mm)

        // Profile
        attribute gearProfile : GearProfile;
        attribute pressureAngle : Real = 20.0;          // Standard pressure angle (degrees)

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor;
        attribute weightGrams : Real;

        // Mechanical properties
        attribute maxTorqueNcm : Real;                  // Maximum recommended torque
        attribute efficiency : Real = 0.95;             // Power transmission efficiency
    }

    /**
     * Spur gear base - straight teeth parallel to axis.
     */
    abstract part def SpurGear :> TechnicGear {
        attribute :>> gearProfile = GearProfile::Spur;

        // Spur gears work with parallel shafts
        attribute axleHoleDiameter : Real = 4.8;        // Standard Technic axle hole
        attribute hubThickness : Real;                  // Central hub dimension
    }

    // =========================================================================
    // Standard Spur Gears
    // =========================================================================

    /**
     * Technic Gear 8 Tooth - Smallest standard spur gear.
     * LEGO Design ID: 10928
     *
     * High speed, low torque gear. Often used as driver gear
     * for speed reduction when paired with larger gears.
     * Gear ratio examples: 8:24 = 1:3, 8:40 = 1:5
     */
    part def Gear8T :> SpurGear {
        attribute :>> designId = "10928";
        attribute :>> partName = "Technic Gear 8 Tooth";
        attribute :>> toothCount = 8;
        attribute :>> pitchDiameter = 8.0;              // 1.0 * 8 = 8mm
        attribute :>> outsideDiameter = 10.0;           // 1.0 * (8 + 2) = 10mm
        attribute :>> rootDiameter = 5.5;               // 1.0 * (8 - 2.5) = 5.5mm
        attribute :>> faceWidth = 4.0;
        attribute :>> hubThickness = 8.0;               // 1 module width
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 0.35;
        attribute :>> maxTorqueNcm = 8.0;
        attribute :>> efficiency = 0.94;

        // Derived calculations
        attribute diameterModules : Integer = 1;        // Diameter in LEGO modules
    }

    /**
     * Technic Gear 16 Tooth - Common small/medium spur gear.
     * LEGO Design ID: 94925
     *
     * Versatile gear for moderate speed/torque applications.
     * Gear ratio examples: 16:24 = 2:3, 16:40 = 2:5
     */
    part def Gear16T :> SpurGear {
        attribute :>> designId = "94925";
        attribute :>> partName = "Technic Gear 16 Tooth";
        attribute :>> toothCount = 16;
        attribute :>> pitchDiameter = 16.0;             // 1.0 * 16 = 16mm
        attribute :>> outsideDiameter = 18.0;           // 1.0 * (16 + 2) = 18mm
        attribute :>> rootDiameter = 13.5;              // 1.0 * (16 - 2.5) = 13.5mm
        attribute :>> faceWidth = 4.0;
        attribute :>> hubThickness = 8.0;               // 1 module width
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 0.72;
        attribute :>> maxTorqueNcm = 12.0;
        attribute :>> efficiency = 0.95;

        attribute diameterModules : Integer = 2;        // Diameter in LEGO modules
    }

    /**
     * Technic Gear 24 Tooth - Standard medium spur gear.
     * LEGO Design ID: 3648
     *
     * Common driven gear for moderate gear reductions.
     * Gear ratio examples: 8:24 = 1:3, 24:40 = 3:5
     */
    part def Gear24T :> SpurGear {
        attribute :>> designId = "3648";
        attribute :>> partName = "Technic Gear 24 Tooth";
        attribute :>> toothCount = 24;
        attribute :>> pitchDiameter = 24.0;             // 1.0 * 24 = 24mm
        attribute :>> outsideDiameter = 26.0;           // 1.0 * (24 + 2) = 26mm
        attribute :>> rootDiameter = 21.5;              // 1.0 * (24 - 2.5) = 21.5mm
        attribute :>> faceWidth = 4.0;
        attribute :>> hubThickness = 8.0;               // 1 module width
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 1.28;
        attribute :>> maxTorqueNcm = 18.0;
        attribute :>> efficiency = 0.95;

        attribute diameterModules : Integer = 3;        // Diameter in LEGO modules
    }

    /**
     * Technic Gear 40 Tooth - Large spur gear.
     * LEGO Design ID: 3649
     *
     * High torque driven gear for significant speed reduction.
     * Gear ratio examples: 8:40 = 1:5, 16:40 = 2:5
     */
    part def Gear40T :> SpurGear {
        attribute :>> designId = "3649";
        attribute :>> partName = "Technic Gear 40 Tooth";
        attribute :>> toothCount = 40;
        attribute :>> pitchDiameter = 40.0;             // 1.0 * 40 = 40mm
        attribute :>> outsideDiameter = 42.0;           // 1.0 * (40 + 2) = 42mm
        attribute :>> rootDiameter = 37.5;              // 1.0 * (40 - 2.5) = 37.5mm
        attribute :>> faceWidth = 4.0;
        attribute :>> hubThickness = 8.0;               // 1 module width
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 2.85;
        attribute :>> maxTorqueNcm = 25.0;
        attribute :>> efficiency = 0.96;

        attribute diameterModules : Integer = 5;        // Diameter in LEGO modules
    }

    // =========================================================================
    // Gear Train Assemblies
    // =========================================================================

    /**
     * Simple gear pair for direct speed/torque conversion.
     */
    part def GearPair {
        part driverGear : SpurGear;
        part drivenGear : SpurGear;

        // Calculated gear ratio (driven/driver)
        attribute gearRatio : Real;

        // Center distance between axles
        attribute centerDistance : Real;                // (d1 + d2) / 2 in mm

        // Efficiency of the pair
        attribute pairEfficiency : Real;
    }

    /**
     * Compound gear train with multiple stages.
     */
    part def CompoundGearTrain {
        // Gear stages (each stage is a gear pair)
        attribute stageCount : Integer;

        // Overall gear ratio (product of all stage ratios)
        attribute totalGearRatio : Real;

        // Overall efficiency (product of all stage efficiencies)
        attribute totalEfficiency : Real;
    }

    // =========================================================================
    // Gear Ratio Calculations
    // =========================================================================

    /**
     * Common gear ratio configurations for EV3 robots.
     */
    part def StandardGearRatios {
        // Speed increase ratios (torque reduction)
        attribute speedUp_3to1 : Real = 0.333;          // 24:8 = 3:1 driver advantage
        attribute speedUp_5to1 : Real = 0.200;          // 40:8 = 5:1 driver advantage

        // Torque increase ratios (speed reduction)
        attribute torqueUp_1to3 : Real = 3.0;           // 8:24 = 1:3 gear reduction
        attribute torqueUp_1to5 : Real = 5.0;           // 8:40 = 1:5 gear reduction
        attribute torqueUp_2to5 : Real = 2.5;           // 16:40 = 2:5 gear reduction
        attribute torqueUp_3to5 : Real = 1.667;         // 24:40 = 3:5 gear reduction

        // Common compound ratios
        attribute compound_1to9 : Real = 9.0;           // 8:24:8:24 = 1:9
        attribute compound_1to25 : Real = 25.0;         // 8:40:8:40 = 1:25
    }
}
