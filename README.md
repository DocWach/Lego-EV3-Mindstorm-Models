# Lego EV3 Mindstorm SysML v2 Model

## Overview

This is a complete SysML v2 model of the Lego EV3 Mindstorm robot system. The model provides a comprehensive representation of the EV3 hardware components, behavioral definitions, and system requirements using the SysML v2 specification. It serves as both a reference implementation for robotics modeling and an educational resource for learning SysML v2 concepts.

## File Structure

```
examples/ev3/
├── README.md                    # This file
├── domain/
│   ├── EV3Types.sysml          # Enumerations and base types
│   └── EV3Interfaces.sysml     # Port definitions
├── hardware/
│   ├── EV3Brick.sysml          # Intelligent brick definition
│   ├── EV3Motors.sysml         # Large and Medium motors
│   └── EV3Sensors.sysml        # All 5 sensor types
├── behavior/
│   ├── EV3Actions.sysml        # Action definitions
│   ├── EV3States.sysml         # State machine definitions
│   └── EV3Calculations.sysml   # Calculation definitions
├── requirements/
│   └── EV3Requirements.sysml   # System requirements & constraints
└── EV3System.sysml             # Top-level system integration
```

## Components

### Domain Layer

- **EV3Types.sysml**: 10 enumerations (MotorPort, SensorPort, Color, MotorDirection, etc.)
- **EV3Interfaces.sysml**: 12 port definitions for motor control, sensor data, display, sound, and communication

### Hardware Layer

- **EV3Brick.sysml**: EV3 Intelligent Brick with battery, buttons, display, speaker, and all ports
- **EV3Motors.sysml**: Large Motor (45mm, 170 RPM) and Medium Motor (32mm, 250 RPM) with real specifications
- **EV3Sensors.sysml**: All 5 sensor types - Color, Touch, Ultrasonic, Gyro, and Infrared with real specifications

### Behavior Layer

- **EV3Actions.sysml**: 22 action definitions for motor control, sensor reading, display, sound, and composite behaviors
- **EV3States.sysml**: 6 state machines for motor, sensor, brick, and robot operational states
- **EV3Calculations.sysml**: 12 calculation definitions for motor math, odometry, PID, battery monitoring

### Requirements Layer

- **EV3Requirements.sysml**: 25+ requirements and constraints covering hardware, performance, timing, and safety

### System Integration

- **EV3System.sysml**: Connection definitions and 7 robot configuration templates (driving, line following, obstacle avoiding, balancing, gripper, remote controlled, education robot)

## Robot Configuration Templates

| Template | Description | Components |
|----------|-------------|------------|
| EV3RobotBase | Abstract base | Brick only |
| EV3DrivingRobot | Differential drive | Brick + DualMotorDrive |
| EV3LineFollowingRobot | Line follower | Driving + ColorSensor |
| EV3ObstacleAvoidingRobot | Obstacle avoidance | Driving + UltrasonicSensor |
| EV3BalancingRobot | Self-balancing | Brick + GyroSensor + 2 LargeMotors |
| EV3GrippingRobot | Robot with gripper | Driving + MediumMotor + TouchSensor |
| EV3RemoteControlledRobot | IR remote control | Driving + InfraredSensor + Beacon |

## Hardware Specifications

### EV3 Intelligent Brick

- 4 motor output ports (A, B, C, D)
- 4 sensor input ports (1, 2, 3, 4)
- 178x128 pixel LCD display
- Built-in speaker
- Bluetooth 2.1 and USB 2.0 connectivity
- 7.4V rechargeable battery (2050 mAh)

### Motors

| Motor | Diameter | Speed | Torque (Stall) | Weight |
|-------|----------|-------|----------------|--------|
| Large | 45 mm | 170 RPM | 40 Ncm | 76 g |
| Medium | 32 mm | 250 RPM | 12 Ncm | 36 g |

### Sensors

| Sensor | Key Specification |
|--------|------------------|
| Color | 8 colors, 0-100 reflection, RGB mode |
| Touch | Press detect with bump counting |
| Ultrasonic | 3-250 cm range, +/-1 cm accuracy |
| Gyro | +/-440 deg/s, +/-3 deg accuracy |
| Infrared | 70 cm proximity, 200 cm beacon tracking |

## Usage

### Importing the Model

```sysml
import EV3System::*;

part myRobot : EV3DrivingRobot {
    attribute :>> wheelDiameter = 56.0;
    attribute :>> trackWidth = 120.0;
}
```

### Creating Custom Robot Configurations

```sysml
part def MyCustomRobot :> EV3DrivingRobot {
    part colorSensor : EV3ColorSensor;
    part gripperMotor : EV3MediumMotor;
}
```

### Extending Behaviors

```sysml
action def MyLineFollowAction :> EV3Actions::LineFollowAction {
    // Custom line following parameters
    in attribute kp : Real = 0.5;
    in attribute ki : Real = 0.01;
    in attribute kd : Real = 0.1;
}
```

### Using Calculations

```sysml
calc def ComputeDistance :> EV3Calculations::OdometryCalc {
    in leftRotations : Real;
    in rightRotations : Real;
    return distance : Real;
}
```

## Validation

All SysML files have been validated with the SysML v2 parser and parse without errors.

## License

This model is provided for educational purposes demonstrating SysML v2 modeling of robotic systems.

## References

- LEGO MINDSTORMS EV3 Hardware Developer Kit
- SysML v2 Specification (OMG)
- LEGO Education EV3 Technical Resources
