package EV3GearsSpecial {
    doc /*
     * LEGO Technic Special Gears for EV3 Mindstorms
     *
     * This package contains specialized gear types including:
     * - Worm gears for high reduction ratios
     * - Differential mechanisms for independent wheel drive
     * - Gear racks for linear motion conversion
     * - Turntables for rotational platforms
     * - Clutch/knob gears for selective engagement
     */

    import EV3Types::*;
    import EV3GearsStandard::GearProfile;
    import EV3GearsStandard::GearMaterial;
    import EV3GearsStandard::GearColor;

    // =========================================================================
    // Enumerations
    // =========================================================================

    /**
     * Worm gear thread configurations.
     */
    enum def WormThreadType {
        enum SingleStart;       // One thread, highest reduction
        enum DoubleStart;       // Two threads, lower reduction
        enum MultiStart;        // Multiple threads
    }

    /**
     * Differential operation modes.
     */
    enum def DifferentialMode {
        enum Open;              // Free differential
        enum Limited;           // Limited slip
        enum Locked;            // Locked axles
    }

    /**
     * Rack mounting orientations.
     */
    enum def RackOrientation {
        enum Horizontal;        // Standard linear motion
        enum Vertical;          // Lift mechanism
        enum Angled;            // Custom angle
    }

    // =========================================================================
    // Worm Gears
    // =========================================================================

    /**
     * Abstract base for worm gear elements.
     */
    abstract part def WormGearBase {
        // Identification
        attribute designId : String;
        attribute partName : String;

        // Geometry
        attribute lengthModules : Integer;
        attribute lengthMM : Real;
        attribute diameter : Real;
        attribute threadPitch : Real;                   // Distance per revolution

        // Thread configuration
        attribute threadType : WormThreadType;
        attribute threadStarts : Integer = 1;           // Number of thread starts

        // Profile
        attribute gearProfile : GearProfile = GearProfile::Worm;
        attribute pressureAngle : Real = 20.0;

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor;
        attribute weightGrams : Real;

        // Mechanical properties
        attribute maxTorqueNcm : Real;
        attribute efficiency : Real = 0.40;             // Worm gears have lower efficiency
        attribute selfLocking : Boolean = true;         // Cannot be back-driven

        // Mounting
        attribute axleHoleDiameter : Real = 4.8;
    }

    /**
     * Technic Worm Gear - Standard 1M worm.
     * LEGO Design ID: 4716
     *
     * Single-start worm gear providing very high reduction ratios.
     * Self-locking: load cannot back-drive the worm.
     * Ratio with 24T gear: 1:24 (one worm turn = 1 tooth advance)
     */
    part def WormGear :> WormGearBase {
        attribute :>> designId = "4716";
        attribute :>> partName = "Technic Worm Screw";
        attribute :>> lengthModules = 1;
        attribute :>> lengthMM = 8.0;
        attribute :>> diameter = 7.0;
        attribute :>> threadPitch = 8.0;                // 8mm per revolution (1 module)
        attribute :>> threadType = WormThreadType::SingleStart;
        attribute :>> threadStarts = 1;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 0.42;
        attribute :>> maxTorqueNcm = 5.0;               // Input torque limit
        attribute :>> efficiency = 0.35;
        attribute :>> selfLocking = true;

        // Gear ratios when meshed with standard gears
        attribute ratioWith8T : Real = 8.0;             // 1:8
        attribute ratioWith24T : Real = 24.0;           // 1:24
        attribute ratioWith40T : Real = 40.0;           // 1:40
    }

    /**
     * Technic Worm Gear 2L - Extended worm for longer engagement.
     * LEGO Design ID: 32905
     *
     * Two-module worm provides more contact area and smoother operation.
     */
    part def WormGear2L :> WormGearBase {
        attribute :>> designId = "32905";
        attribute :>> partName = "Technic Worm Screw Long";
        attribute :>> lengthModules = 2;
        attribute :>> lengthMM = 16.0;
        attribute :>> diameter = 7.0;
        attribute :>> threadPitch = 8.0;
        attribute :>> threadType = WormThreadType::SingleStart;
        attribute :>> threadStarts = 1;
        attribute :>> color = GearColor::DarkBluishGray;
        attribute :>> weightGrams = 0.78;
        attribute :>> maxTorqueNcm = 6.0;
        attribute :>> efficiency = 0.38;                // Slightly better with more contact
        attribute :>> selfLocking = true;

        // Extended engagement benefits
        attribute contactLength : Real = 16.0;          // Full 2M contact
        attribute smootherOperation : Boolean = true;
    }

    // =========================================================================
    // Differential Gears
    // =========================================================================

    /**
     * Technic Differential Housing - Complete differential assembly.
     * LEGO Design ID: 62821b
     *
     * Allows two output shafts to rotate at different speeds while
     * receiving power from a single input. Essential for wheeled vehicles
     * to handle turns without wheel slip.
     */
    part def Differential {
        // Identification
        attribute designId : String = "62821b";
        attribute partName : String = "Technic Differential New";

        // Housing geometry
        attribute housingDiameter : Real = 28.0;        // mm
        attribute housingWidth : Real = 16.0;           // mm (2 modules)
        attribute ringGearTeeth : Integer = 28;         // Internal ring gear

        // Configuration
        attribute differentialMode : DifferentialMode = DifferentialMode::Open;
        attribute inputType : String = "ring gear";     // Power input method
        attribute outputCount : Integer = 2;            // Two axle outputs

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor = GearColor::Black;
        attribute weightGrams : Real = 8.5;

        // Mechanical properties
        attribute maxInputTorqueNcm : Real = 30.0;
        attribute efficiency : Real = 0.92;

        // Internal components
        attribute spiderGearCount : Integer = 2;        // Internal bevel gears
        attribute sideGearCount : Integer = 2;          // Output bevel gears

        // Mounting
        attribute axleHoleDiameter : Real = 4.8;
    }

    /**
     * Technic Differential Gear 28 Tooth - Ring gear for differential.
     * LEGO Design ID: 65413
     *
     * External ring gear that meshes with the differential housing.
     * Provides the input drive to the differential mechanism.
     */
    part def DiffGear28T {
        // Identification
        attribute designId : String = "65413";
        attribute partName : String = "Technic Gear 28 Tooth Differential";

        // Gear geometry
        attribute toothCount : Integer = 28;
        attribute module : Real = 1.0;
        attribute pitchDiameter : Real = 28.0;
        attribute outsideDiameter : Real = 30.0;

        // Profile
        attribute gearProfile : GearProfile = GearProfile::Spur;

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor = GearColor::DarkBluishGray;
        attribute weightGrams : Real = 1.85;

        // Mechanical properties
        attribute maxTorqueNcm : Real = 20.0;
        attribute efficiency : Real = 0.94;

        // Mounting - clips onto differential housing
        attribute mountingType : String = "clip-on";
        attribute compatibleHousing : String = "62821b";
    }

    // =========================================================================
    // Turntables
    // =========================================================================

    /**
     * Technic Turntable Large 60 Tooth - Rotational platform.
     * LEGO Design ID: 18938c01
     *
     * Large turntable with internal gear teeth for powered rotation.
     * Used for rotating platforms, crane bases, and steering mechanisms.
     */
    part def Turntable60T {
        // Identification
        attribute designId : String = "18938c01";
        attribute partName : String = "Technic Turntable Large Type 3";

        // Gear geometry
        attribute toothCount : Integer = 60;
        attribute module : Real = 1.0;
        attribute pitchDiameter : Real = 60.0;          // Internal gear diameter
        attribute outsideDiameter : Real = 56.0;        // 7 studs = 56mm

        // Turntable geometry
        attribute platformDiameter : Real = 56.0;       // mm
        attribute totalHeight : Real = 16.0;            // mm (2 modules)
        attribute rotationAxis : String = "vertical";

        // Configuration
        attribute internalGear : Boolean = true;        // Gear teeth are internal
        attribute bearingType : String = "integrated";

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute topColor : GearColor = GearColor::Black;
        attribute bottomColor : GearColor = GearColor::LightBluishGray;
        attribute weightGrams : Real = 22.5;

        // Mechanical properties
        attribute maxAxialLoad : Real = 500.0;          // grams
        attribute maxRadialLoad : Real = 200.0;         // grams
        attribute rotationFriction : Real = 0.15;       // coefficient

        // Mounting
        attribute mountingHoles : Integer = 8;          // Technic pin holes
    }

    // =========================================================================
    // Gear Racks
    // =========================================================================

    /**
     * Abstract base for linear gear racks.
     */
    abstract part def GearRack {
        // Identification
        attribute designId : String;
        attribute partName : String;

        // Geometry
        attribute lengthModules : Integer;
        attribute lengthMM : Real;
        attribute toothCount : Integer;
        attribute module : Real = 1.0;
        attribute toothPitch : Real = 8.0;              // 1 module = 8mm

        // Profile
        attribute gearProfile : GearProfile = GearProfile::Rack;
        attribute pressureAngle : Real = 20.0;

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor;
        attribute weightGrams : Real;

        // Mechanical properties
        attribute maxLinearForce : Real;                // N
        attribute efficiency : Real = 0.95;

        // Mounting
        attribute mountingType : String;
        attribute orientation : RackOrientation = RackOrientation::Horizontal;
    }

    /**
     * Technic Gear Rack 1x4 - Short rack segment.
     * LEGO Design ID: 3743
     *
     * 4-module rack for compact linear mechanisms.
     * Linear travel per pinion revolution = pinion_teeth * module
     */
    part def GearRack1x4 :> GearRack {
        attribute :>> designId = "3743";
        attribute :>> partName = "Technic Gear Rack 1 x 4";
        attribute :>> lengthModules = 4;
        attribute :>> lengthMM = 32.0;
        attribute :>> toothCount = 4;
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 0.85;
        attribute :>> maxLinearForce = 5.0;
        attribute :>> mountingType = "stud";

        // Travel calculations
        attribute travelWith8T : Real = 64.0;           // mm per 8T rotation
        attribute travelWith16T : Real = 128.0;         // mm per 16T rotation
    }

    /**
     * Technic Gear Rack 1x13 - Long rack segment.
     * LEGO Design ID: 64781
     *
     * Extended rack for longer linear travel requirements.
     */
    part def GearRack1x13 :> GearRack {
        attribute :>> designId = "64781";
        attribute :>> partName = "Technic Gear Rack 1 x 13";
        attribute :>> lengthModules = 13;
        attribute :>> lengthMM = 104.0;
        attribute :>> toothCount = 13;
        attribute :>> color = GearColor::LightBluishGray;
        attribute :>> weightGrams = 2.65;
        attribute :>> maxLinearForce = 8.0;
        attribute :>> mountingType = "stud";

        // Longer rack provides extended travel
        attribute maxTravelMM : Real = 104.0;
    }

    // =========================================================================
    // Clutch and Knob Gears
    // =========================================================================

    /**
     * Technic Knob Wheel - Clutch/slip gear.
     * LEGO Design ID: 32072
     *
     * Gear designed to slip under excessive torque, protecting mechanisms
     * from damage. Also used for manual adjustment interfaces.
     */
    part def KnobWheel {
        // Identification
        attribute designId : String = "32072";
        attribute partName : String = "Technic Knob Wheel";

        // Geometry
        attribute toothCount : Integer = 8;             // Knob count
        attribute diameter : Real = 24.0;               // mm
        attribute hubDiameter : Real = 8.0;             // mm

        // Profile - not a standard gear profile
        attribute gearProfile : GearProfile = GearProfile::Spur;
        attribute knobProfile : String = "rounded";     // Rounded knob teeth

        // Physical properties
        attribute material : GearMaterial = GearMaterial::ABS;
        attribute color : GearColor = GearColor::LightBluishGray;
        attribute weightGrams : Real = 1.15;

        // Clutch properties
        attribute slipTorqueNcm : Real = 8.0;           // Torque at which slipping occurs
        attribute engagementForce : Real = 2.0;         // N, axial force for engagement

        // Mechanical properties
        attribute maxSpeedRPM : Real = 100.0;           // Recommended max for clutch use
        attribute wearResistance : String = "moderate";

        // Mounting
        attribute axleHoleDiameter : Real = 4.8;
        attribute canFreewheel : Boolean = true;        // Can rotate freely on axle
    }

    // =========================================================================
    // Special Gear Assemblies
    // =========================================================================

    /**
     * Worm gear drive assembly for high-ratio reduction.
     */
    part def WormDriveAssembly {
        part worm : WormGearBase;
        part wheel : EV3GearsStandard::SpurGear;

        attribute gearRatio : Real;                     // wheel_teeth : worm_starts
        attribute isSelfLocking : Boolean = true;
        attribute driveEfficiency : Real;
        attribute reversible : Boolean = false;         // Cannot back-drive
    }

    /**
     * Rack and pinion assembly for linear motion.
     */
    part def RackAndPinion {
        part rack : GearRack;
        part pinion : EV3GearsStandard::SpurGear;

        attribute linearTravelPerRevolution : Real;     // mm
        attribute maxLinearSpeed : Real;                // mm/s
        attribute maxLinearForce : Real;                // N
        attribute driveEfficiency : Real;
    }

    /**
     * Differential drive assembly for wheeled robots.
     */
    part def DifferentialDriveAssembly {
        part differential : Differential;
        part ringGear : DiffGear28T;
        part driveGear : EV3GearsStandard::SpurGear;

        attribute inputRatio : Real;                    // drive gear to ring gear
        attribute leftAxleSpeed : Real;                 // Output speed left
        attribute rightAxleSpeed : Real;                // Output speed right
        attribute assemblyEfficiency : Real;
    }

    // =========================================================================
    // Special Gear Ratio Reference
    // =========================================================================

    /**
     * Reference table for special gear combinations.
     */
    part def SpecialGearRatios {
        // Worm gear ratios (extremely high reduction)
        attribute worm_8T : Real = 8.0;                 // 1:8, self-locking
        attribute worm_16T : Real = 16.0;               // 1:16, self-locking
        attribute worm_24T : Real = 24.0;               // 1:24, self-locking
        attribute worm_40T : Real = 40.0;               // 1:40, self-locking

        // Compound worm ratios
        attribute worm_worm_24_24 : Real = 576.0;       // 1:576 (two worm stages)

        // Rack and pinion travel (mm per revolution)
        attribute rack_8T_travel : Real = 64.0;         // 8 * 8mm = 64mm
        attribute rack_16T_travel : Real = 128.0;       // 16 * 8mm = 128mm
        attribute rack_24T_travel : Real = 192.0;       // 24 * 8mm = 192mm

        // Turntable ratios (internal 60T gear)
        attribute turntable_8T : Real = 7.5;            // 60:8 = 7.5:1
        attribute turntable_16T : Real = 3.75;          // 60:16 = 3.75:1
        attribute turntable_24T : Real = 2.5;           // 60:24 = 2.5:1
    }
}
