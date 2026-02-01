package EV3Types {
    doc /* LEGO Mindstorms EV3 Type Definitions
     *
     * This package defines all enumerations used throughout the EV3 model
     * including electronic components, Technic structural elements, and
     * operational modes.
     */

    // =====================================================================
    // Technic Color Palette
    // =====================================================================

    /** Standard LEGO Technic brick and element colors */
    enum def TechnicColor {
        enum Black;
        enum White;
        enum Red;
        enum Blue;
        enum Yellow;
        enum LightGray;
        enum DarkGray;
        enum Orange;
        enum Green;
        enum Tan;
        enum LightBluishGray;
        enum DarkBluishGray;
    }

    // =====================================================================
    // EV3 Port Definitions
    // =====================================================================

    /** Combined port enumeration for EV3 brick connections */
    enum def EV3Port {
        doc /* Motor ports (A-D) and Sensor ports (1-4) on the EV3 brick */
        enum PortA;  // Motor port A
        enum PortB;  // Motor port B
        enum PortC;  // Motor port C
        enum PortD;  // Motor port D
        enum Port1;  // Sensor port 1
        enum Port2;  // Sensor port 2
        enum Port3;  // Sensor port 3
        enum Port4;  // Sensor port 4
    }

    /** Motor port identifiers on the EV3 brick (A-D) */
    enum def MotorPort {
        enum A;
        enum B;
        enum C;
        enum D;
    }

    /** Sensor port identifiers on the EV3 brick (1-4) */
    enum def SensorPort {
        enum S1;
        enum S2;
        enum S3;
        enum S4;
    }

    // =====================================================================
    // Component Type Definitions
    // =====================================================================

    /** EV3 motor types */
    enum def MotorType {
        doc /* Large motor: 160-170 RPM, high torque
               Medium motor: 240-250 RPM, faster response */
        enum Large;
        enum Medium;
    }

    /** EV3 sensor types */
    enum def SensorType {
        enum Touch;
        enum Color;
        enum Ultrasonic;
        enum Gyro;
        enum Infrared;
    }

    // =====================================================================
    // Material and Construction Types
    // =====================================================================

    /** Materials used in Technic elements */
    enum def Material {
        enum ABS;     // Standard LEGO plastic
        enum Rubber;  // Tires, treads, bands
        enum Metal;   // Axles, pins in some sets
    }

    /** Technic pin friction types */
    enum def PinType {
        enum Friction;    // Black/blue pins with friction ridges
        enum NoFriction;  // Tan/gray smooth pins
    }

    /** Gear tooth profiles */
    enum def GearProfile {
        enum Spur;         // Standard straight-cut gears
        enum Bevel;        // Single bevel (12t, 20t)
        enum DoubleBevel;  // Double bevel (12t, 20t, 36t)
        enum Worm;         // Worm gear (continuous helix)
        enum Rack;         // Linear rack gear
    }

    // =====================================================================
    // Color Sensor Definitions
    // =====================================================================

    /** Colors detectable by the EV3 color sensor */
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

    /** Color sensor operating modes */
    enum def ColorSensorMode {
        enum ColorMode;       // Detect discrete colors
        enum ReflectedLight;  // Measure reflected light intensity
        enum AmbientLight;    // Measure ambient light intensity
        enum RGBRaw;          // Raw RGB values
    }

    // =====================================================================
    // Motor Control Definitions
    // =====================================================================

    /** Motor direction and braking modes */
    enum def MotorDirection {
        enum Forward;
        enum Reverse;
        enum Brake;   // Active braking
        enum Coast;   // Passive stop
    }

    // =====================================================================
    // Sensor Mode Definitions
    // =====================================================================

    /** Ultrasonic sensor operating modes */
    enum def UltrasonicMode {
        enum Distance;   // Measure distance in cm
        enum Presence;   // Detect presence of objects
    }

    /** Gyroscopic sensor operating modes */
    enum def GyroMode {
        enum Angle;        // Accumulated angle
        enum Rate;         // Rotation rate
        enum AngleAndRate; // Both measurements
    }

    /** Infrared sensor operating modes */
    enum def InfraredMode {
        enum Proximity;  // Distance approximation
        enum Beacon;     // Track IR beacon
        enum Remote;     // IR remote control
    }

    // =====================================================================
    // User Interface Definitions
    // =====================================================================

    /** EV3 brick button identifiers */
    enum def BrickButton {
        enum Left;
        enum Right;
        enum Up;
        enum Down;
        enum Center;
        enum Back;
    }

    /** Sound playback types */
    enum def SoundType {
        enum Tone;  // Generate frequency tone
        enum File;  // Play audio file
    }
}
