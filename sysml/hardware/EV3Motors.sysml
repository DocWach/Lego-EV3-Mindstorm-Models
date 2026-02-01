package EV3Motors {
    import EV3Interfaces::*;

    /**
     * Abstract base motor definition for EV3 motors.
     * Provides common attributes and ports for all motor types.
     */
    abstract part def EV3MotorBase {
        // Encoder configuration
        attribute encoderResolution : Real = 1.0;  // degrees per count

        // Current state attributes
        attribute currentPosition : Integer;       // encoder position in degrees
        attribute currentSpeed : Integer;          // degrees/second
        attribute isRunning : Boolean;
        attribute isStalled : Boolean;

        // Target/command attributes
        attribute targetSpeed : Integer;
        attribute targetPosition : Integer;

        // Electrical characteristics
        attribute stallCurrent : Real;             // mA

        // Control and feedback ports
        port control : MotorControlPort;
        port feedback : MotorFeedbackPort;
    }

    /**
     * EV3 Large Servo Motor (45mm diameter).
     * High torque motor suitable for driving wheels and lifting mechanisms.
     * Based on LEGO part 95658.
     */
    part def EV3LargeMotor :> EV3MotorBase {
        // Physical specifications
        attribute diameter : Real = 45.0;          // mm
        attribute weight : Real = 76.0;            // grams

        // Performance specifications (no load)
        attribute maxRPM : Real = 170.0;           // RPM, no load
        attribute ratedRPM : Real = 160.0;         // RPM, nominal

        // Torque specifications
        attribute stallTorque : Real = 40.0;       // Ncm
        attribute runningTorque : Real = 20.0;     // Ncm

        // Electrical specifications
        attribute noLoadCurrent : Real = 60.0;     // mA
        attribute :>> stallCurrent = 1800.0;  // mA, override from base
    }

    /**
     * EV3 Medium Servo Motor (32mm diameter).
     * Faster, lighter motor suitable for auxiliary mechanisms.
     * Based on LEGO part 99455.
     */
    part def EV3MediumMotor :> EV3MotorBase {
        // Physical specifications
        attribute diameter : Real = 32.0;          // mm
        attribute weight : Real = 36.0;            // grams

        // Performance specifications (no load)
        attribute maxRPM : Real = 250.0;           // RPM, no load
        attribute ratedRPM : Real = 240.0;         // RPM, nominal

        // Torque specifications
        attribute stallTorque : Real = 12.0;       // Ncm
        attribute runningTorque : Real = 8.0;      // Ncm

        // Electrical specifications
        attribute noLoadCurrent : Real = 40.0;     // mA
        attribute :>> stallCurrent = 500.0;   // mA, override from base
    }

    /**
     * Dual motor drive configuration for differential steering.
     * Common setup for mobile robots using two large motors.
     */
    part def DualMotorDrive {
        // Motor components
        part leftMotor : EV3LargeMotor;
        part rightMotor : EV3LargeMotor;

        // Drive geometry
        attribute wheelDiameter : Real;            // mm
        attribute wheelBase : Real;                // mm, distance between wheels
        attribute gearRatio : Real = 1.0;          // motor:wheel gear ratio
    }
}
