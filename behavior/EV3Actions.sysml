package EV3Actions {
    import EV3Types::*;

    // ============================================
    // Motor Actions
    // ============================================

    /**
     * Set motor speed (-100 to 100 percent)
     */
    action def SetMotorSpeed {
        in port : MotorPort;
        in speed : Integer;
    }

    /**
     * Rotate motor by specified angle in degrees
     */
    action def RotateByAngle {
        in port : MotorPort;
        in angle : Integer;
        in speed : Integer;
        in brake : Boolean;
    }

    /**
     * Run motor for specified duration in milliseconds
     */
    action def RotateForTime {
        in port : MotorPort;
        in duration : Integer;
        in speed : Integer;
    }

    /**
     * Stop motor with specified mode (Brake or Coast)
     */
    action def StopMotor {
        in port : MotorPort;
        in mode : MotorDirection;
    }

    /**
     * Reset motor encoder to zero
     */
    action def ResetEncoder {
        in port : MotorPort;
    }

    /**
     * Synchronize two motors for straight driving
     * turnRatio: -100 (full left) to 100 (full right)
     */
    action def SyncMotors {
        in portLeft : MotorPort;
        in portRight : MotorPort;
        in speed : Integer;
        in turnRatio : Integer;
    }

    // ============================================
    // Sensor Actions
    // ============================================

    /**
     * Read color sensor value based on mode
     */
    action def ReadColorSensor {
        in port : SensorPort;
        in mode : ColorSensorMode;
        out value : Integer;
    }

    /**
     * Read ultrasonic sensor distance in centimeters
     */
    action def ReadUltrasonicSensor {
        in port : SensorPort;
        out distance : Real;
    }

    /**
     * Read touch sensor pressed state
     */
    action def ReadTouchSensor {
        in port : SensorPort;
        out isPressed : Boolean;
    }

    /**
     * Read gyro sensor value based on mode
     */
    action def ReadGyroSensor {
        in port : SensorPort;
        in mode : GyroMode;
        out value : Integer;
    }

    /**
     * Calibrate gyro sensor (reset to zero)
     */
    action def CalibrateGyro {
        in port : SensorPort;
    }

    /**
     * Read infrared sensor value based on mode
     */
    action def ReadInfraredSensor {
        in port : SensorPort;
        in mode : InfraredMode;
        out value : Integer;
    }

    // ============================================
    // Display Actions
    // ============================================

    /**
     * Display text at specified position
     */
    action def DisplayText {
        in text : String;
        in x : Integer;
        in y : Integer;
        in fontSize : Integer;
    }

    /**
     * Clear the entire display
     */
    action def ClearDisplay;

    /**
     * Display image from file
     */
    action def DisplayImage {
        in filename : String;
    }

    // ============================================
    // Sound Actions
    // ============================================

    /**
     * Play tone at specified frequency (Hz) for duration (ms)
     */
    action def PlayTone {
        in frequency : Integer;
        in duration : Integer;
        in volume : Integer;
    }

    /**
     * Play sound file at specified volume
     */
    action def PlaySoundFile {
        in filename : String;
        in volume : Integer;
    }

    /**
     * Stop all sound playback
     */
    action def StopSound;

    // ============================================
    // Composite High-Level Actions
    // ============================================

    /**
     * Drive straight for specified distance in centimeters
     */
    action def DriveDistance {
        in distance : Real;
        in speed : Integer;
        in wheelDiameter : Real;
    }

    /**
     * Turn robot by specified angle in degrees
     */
    action def TurnByAngle {
        in angle : Integer;
        in speed : Integer;
        in wheelBase : Real;
    }

    /**
     * Line following behavior using color sensor
     */
    action def FollowLine {
        in sensorPort : SensorPort;
        in leftMotor : MotorPort;
        in rightMotor : MotorPort;
        in targetReflection : Integer;
        in baseSpeed : Integer;
    }

    /**
     * Obstacle avoidance behavior using distance sensor
     */
    action def AvoidObstacle {
        in sensorPort : SensorPort;
        in leftMotor : MotorPort;
        in rightMotor : MotorPort;
        in minDistance : Real;
    }
}
