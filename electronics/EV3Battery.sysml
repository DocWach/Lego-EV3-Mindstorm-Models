package EV3Electronics::Battery {
    doc /*
     * EV3 Battery - Power Source Definitions
     *
     * This package defines the EV3 rechargeable battery pack:
     * - Rechargeable Battery (Design ID: 95656): 2050mAh Li-ion, 7.4V
     *
     * The rechargeable battery provides longer runtime and more
     * consistent power compared to disposable AA batteries.
     */

    /**
     * Lithium-Ion Cell - Individual battery cell
     */
    part def LithiumIonCell {
        doc /* Individual 18650 Li-ion cell specifications */

        attribute cellType : String = "18650 Li-ion";
        attribute nominalVoltage : Real = 3.7;      // volts
        attribute capacity : Real = 1025.0;         // mAh (half of pack)
        attribute maxChargeVoltage : Real = 4.2;    // volts
        attribute minDischargeVoltage : Real = 3.0; // volts
        attribute internalResistance : Real = 50.0; // milliohms
    }

    /**
     * Battery Management System
     */
    part def BatteryManagementSystem {
        doc /*
         * BMS for monitoring and protecting the battery pack
         * Provides overcharge, overdischarge, and overcurrent protection
         */

        attribute overchargeProtection : Boolean = true;
        attribute overdischargeProtection : Boolean = true;
        attribute overcurrentProtection : Boolean = true;
        attribute shortCircuitProtection : Boolean = true;
        attribute temperatureMonitoring : Boolean = true;
        attribute cellBalancing : Boolean = true;

        // Protection thresholds
        attribute overchargeThreshold : Real = 4.25;    // volts per cell
        attribute overdischargeThreshold : Real = 2.8;  // volts per cell
        attribute overcurrentThreshold : Real = 5.0;    // amps
        attribute maxTemperature : Real = 60.0;         // degrees Celsius
    }

    /**
     * Battery Contacts
     */
    part def BatteryContacts {
        doc /* Electrical contact interface to EV3 brick */

        attribute contactType : String = "Spring-loaded gold-plated";
        attribute contactCount : Integer = 6;
        attribute maxCurrent : Real = 5.0;          // amps
        attribute contactResistance : Real = 10.0;  // milliohms
    }

    /**
     * EV3 Rechargeable Battery (Design ID: 95656)
     * Main power source for the EV3 system
     */
    part def RechargableBattery {
        doc /*
         * LEGO EV3 Rechargeable DC Battery - Design ID: 95656
         *
         * High-capacity lithium-ion battery pack designed specifically
         * for the EV3 Intelligent Brick. Provides approximately 3-4 hours
         * of active use on a full charge.
         *
         * Features:
         * - 2050mAh capacity
         * - 7.4V nominal voltage (2S Li-ion)
         * - Built-in protection circuitry
         * - LED charge indicator
         * - Direct charging in brick
         */

        // LEGO identification attributes
        attribute designId : String = "95656";
        attribute elementId : String = "6012820";
        attribute partName : String = "EV3 Rechargeable DC Battery";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 112.0;
        attribute width : Real = 56.0;
        attribute height : Real = 32.0;

        // Physical properties
        attribute mass : Real = 213.0;              // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "Dark Gray";
        attribute cellHousingMaterial : String = "Steel";

        // Battery chemistry
        attribute chemistry : String = "Lithium-Ion";
        attribute cellConfiguration : String = "2S1P";  // 2 cells in series
        attribute cellCount : Integer = 2;

        // Voltage specifications
        attribute nominalVoltage : Real = 7.4;      // volts
        attribute fullChargeVoltage : Real = 8.4;   // volts
        attribute emptyVoltage : Real = 6.0;        // volts (cutoff)
        attribute lowVoltageWarning : Real = 6.5;   // volts (brick warning)

        // Capacity specifications
        attribute capacity : Real = 2050.0;         // mAh
        attribute energyCapacity : Real = 15.17;    // Wh (7.4V * 2.05Ah)
        attribute typicalRuntime : Real = 3.5;      // hours (typical use)
        attribute maxRuntime : Real = 5.0;          // hours (light use)

        // Charging specifications
        attribute chargeVoltage : Real = 10.0;      // volts DC input
        attribute chargeCurrent : Real = 1.0;       // amps (1C rate)
        attribute chargeTime : Real = 3.0;          // hours (0 to full)
        attribute chargeMethod : String = "CC-CV"; // Constant Current, Constant Voltage

        // Discharge specifications
        attribute maxDischargeCurrent : Real = 5.0; // amps continuous
        attribute peakDischargeCurrent : Real = 8.0; // amps (short burst)
        attribute internalResistance : Real = 100.0; // milliohms

        // Cycle life
        attribute cycleLife : Integer = 500;        // charge cycles to 80% capacity
        attribute storageTemperature : String = "-20 to 45 C";
        attribute operatingTemperature : String = "0 to 40 C";

        // Internal components
        part cell1 : LithiumIonCell;
        part cell2 : LithiumIonCell;
        part bms : BatteryManagementSystem;
        part contacts : BatteryContacts;

        // Status indicators
        attribute hasLEDIndicator : Boolean = true;
        attribute ledColors : String = "Green (full), Orange (charging), Red (low)";

        // Current state
        attribute currentVoltage : Real;
        attribute chargePercent : Integer;          // 0-100%
        attribute isCharging : Boolean;
        attribute isFullyCharged : Boolean;
        attribute isLowBattery : Boolean;
        attribute temperature : Real;               // degrees Celsius
        attribute cycleCount : Integer;

        // Safety certifications
        attribute certifications : String = "CE, UL, UN38.3";
    }

    /**
     * AA Battery Holder - Alternative power option
     * Uses 6x AA batteries (not rechargeable pack)
     */
    part def AABatteryHolder {
        doc /*
         * Alternative power source using 6x AA batteries
         * Included with EV3 Home Edition (31313)
         *
         * Note: This is not a LEGO part but rather the battery
         * compartment configuration when not using the rechargeable pack.
         */

        // Configuration
        attribute batteryType : String = "AA (LR6)";
        attribute batteryCount : Integer = 6;
        attribute configuration : String = "6S";    // 6 in series

        // Voltage specifications (alkaline)
        attribute nominalVoltage : Real = 9.0;      // volts (6 x 1.5V)
        attribute freshVoltage : Real = 9.6;        // volts (fresh batteries)
        attribute depletedVoltage : Real = 6.0;     // volts (end of life)

        // Capacity specifications (typical alkaline)
        attribute typicalCapacity : Real = 2800.0;  // mAh
        attribute typicalRuntime : Real = 2.0;      // hours (active use)

        // Physical properties
        attribute mass : Real = 138.0;              // grams (batteries only)

        // Recommendations
        attribute recommendedType : String = "Alkaline or NiMH rechargeable";
        attribute notRecommended : String = "Lithium AA (voltage too high)";
    }

    /**
     * EV3 Power Adapter - For charging and direct power
     */
    part def PowerAdapter {
        doc /*
         * AC power adapter for charging the battery
         * and powering the brick directly
         *
         * Sold separately (LEGO part 45517)
         */

        // LEGO identification
        attribute partNumber : String = "45517";
        attribute partName : String = "EV3 DC Charger";

        // Input specifications
        attribute inputVoltage : String = "100-240V AC";
        attribute inputFrequency : String = "50-60 Hz";
        attribute inputCurrent : Real = 0.5;        // amps max

        // Output specifications
        attribute outputVoltage : Real = 10.0;      // volts DC
        attribute outputCurrent : Real = 1.0;       // amps
        attribute outputPower : Real = 10.0;        // watts

        // Connector
        attribute connectorType : String = "Barrel jack";
        attribute connectorOD : Real = 5.5;         // mm outer diameter
        attribute connectorID : Real = 2.1;         // mm inner diameter
        attribute centerPolarity : String = "Positive";

        // Physical properties
        attribute cableLength : Real = 1800.0;      // mm
        attribute mass : Real = 120.0;              // grams

        // Safety
        attribute certifications : String = "CE, UL, FCC";
    }

    /**
     * Battery runtime estimator
     */
    part def RuntimeEstimator {
        doc /*
         * Reference data for estimating battery runtime
         * based on motor and sensor usage
         */

        // Base power consumption
        attribute brickIdlePower : Real = 0.3;      // watts
        attribute brickActivePower : Real = 1.5;    // watts

        // Motor power consumption (typical)
        attribute largeMotorPower : Real = 1.5;     // watts (50% load)
        attribute mediumMotorPower : Real = 0.8;    // watts (50% load)

        // Sensor power consumption
        attribute colorSensorPower : Real = 0.05;   // watts
        attribute ultrasonicPower : Real = 0.04;    // watts
        attribute gyroSensorPower : Real = 0.03;    // watts
        attribute touchSensorPower : Real = 0.01;   // watts
        attribute infraredPower : Real = 0.05;      // watts

        // Display and audio
        attribute displayPower : Real = 0.1;        // watts
        attribute speakerPower : Real = 0.3;        // watts (playing)
        attribute bluetoothPower : Real = 0.15;     // watts (active)
    }
}
