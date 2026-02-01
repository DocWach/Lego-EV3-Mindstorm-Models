/**
 * EV3System.sysml
 * Top-level SysML v2 system integration package for the Lego EV3 Mindstorm robot.
 * Defines connection types and reusable robot configurations.
 */
package EV3System {
    // Import all EV3 packages
    import EV3Types::*;
    import EV3Interfaces::*;
    import EV3Brick::*;
    import EV3Motors::*;
    import EV3Sensors::*;
    import EV3Actions::*;
    import EV3States::*;
    import EV3Calculations::*;
    import EV3Requirements::*;

    // ============================================================
    // Connection Definitions
    // ============================================================

    /**
     * MotorConnection - Connects brick motor port to motor control input.
     * Used to send control commands from the EV3 brick to a motor.
     */
    connection def MotorConnection {
        end brickPort : MotorControlPort;
        end motorControl : MotorControlPort;
    }

    /**
     * MotorFeedbackConnection - Connects motor feedback output to brick.
     * Used to receive encoder position and status from motors.
     */
    connection def MotorFeedbackConnection {
        end motorFeedback : MotorFeedbackPort;
        end brickFeedback : MotorFeedbackPort;
    }

    /**
     * ColorSensorConnection - Connects color sensor to brick sensor port.
     * Transmits color, reflected light, and RGB data to the brick.
     */
    connection def ColorSensorConnection {
        end sensor : ColorSensorPort;
        end brick : ColorSensorPort;
    }

    /**
     * TouchSensorConnection - Connects touch sensor to brick sensor port.
     * Transmits press state and bump count to the brick.
     */
    connection def TouchSensorConnection {
        end sensor : TouchSensorPort;
        end brick : TouchSensorPort;
    }

    /**
     * UltrasonicSensorConnection - Connects ultrasonic sensor to brick.
     * Transmits distance measurements and presence detection to the brick.
     */
    connection def UltrasonicSensorConnection {
        end sensor : UltrasonicSensorPort;
        end brick : UltrasonicSensorPort;
    }

    /**
     * GyroSensorConnection - Connects gyro sensor to brick sensor port.
     * Transmits angle and rotation rate data to the brick.
     */
    connection def GyroSensorConnection {
        end sensor : GyroSensorPort;
        end brick : GyroSensorPort;
    }

    /**
     * InfraredSensorConnection - Connects IR sensor to brick sensor port.
     * Transmits proximity, beacon heading, and distance data to the brick.
     */
    connection def InfraredSensorConnection {
        end sensor : InfraredSensorPort;
        end brick : InfraredSensorPort;
    }

    // ============================================================
    // Abstract Robot Configuration Templates
    // ============================================================

    /**
     * EV3RobotBase - Abstract base robot configuration.
     * All EV3 robots include the intelligent brick and operational state machine.
     */
    abstract part def EV3RobotBase {
        doc /* Base configuration for all EV3 robots with brick and state machine */

        part brick : EV3IntelligentBrick;

        exhibit state operationalState : RobotOperationalStates;
    }

    /**
     * EV3DrivingRobot - Robot with differential drive system.
     * Provides a mobile base using two large motors for tank-style steering.
     */
    part def EV3DrivingRobot :> EV3RobotBase {
        doc /* Mobile robot base with differential drive using two large motors */

        // Drive system
        part drive : DualMotorDrive;

        // Drive geometry configuration
        attribute wheelDiameter : Real;
        attribute trackWidth : Real;

        // Connections: Left motor to port A, right motor to port B
        connection leftMotorControl : MotorConnection
            connect brick.motorPortA to drive.leftMotor.control;

        connection leftMotorFeedback : MotorFeedbackConnection
            connect drive.leftMotor.feedback to brick.motorFeedbackA;

        connection rightMotorControl : MotorConnection
            connect brick.motorPortB to drive.rightMotor.control;

        connection rightMotorFeedback : MotorFeedbackConnection
            connect drive.rightMotor.feedback to brick.motorFeedbackB;
    }

    /**
     * EV3LineFollowingRobot - Robot with line following capability.
     * Extends driving robot with a color sensor for line tracking.
     */
    part def EV3LineFollowingRobot :> EV3DrivingRobot {
        doc /* Line following robot using color sensor in reflected light mode */

        // Color sensor for line detection
        part colorSensor : EV3ColorSensor;

        // Color sensor connected to port S3
        connection colorSensorConnection : ColorSensorConnection
            connect colorSensor.output to brick.sensorPort3Type;
    }

    /**
     * EV3ObstacleAvoidingRobot - Robot with obstacle avoidance.
     * Extends driving robot with an ultrasonic sensor for distance measurement.
     */
    part def EV3ObstacleAvoidingRobot :> EV3DrivingRobot {
        doc /* Obstacle avoiding robot using ultrasonic distance sensor */

        // Ultrasonic sensor for obstacle detection
        part ultrasonicSensor : EV3UltrasonicSensor;

        // Ultrasonic sensor connected to port S4
        connection ultrasonicConnection : UltrasonicSensorConnection
            connect ultrasonicSensor.output to brick.sensorPort4Type;
    }

    /**
     * EV3BalancingRobot - Self-balancing robot configuration.
     * Uses gyro sensor for balance control with two drive motors.
     */
    part def EV3BalancingRobot :> EV3RobotBase {
        doc /* Self-balancing robot using gyro sensor for stability control */

        // Gyro sensor for balance feedback
        part gyroSensor : EV3GyroSensor;

        // Drive motors (large motors for torque)
        part leftMotor : EV3LargeMotor;
        part rightMotor : EV3LargeMotor;

        // Balance configuration
        attribute wheelDiameter : Real;
        attribute wheelBase : Real;

        // Gyro sensor connected to port S2
        connection gyroConnection : GyroSensorConnection
            connect gyroSensor.output to brick.sensorPort2Type;

        // Motor connections
        connection leftMotorControl : MotorConnection
            connect brick.motorPortA to leftMotor.control;

        connection leftMotorFeedback : MotorFeedbackConnection
            connect leftMotor.feedback to brick.motorFeedbackA;

        connection rightMotorControl : MotorConnection
            connect brick.motorPortB to rightMotor.control;

        connection rightMotorFeedback : MotorFeedbackConnection
            connect rightMotor.feedback to brick.motorFeedbackB;
    }

    /**
     * EV3GrippingRobot - Robot with gripper mechanism.
     * Extends driving robot with a medium motor gripper and touch sensor.
     */
    part def EV3GrippingRobot :> EV3DrivingRobot {
        doc /* Mobile robot with gripper arm using medium motor and touch sensor */

        // Gripper motor (medium motor for faster actuation)
        part gripperMotor : EV3MediumMotor;

        // Touch sensor for grip detection
        part touchSensor : EV3TouchSensor;

        // Gripper motor connected to port C
        connection gripperMotorControl : MotorConnection
            connect brick.motorPortC to gripperMotor.control;

        connection gripperMotorFeedback : MotorFeedbackConnection
            connect gripperMotor.feedback to brick.motorFeedbackC;

        // Touch sensor connected to port S1
        connection touchSensorConnection : TouchSensorConnection
            connect touchSensor.output to brick.sensorPort1Type;
    }

    /**
     * EV3RemoteControlledRobot - Robot with IR remote control.
     * Extends driving robot with infrared sensor and beacon for remote operation.
     */
    part def EV3RemoteControlledRobot :> EV3DrivingRobot {
        doc /* Remote controlled robot using IR sensor and beacon */

        // Infrared sensor for receiving remote commands
        part irSensor : EV3InfraredSensor;

        // Infrared beacon (remote control)
        part irBeacon : EV3InfraredBeacon;

        // IR sensor connected to port S4
        connection irSensorConnection : InfraredSensorConnection
            connect irSensor.output to brick.sensorPort4Type;
    }

    // ============================================================
    // Concrete Example Robot Configuration
    // ============================================================

    /**
     * EV3EducationRobot - Complete education set robot configuration.
     * A versatile robot with driving base, color sensor for line following,
     * and ultrasonic sensor for obstacle avoidance.
     */
    part def EV3EducationRobot :> EV3RobotBase {
        doc /* Complete education robot with driving, line following, and obstacle avoidance */

        // Drive system with standard EV3 Education wheel configuration
        part drive : DualMotorDrive;

        // Sensors for line following and obstacle avoidance
        part colorSensor : EV3ColorSensor;
        part ultrasonicSensor : EV3UltrasonicSensor;

        // Standard EV3 Education Set wheel configuration
        // Wheel diameter: 56mm (standard large EV3 wheel)
        // Track width: 120mm (typical education robot base)
        attribute wheelDiameter : Real = 56.0;
        attribute trackWidth : Real = 120.0;

        // Motor connections: Left motor to port A, right motor to port B
        connection leftMotorControl : MotorConnection
            connect brick.motorPortA to drive.leftMotor.control;

        connection leftMotorFeedback : MotorFeedbackConnection
            connect drive.leftMotor.feedback to brick.motorFeedbackA;

        connection rightMotorControl : MotorConnection
            connect brick.motorPortB to drive.rightMotor.control;

        connection rightMotorFeedback : MotorFeedbackConnection
            connect drive.rightMotor.feedback to brick.motorFeedbackB;

        // Color sensor on port S3 (typical line following position)
        connection colorSensorConnection : ColorSensorConnection
            connect colorSensor.output to brick.sensorPort3Type;

        // Ultrasonic sensor on port S4 (forward-facing obstacle detection)
        connection ultrasonicConnection : UltrasonicSensorConnection
            connect ultrasonicSensor.output to brick.sensorPort4Type;
    }
}
