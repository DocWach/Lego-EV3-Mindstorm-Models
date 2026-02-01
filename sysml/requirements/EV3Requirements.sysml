package EV3Requirements {
    doc /*
     * EV3 Mindstorm Robot Requirements and Constraints
     * This package defines hardware, performance, sensor, communication,
     * timing, and safety requirements for the Lego EV3 Mindstorm robot.
     */

    // ============================================================
    // Hardware Requirements
    // ============================================================

    requirement def MotorPortRequirement #"HW-001" {
        doc /* The EV3 brick shall provide 4 motor output ports */
        attribute portCount : Integer = 4;
    }

    requirement def SensorPortRequirement #"HW-002" {
        doc /* The EV3 brick shall provide 4 sensor input ports */
        attribute portCount : Integer = 4;
    }

    requirement def DisplayRequirement #"HW-003" {
        doc /* The EV3 shall have a 178x128 pixel monochrome LCD display */
        attribute displayWidth : Integer = 178;
        attribute displayHeight : Integer = 128;
    }

    requirement def BatteryRequirement #"HW-004" {
        doc /* The EV3 shall operate with a rechargeable 7.4V battery */
        attribute nominalVoltage : Real = 7.4;
        attribute minOperatingVoltage : Real = 6.0;
    }

    // ============================================================
    // Motor Performance Requirements
    // ============================================================

    requirement def LargeMotorSpeedRequirement #"MOT-001" {
        doc /* Large motor shall achieve 160-170 RPM under normal load */
        attribute minSpeed : Real = 160.0;
        attribute maxSpeed : Real = 170.0;
    }

    requirement def MediumMotorSpeedRequirement #"MOT-002" {
        doc /* Medium motor shall achieve 240-250 RPM under normal load */
        attribute minSpeed : Real = 240.0;
        attribute maxSpeed : Real = 250.0;
    }

    requirement def MotorAccuracyRequirement #"MOT-003" {
        doc /* Motor position shall be accurate within 1 degree */
        attribute positionAccuracy : Real = 1.0;
    }

    requirement def MotorSpeedAccuracyRequirement #"MOT-004" {
        doc /* Motor speed shall be accurate within 10% of target */
        attribute speedAccuracyPercent : Real = 10.0;
    }

    // ============================================================
    // Sensor Accuracy Requirements
    // ============================================================

    requirement def ColorSensorAccuracyRequirement #"SEN-001" {
        doc /* Color sensor shall detect standard colors with 95% accuracy */
        attribute detectionAccuracy : Real = 0.95;
    }

    requirement def UltrasonicRangeRequirement #"SEN-002" {
        doc /* Ultrasonic sensor shall measure 3-250 cm with +/-1 cm accuracy */
        attribute minRange : Real = 3.0;
        attribute maxRange : Real = 250.0;
        attribute accuracy : Real = 1.0;
    }

    requirement def GyroAccuracyRequirement #"SEN-003" {
        doc /* Gyro sensor shall be accurate within 3 degrees */
        attribute angleAccuracy : Real = 3.0;
        attribute maxRate : Integer = 440;
    }

    requirement def TouchSensorRequirement #"SEN-004" {
        doc /* Touch sensor shall reliably detect press/release with debounce */
        attribute debounceTime : Integer = 10;
    }

    // ============================================================
    // Communication Requirements
    // ============================================================

    requirement def BluetoothRequirement #"COM-001" {
        doc /* EV3 shall support Bluetooth 2.1 communication */
        attribute bluetoothVersion : String;
    }

    requirement def USBRequirement #"COM-002" {
        doc /* EV3 shall support USB 2.0 communication */
        attribute usbVersion : String;
    }

    // ============================================================
    // Timing Requirements
    // ============================================================

    requirement def MotorResponseRequirement #"TIM-001" {
        doc /* Motor commands shall execute within 10ms */
        attribute maxResponseTime : Integer = 10;
    }

    requirement def SensorReadRequirement #"TIM-002" {
        doc /* Sensor reads shall complete within 20ms */
        attribute maxReadTime : Integer = 20;
    }

    // ============================================================
    // Safety Requirements
    // ============================================================

    requirement def StallDetectionRequirement #"SAF-001" {
        doc /* System shall detect motor stall within 100ms */
        attribute maxDetectionTime : Integer = 100;
    }

    requirement def LowBatteryWarningRequirement #"SAF-002" {
        doc /* System shall warn when battery drops below 6.5V */
        attribute warningVoltage : Real = 6.5;
    }

    requirement def ShutdownProtectionRequirement #"SAF-003" {
        doc /* System shall shutdown when battery drops below 6.0V */
        attribute shutdownVoltage : Real = 6.0;
    }

    // ============================================================
    // Constraint Definitions
    // Constraints define parameters; expressions are applied when used
    // ============================================================

    constraint def MotorSpeedConstraint {
        doc /* Motor speed must be within valid range (-100 to 100) */
        attribute speed : Integer;
        attribute minSpeed : Integer = -100;
        attribute maxSpeed : Integer = 100;
    }

    constraint def MotorPortConstraint {
        doc /* Motor port must be A, B, C, or D (index 0-3) */
        attribute portIndex : Integer;
        attribute minIndex : Integer = 0;
        attribute maxIndex : Integer = 3;
    }

    constraint def SensorPortConstraint {
        doc /* Sensor port must be 1, 2, 3, or 4 */
        attribute portIndex : Integer;
        attribute minIndex : Integer = 1;
        attribute maxIndex : Integer = 4;
    }

    constraint def VolumeConstraint {
        doc /* Volume must be 0-100 */
        attribute volume : Integer;
        attribute minVolume : Integer = 0;
        attribute maxVolume : Integer = 100;
    }

    constraint def PowerConsumptionConstraint {
        doc /* Total power must not exceed limits */
        attribute motorCurrent : Real;
        attribute maxCurrent : Real = 3000.0;
    }

    constraint def UltrasonicDistanceConstraint {
        doc /* Distance must be within sensor range */
        attribute distance : Real;
        attribute minDistance : Real = 3.0;
        attribute maxDistance : Real = 250.0;
    }

    constraint def BatteryVoltageConstraint {
        doc /* Battery voltage must be within operating range */
        attribute voltage : Real;
        attribute minVoltage : Real = 6.0;
        attribute maxVoltage : Real = 8.4;
    }

    constraint def EncoderPositionConstraint {
        doc /* Encoder position tracking constraint */
        attribute position : Integer;
        attribute minPosition : Integer = -2147483647;
        attribute maxPosition : Integer = 2147483647;
    }
}
