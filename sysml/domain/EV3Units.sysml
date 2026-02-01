package EV3Units {
    doc /* LEGO Technic Unit Definitions
     *
     * The fundamental unit in LEGO Technic is the "module" where:
     * - 1 Module (M) = 8mm (the spacing between Technic holes)
     * - Stud pitch = 8mm (same as module)
     * - Plate height = 3.2mm (0.4 M)
     * - Brick height = 9.6mm (1.2 M)
     *
     * This package defines attribute types for LEGO-specific measurements.
     */

    import ScalarValues::*;

    // =====================================================================
    // Length Units
    // =====================================================================

    /** LEGO module unit - fundamental Technic spacing (8mm) */
    attribute def Module :> Real {
        doc /* 1 Module = 8mm = hole spacing in Technic beams */
    }

    /** Millimeter measurement for precise dimensions */
    attribute def Millimeter :> Real {
        doc /* Standard metric length unit */
    }

    /** Stud unit - same as module for Technic (8mm spacing) */
    attribute def Stud :> Real {
        doc /* 1 Stud = 8mm = standard LEGO brick width */
    }

    // =====================================================================
    // Mass Units
    // =====================================================================

    /** Gram measurement for component weights */
    attribute def Gram :> Real {
        doc /* Mass in grams - typical Technic pieces range 0.5g to 30g */
    }

    // =====================================================================
    // Angular Units
    // =====================================================================

    /** Degree measurement for angles and rotations */
    attribute def Degree :> Real {
        doc /* Angular measurement in degrees */
    }

    // =====================================================================
    // Counting Units
    // =====================================================================

    /** Tooth count for gears */
    attribute def ToothCount :> Integer {
        doc /* Number of teeth on a gear
               Standard Technic gears: 8, 12, 16, 20, 24, 36, 40 teeth */
    }

    /** Hole count for beams and liftarms */
    attribute def HoleCount :> Integer {
        doc /* Number of holes in a Technic beam or liftarm
               Determines length: length = (holes - 1) * 8mm */
    }

    /** Stud count for traditional bricks */
    attribute def StudCount :> Integer {
        doc /* Number of studs on a brick element */
    }

    // =====================================================================
    // Electrical Units
    // =====================================================================

    /** Voltage in volts */
    attribute def Volt :> Real {
        doc /* Electrical potential - EV3 brick operates at 7.2V nominal */
    }

    /** Current in amperes */
    attribute def Ampere :> Real {
        doc /* Electrical current measurement */
    }

    /** Current in milliamperes */
    attribute def Milliampere :> Real {
        doc /* Electrical current in mA - typical motor draw 100-700mA */
    }

    // =====================================================================
    // Rotational Units
    // =====================================================================

    /** Rotations per minute */
    attribute def RPM :> Real {
        doc /* Rotational speed - Large motor: ~160 RPM, Medium: ~240 RPM */
    }

    /** Degrees per second */
    attribute def DegreesPerSecond :> Real {
        doc /* Angular velocity measurement */
    }

    // =====================================================================
    // Torque Units
    // =====================================================================

    /** Newton-centimeters for torque */
    attribute def NewtonCentimeter :> Real {
        doc /* Torque measurement - Large motor: ~20 N-cm stall torque */
    }

    // =====================================================================
    // Time Units
    // =====================================================================

    /** Milliseconds for timing */
    attribute def Millisecond :> Real {
        doc /* Time measurement in milliseconds */
    }

    /** Seconds for duration */
    attribute def Second :> Real {
        doc /* Time measurement in seconds */
    }

    // =====================================================================
    // Percentage Units
    // =====================================================================

    /** Percentage value (0-100) */
    attribute def Percent :> Real {
        doc /* Percentage value, commonly used for motor power and sensor readings */
    }

    // =====================================================================
    // Conversion Constants
    // =====================================================================

    /** Conversion factor: millimeters per module */
    attribute mmPerModule : Real = 8.0;

    /** Conversion factor: modules per stud (same in Technic) */
    attribute modulesPerStud : Real = 1.0;

    /** Plate height in modules */
    attribute plateHeightModules : Real = 0.4;

    /** Brick height in modules */
    attribute brickHeightModules : Real = 1.2;
}
