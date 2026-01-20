package EV3Axles {
    doc /*
     * LEGO Technic Axles for EV3 Mindstorms
     *
     * Axles are the primary power transmission elements in Technic builds.
     * They connect gears, wheels, and other rotating components.
     * Length is measured in LEGO Modules (M), where 1M = 8mm.
     */

    import EV3Types::*;

    // =========================================================================
    // Enumerations
    // =========================================================================

    /**
     * Axle color variants available in Technic sets.
     */
    enum def AxleColor {
        enum Black;
        enum Red;
        enum Tan;
        enum Yellow;
        enum LightBluishGray;
    }

    /**
     * Material composition of axles.
     */
    enum def AxleMaterial {
        enum ABS;           // Standard plastic
        enum Reinforced;    // Glass-fiber reinforced
    }

    /**
     * Type of axle end configuration.
     */
    enum def AxleEndType {
        enum Plain;         // Standard cross-section end
        enum Stop;          // Built-in stop collar
        enum Stud;          // Technic stud connector
    }

    // =========================================================================
    // Abstract Base Definitions
    // =========================================================================

    /**
     * Abstract base definition for all Technic axles.
     * Defines common attributes shared across all axle types.
     */
    abstract part def TechnicAxle {
        // Identification
        attribute designId : String;
        attribute partName : String;

        // Physical dimensions
        attribute lengthModules : Integer;              // Length in LEGO modules (M)
        attribute lengthMM : Real;                      // Length in millimeters
        attribute crossSection : Real = 4.8;            // Cross axle width in mm

        // Configuration
        attribute color : AxleColor;
        attribute material : AxleMaterial = AxleMaterial::ABS;
        attribute endType : AxleEndType = AxleEndType::Plain;
        attribute hasStop : Boolean = false;

        // Mechanical properties
        attribute maxTorqueNcm : Real = 20.0;           // Max recommended torque
        attribute weightGrams : Real;                   // Part weight
    }

    /**
     * Standard axle without stop - basic power transmission.
     */
    abstract part def StandardAxle :> TechnicAxle {
        attribute :>> endType = AxleEndType::Plain;
        attribute :>> hasStop = false;
    }

    /**
     * Axle with integrated stop collar to prevent sliding.
     */
    abstract part def AxleWithStop :> TechnicAxle {
        attribute :>> endType = AxleEndType::Stop;
        attribute :>> hasStop = true;
        attribute stopPosition : Real;                  // Distance from end to stop (mm)
    }

    // =========================================================================
    // Standard Axles (No Stop)
    // =========================================================================

    /**
     * Technic Axle 2L - Shortest standard axle.
     * LEGO Design ID: 32062
     * Commonly used for short connections and compact mechanisms.
     */
    part def Axle2L :> StandardAxle {
        attribute :>> designId = "32062";
        attribute :>> partName = "Technic Axle 2";
        attribute :>> lengthModules = 2;
        attribute :>> lengthMM = 16.0;
        attribute :>> color = AxleColor::Red;
        attribute :>> weightGrams = 0.26;
        attribute :>> maxTorqueNcm = 15.0;
    }

    /**
     * Technic Axle 3L - Short axle for compact builds.
     * LEGO Design ID: 4519
     */
    part def Axle3L :> StandardAxle {
        attribute :>> designId = "4519";
        attribute :>> partName = "Technic Axle 3";
        attribute :>> lengthModules = 3;
        attribute :>> lengthMM = 24.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.39;
        attribute :>> maxTorqueNcm = 18.0;
    }

    /**
     * Technic Axle 3L with Stud - For connecting to studded elements.
     * LEGO Design ID: 6587
     * Features a Technic stud on one end for hybrid connections.
     */
    part def Axle3LWithStud :> TechnicAxle {
        attribute :>> designId = "6587";
        attribute :>> partName = "Technic Axle 3 with Stud";
        attribute :>> lengthModules = 3;
        attribute :>> lengthMM = 24.0;
        attribute :>> color = AxleColor::Tan;
        attribute :>> endType = AxleEndType::Stud;
        attribute :>> hasStop = false;
        attribute :>> weightGrams = 0.44;
        attribute studDiameter : Real = 4.8;            // Standard stud diameter
    }

    /**
     * Technic Axle 4L - Common medium-length axle.
     * LEGO Design ID: 3705
     */
    part def Axle4L :> StandardAxle {
        attribute :>> designId = "3705";
        attribute :>> partName = "Technic Axle 4";
        attribute :>> lengthModules = 4;
        attribute :>> lengthMM = 32.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.52;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 5L - Medium axle.
     * LEGO Design ID: 32073
     */
    part def Axle5L :> StandardAxle {
        attribute :>> designId = "32073";
        attribute :>> partName = "Technic Axle 5";
        attribute :>> lengthModules = 5;
        attribute :>> lengthMM = 40.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.65;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 6L - Standard working axle.
     * LEGO Design ID: 3706
     * Most common axle length for general mechanisms.
     */
    part def Axle6L :> StandardAxle {
        attribute :>> designId = "3706";
        attribute :>> partName = "Technic Axle 6";
        attribute :>> lengthModules = 6;
        attribute :>> lengthMM = 48.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.78;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 7L - Extended medium axle.
     * LEGO Design ID: 44294
     */
    part def Axle7L :> StandardAxle {
        attribute :>> designId = "44294";
        attribute :>> partName = "Technic Axle 7";
        attribute :>> lengthModules = 7;
        attribute :>> lengthMM = 56.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.91;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 8L - Long axle for larger builds.
     * LEGO Design ID: 3707
     */
    part def Axle8L :> StandardAxle {
        attribute :>> designId = "3707";
        attribute :>> partName = "Technic Axle 8";
        attribute :>> lengthModules = 8;
        attribute :>> lengthMM = 64.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 1.04;
        attribute :>> maxTorqueNcm = 18.0;
    }

    /**
     * Technic Axle 9L - Extended axle.
     * LEGO Design ID: 60485
     */
    part def Axle9L :> StandardAxle {
        attribute :>> designId = "60485";
        attribute :>> partName = "Technic Axle 9";
        attribute :>> lengthModules = 9;
        attribute :>> lengthMM = 72.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 1.17;
        attribute :>> maxTorqueNcm = 18.0;
    }

    /**
     * Technic Axle 10L - Long axle.
     * LEGO Design ID: 3737
     */
    part def Axle10L :> StandardAxle {
        attribute :>> designId = "3737";
        attribute :>> partName = "Technic Axle 10";
        attribute :>> lengthModules = 10;
        attribute :>> lengthMM = 80.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 1.30;
        attribute :>> maxTorqueNcm = 16.0;
    }

    /**
     * Technic Axle 12L - Extra long axle.
     * LEGO Design ID: 3708
     * Longest commonly available axle.
     */
    part def Axle12L :> StandardAxle {
        attribute :>> designId = "3708";
        attribute :>> partName = "Technic Axle 12";
        attribute :>> lengthModules = 12;
        attribute :>> lengthMM = 96.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 1.56;
        attribute :>> maxTorqueNcm = 15.0;
    }

    // =========================================================================
    // Axles with Stop
    // =========================================================================

    /**
     * Technic Axle 4L with Stop - Prevents axle from sliding through.
     * LEGO Design ID: 87083
     * Stop collar located 1M from one end.
     */
    part def Axle4LWithStop :> AxleWithStop {
        attribute :>> designId = "87083";
        attribute :>> partName = "Technic Axle 4 with Stop";
        attribute :>> lengthModules = 4;
        attribute :>> lengthMM = 32.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.58;
        attribute :>> stopPosition = 8.0;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 5L with Stop - Medium axle with retention.
     * LEGO Design ID: 15462
     */
    part def Axle5LWithStop :> AxleWithStop {
        attribute :>> designId = "15462";
        attribute :>> partName = "Technic Axle 5 with Stop";
        attribute :>> lengthModules = 5;
        attribute :>> lengthMM = 40.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 0.72;
        attribute :>> stopPosition = 8.0;
        attribute :>> maxTorqueNcm = 20.0;
    }

    /**
     * Technic Axle 8L with Stop - Long axle with retention.
     * LEGO Design ID: 55013
     */
    part def Axle8LWithStop :> AxleWithStop {
        attribute :>> designId = "55013";
        attribute :>> partName = "Technic Axle 8 with Stop";
        attribute :>> lengthModules = 8;
        attribute :>> lengthMM = 64.0;
        attribute :>> color = AxleColor::Black;
        attribute :>> weightGrams = 1.12;
        attribute :>> stopPosition = 8.0;
        attribute :>> maxTorqueNcm = 18.0;
    }

    // =========================================================================
    // Axle Assemblies
    // =========================================================================

    /**
     * Drive axle assembly combining axle with supporting elements.
     */
    part def DriveAxleAssembly {
        part axle : TechnicAxle;

        attribute effectiveLength : Real;               // Usable length after bushings
        attribute supportCount : Integer;               // Number of support points
    }

    /**
     * Geared axle assembly for power transmission.
     */
    part def GearedAxleAssembly {
        part axle : TechnicAxle;

        attribute gearPositions : Integer;              // Number of gears on axle
        attribute totalGearRatio : Real;                // Combined gear ratio
    }
}
