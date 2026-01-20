package EV3Tires {
    doc /*
     * EV3 Tire Definitions
     *
     * This package defines the rubber tires compatible with the
     * LEGO Mindstorms EV3 wheel rims. Tires provide traction and
     * cushioning for robot mobility.
     */

    import ScalarValues::*;
    import EV3Wheels::*;

    /**
     * Tire tread pattern types.
     */
    enum def TreadPattern {
        enum Smooth;        // No tread pattern
        enum Ribbed;        // Parallel ribs
        enum Knobby;        // Off-road knobs
        enum Herringbone;   // V-pattern tread
        enum Slick;         // Racing smooth
    }

    /**
     * Abstract base definition for EV3 tires.
     * Provides common attributes for all tire types.
     */
    abstract part def EV3TireBase {
        doc /* Base tire definition with common attributes */

        // LEGO identification
        attribute designId : String;
        attribute partName : String;

        // Physical dimensions (mm)
        attribute outerDiameter : Real;
        attribute width : Real;
        attribute innerDiameter : Real;

        // Construction
        attribute material : WheelMaterial;
        attribute color : String;
        attribute treadPattern : TreadPattern;

        // Compatibility
        attribute fitsRim : String;
    }

    /**
     * Extra-small tire 14x4mm.
     * LEGO Design ID: 59895
     * Tiny tire for small mechanisms and precision applications.
     */
    part def Tire14x4 :> EV3TireBase {
        doc /* 14mm outer diameter x 4mm width tire */

        attribute :>> designId = "59895";
        attribute :>> partName = "Tire 14 x 4";
        attribute :>> outerDiameter = 14.0;
        attribute :>> width = 4.0;
        attribute :>> innerDiameter = 11.2;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Smooth;
        attribute :>> fitsRim = "Rim11x8";

        // Tire-specific attributes
        attribute wallThickness : Real = 1.4;
    }

    /**
     * Small tire 24x14mm.
     * LEGO Design ID: 30028
     * Compact tire for light-duty robots.
     */
    part def Tire24x14 :> EV3TireBase {
        doc /* 24mm outer diameter x 14mm width tire */

        attribute :>> designId = "30028";
        attribute :>> partName = "Tire 24 x 14";
        attribute :>> outerDiameter = 24.0;
        attribute :>> width = 14.0;
        attribute :>> innerDiameter = 18.0;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Smooth;
        attribute :>> fitsRim = "Rim18x14";

        attribute wallThickness : Real = 3.0;
    }

    /**
     * Medium tire 43x22mm.
     * LEGO Design ID: 44309
     * Popular tire for EV3 starter robots.
     */
    part def Tire43x22 :> EV3TireBase {
        doc /* 43mm outer diameter x 22mm width tire */

        attribute :>> designId = "44309";
        attribute :>> partName = "Tire 43.2 x 22";
        attribute :>> outerDiameter = 43.0;
        attribute :>> width = 22.0;
        attribute :>> innerDiameter = 30.0;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Ribbed;
        attribute :>> fitsRim = "Rim30x20";

        attribute wallThickness : Real = 6.5;
    }

    /**
     * Large tire 56x28mm.
     * LEGO Design ID: 41897
     * High-traction tire for demanding applications.
     */
    part def Tire56x28 :> EV3TireBase {
        doc /* 56mm outer diameter x 28mm width tire */

        attribute :>> designId = "41897";
        attribute :>> partName = "Tire 56 x 28";
        attribute :>> outerDiameter = 56.0;
        attribute :>> width = 28.0;
        attribute :>> innerDiameter = 43.2;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Knobby;
        attribute :>> fitsRim = "Rim43x26";

        attribute wallThickness : Real = 6.4;
    }

    /**
     * Extra-large tire 68x36mm.
     * LEGO Design ID: 44771
     * Largest standard tire for maximum traction.
     */
    part def Tire68x36 :> EV3TireBase {
        doc /* 68.8mm outer diameter x 36mm width tire */

        attribute :>> designId = "44771";
        attribute :>> partName = "Tire 68.8 x 36";
        attribute :>> outerDiameter = 68.8;
        attribute :>> width = 36.0;
        attribute :>> innerDiameter = 56.0;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Knobby;
        attribute :>> fitsRim = "Rim56x34";

        attribute wallThickness : Real = 6.4;
    }

    /**
     * Balloon tire 81x15mm.
     * LEGO Design ID: 2903
     * Wide balloon-style tire for soft terrain.
     */
    part def Tire81x15 :> EV3TireBase {
        doc /* 81.6mm outer diameter x 15mm width balloon tire */

        attribute :>> designId = "2903";
        attribute :>> partName = "Tire 81.6 x 15 Balloon";
        attribute :>> outerDiameter = 81.6;
        attribute :>> width = 15.0;
        attribute :>> innerDiameter = 56.0;
        attribute :>> material = WheelMaterial::Rubber;
        attribute :>> color = "Black";
        attribute :>> treadPattern = TreadPattern::Smooth;
        attribute :>> fitsRim = "Balloon";

        attribute wallThickness : Real = 12.8;
        attribute isBalloon : Boolean = true;
    }

    /**
     * Complete wheel with tire mounted on rim.
     * Represents an assembled wheel ready for robot use.
     */
    part def CompleteWheel {
        doc /* Assembled wheel with rim and tire */

        part rim : EV3WheelRimBase;
        part tire : EV3TireBase;

        // Computed total dimensions
        attribute totalDiameter : Real;
        attribute totalWidth : Real;

        // Rolling characteristics
        attribute circumference : Real;
        attribute rollingRadius : Real;
    }

    /**
     * Standard EV3 drive wheel assembly.
     * Commonly used configuration with 43mm tire on 30mm rim.
     */
    part def EV3StandardDriveWheel :> CompleteWheel {
        doc /* Standard EV3 drive wheel: 43mm tire on 30mm rim */

        part :>> rim : Rim30x20;
        part :>> tire : Tire43x22;

        attribute :>> totalDiameter = 43.0;
        attribute :>> totalWidth = 22.0;
        attribute :>> circumference = 135.1;
        attribute :>> rollingRadius = 21.5;
    }

    /**
     * Large EV3 drive wheel assembly.
     * High-traction configuration with 56mm tire.
     */
    part def EV3LargeDriveWheel :> CompleteWheel {
        doc /* Large EV3 drive wheel: 56mm tire on 43mm rim */

        part :>> rim : Rim43x26;
        part :>> tire : Tire56x28;

        attribute :>> totalDiameter = 56.0;
        attribute :>> totalWidth = 28.0;
        attribute :>> circumference = 175.9;
        attribute :>> rollingRadius = 28.0;
    }

}
