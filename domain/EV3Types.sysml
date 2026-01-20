package EV3Types {

    // Motor port identifiers on the EV3 brick
    enum def MotorPort {
        enum A;
        enum B;
        enum C;
        enum D;
    }

    // Sensor port identifiers on the EV3 brick
    enum def SensorPort {
        enum S1;
        enum S2;
        enum S3;
        enum S4;
    }

    // Colors detectable by the EV3 color sensor
    enum def Color {
        enum None;
        enum Black;
        enum Blue;
        enum Green;
        enum Yellow;
        enum Red;
        enum White;
        enum Brown;
    }

    // Motor direction and braking modes
    enum def MotorDirection {
        enum Forward;
        enum Reverse;
        enum Brake;
        enum Coast;
    }

    // EV3 brick button identifiers
    enum def BrickButton {
        enum Left;
        enum Right;
        enum Up;
        enum Down;
        enum Center;
        enum Back;
    }

    // Sound playback types
    enum def SoundType {
        enum Tone;
        enum File;
    }

    // Color sensor operating modes
    enum def ColorSensorMode {
        enum ColorMode;
        enum ReflectedLight;
        enum AmbientLight;
        enum RGBRaw;
    }

    // Ultrasonic sensor operating modes
    enum def UltrasonicMode {
        enum Distance;
        enum Presence;
    }

    // Gyroscopic sensor operating modes
    enum def GyroMode {
        enum Angle;
        enum Rate;
        enum AngleAndRate;
    }

    // Infrared sensor operating modes
    enum def InfraredMode {
        enum Proximity;
        enum Beacon;
        enum Remote;
    }

}
