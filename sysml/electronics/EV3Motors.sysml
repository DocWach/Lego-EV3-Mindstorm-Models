package EV3Electronics::Motors {
    doc /*
     * EV3 Motors - Electronic Component Definitions
     *
     * This package defines the EV3 servo motors:
     * - Large Motor (Design ID: 95658): High torque, 160-170 RPM
     * - Medium Motor (Design ID: 99455): High speed, 240-250 RPM
     *
     * Both motors feature integrated rotation sensors (encoders)
     * with 1-degree resolution for precise position control.
     */

    import EV3Interfaces::*;
    import EV3Types::*;

    /**
     * Integrated Rotation Sensor - Optical encoder for motor feedback
     */
    part def RotationSensor {
        doc /* Integrated optical encoder for position feedback */

        attribute resolution : Real = 1.0;          // degrees per count
        attribute maxRate : Integer = 1000;         // degrees per second
        attribute countsPerRevolution : Integer = 360;
        attribute quadratureOutput : Boolean = true;
    }

    /**
     * DC Motor Core - Brushed DC motor element
     */
    part def DCMotorCore {
        doc /* Internal DC motor element */

        attribute nominalVoltage : Real = 7.4;      // volts
        attribute motorType : String = "Brushed DC";
        attribute poleCount : Integer = 2;
    }

    /**
     * Motor Gearbox - Internal gear reduction
     */
    part def MotorGearbox {
        doc /* Internal gear reduction assembly */

        attribute gearRatio : Real;
        attribute gearType : String = "Spur";
        attribute stages : Integer;
    }

    /**
     * EV3 Large Motor (Design ID: 95658)
     * High-torque servo motor for driving and heavy lifting
     */
    part def LargeMotor {
        doc /*
         * LEGO EV3 Large Servo Motor - Design ID: 95658
         *
         * High-torque motor ideal for driving wheels and lifting mechanisms.
         * Features integrated rotation sensor with 1-degree resolution.
         * Commonly used as the primary drive motor for mobile robots.
         */

        // LEGO identification attributes
        attribute designId : String = "95658";
        attribute elementId : String = "6009430";
        attribute partName : String = "EV3 Large Servo Motor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 40.0;
        attribute height : Real = 72.0;
        attribute shaftDiameter : Real = 4.85;      // standard Technic cross-axle

        // Physical properties
        attribute mass : Real = 76.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Gray";
        attribute housingColor : String = "White";

        // Electrical specifications
        attribute nominalVoltage : Real = 7.4;      // volts
        attribute noLoadCurrent : Real = 60.0;      // mA
        attribute stallCurrent : Real = 1800.0;     // mA
        attribute maxPower : Real = 13.3;           // watts

        // Performance specifications (no load)
        attribute noLoadSpeed : Real = 170.0;       // RPM
        attribute ratedSpeed : Real = 160.0;        // RPM (nominal operating)
        attribute maxAngularVelocity : Real = 1020.0; // degrees/second

        // Torque specifications
        attribute stallTorque : Real = 40.0;        // Ncm
        attribute runningTorque : Real = 20.0;      // Ncm (at rated speed)
        attribute peakTorque : Real = 40.0;         // Ncm

        // Encoder specifications
        attribute encoderResolution : Real = 1.0;   // degrees
        attribute encoderType : String = "Optical Quadrature";

        // Internal components
        part motor : DCMotorCore;
        part gearbox : MotorGearbox {
            attribute :>> gearRatio = 1.0;
            attribute :>> stages = 1;
        }
        part encoder : RotationSensor;

        // Current state
        attribute currentPosition : Integer;        // encoder degrees
        attribute currentSpeed : Integer;           // degrees/second
        attribute isRunning : Boolean;
        attribute isStalled : Boolean;

        // Command attributes
        attribute targetSpeed : Integer;            // -100 to 100 percent
        attribute targetPosition : Integer;         // encoder degrees

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";
        attribute cableLength : Real;               // mm, varies by cable used

        // Control and feedback ports
        port control : MotorControlPort;
        port feedback : MotorFeedbackPort;
    }

    /**
     * EV3 Medium Motor (Design ID: 99455)
     * High-speed servo motor for auxiliary mechanisms
     */
    part def MediumMotor {
        doc /*
         * LEGO EV3 Medium Servo Motor - Design ID: 99455
         *
         * Higher-speed, lower-torque motor ideal for auxiliary functions.
         * Features integrated rotation sensor with 1-degree resolution.
         * Commonly used for grippers, arms, and other mechanisms.
         */

        // LEGO identification attributes
        attribute designId : String = "99455";
        attribute elementId : String = "6008577";
        attribute partName : String = "EV3 Medium Servo Motor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 40.0;
        attribute width : Real = 32.0;
        attribute height : Real = 52.0;
        attribute shaftDiameter : Real = 4.85;      // standard Technic cross-axle

        // Physical properties
        attribute mass : Real = 36.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Gray";
        attribute housingColor : String = "White";

        // Electrical specifications
        attribute nominalVoltage : Real = 7.4;      // volts
        attribute noLoadCurrent : Real = 40.0;      // mA
        attribute stallCurrent : Real = 500.0;      // mA
        attribute maxPower : Real = 3.7;            // watts

        // Performance specifications (no load)
        attribute noLoadSpeed : Real = 250.0;       // RPM
        attribute ratedSpeed : Real = 240.0;        // RPM (nominal operating)
        attribute maxAngularVelocity : Real = 1500.0; // degrees/second

        // Torque specifications
        attribute stallTorque : Real = 12.0;        // Ncm
        attribute runningTorque : Real = 8.0;       // Ncm (at rated speed)
        attribute peakTorque : Real = 12.0;         // Ncm

        // Encoder specifications
        attribute encoderResolution : Real = 1.0;   // degrees
        attribute encoderType : String = "Optical Quadrature";

        // Internal components
        part motor : DCMotorCore;
        part gearbox : MotorGearbox {
            attribute :>> gearRatio = 1.0;
            attribute :>> stages = 1;
        }
        part encoder : RotationSensor;

        // Current state
        attribute currentPosition : Integer;        // encoder degrees
        attribute currentSpeed : Integer;           // degrees/second
        attribute isRunning : Boolean;
        attribute isStalled : Boolean;

        // Command attributes
        attribute targetSpeed : Integer;            // -100 to 100 percent
        attribute targetPosition : Integer;         // encoder degrees

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";
        attribute cableLength : Real;               // mm, varies by cable used

        // Control and feedback ports
        port control : MotorControlPort;
        port feedback : MotorFeedbackPort;
    }

    /**
     * Motor comparison data for selection guidance
     */
    part def MotorComparison {
        doc /*
         * Reference comparison between Large and Medium motors
         * Use this to help select the appropriate motor for a task
         */

        // Large Motor characteristics
        attribute largeMotorTorque : Real = 20.0;   // Ncm
        attribute largeMotorSpeed : Real = 160.0;   // RPM
        attribute largeMotorMass : Real = 76.0;     // grams

        // Medium Motor characteristics
        attribute mediumMotorTorque : Real = 8.0;   // Ncm
        attribute mediumMotorSpeed : Real = 240.0;  // RPM
        attribute mediumMotorMass : Real = 36.0;    // grams

        // Ratios
        attribute torqueRatio : Real = 2.5;         // Large/Medium
        attribute speedRatio : Real = 0.67;         // Large/Medium
        attribute massRatio : Real = 2.1;           // Large/Medium
    }
}
