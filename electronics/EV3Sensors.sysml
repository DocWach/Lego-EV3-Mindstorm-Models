package EV3Electronics::Sensors {
    doc /*
     * EV3 Sensors - Electronic Component Definitions
     *
     * This package defines all EV3 sensor types:
     * - Touch Sensor (Design ID: 95648): Binary press detection
     * - Color Sensor (Design ID: 95650): 8 colors, light modes
     * - Ultrasonic Sensor (Design ID: 95652): Distance measurement
     * - Gyro Sensor (Design ID: 99380): Rotation rate and angle
     * - Infrared Sensor (Design ID: 95654): Proximity and beacon tracking
     * - Infrared Beacon (Design ID: 72156): Remote control transmitter
     */

    import EV3Interfaces::*;
    import EV3Types::*;

    /**
     * EV3 Touch Sensor (Design ID: 95648)
     * Simple binary press/release detection
     */
    part def TouchSensor {
        doc /*
         * LEGO EV3 Touch Sensor - Design ID: 95648
         *
         * Simple momentary push-button sensor for detecting press and release.
         * Ideal for bump detection, limit switches, and user input.
         * Features a spring-loaded button with tactile feedback.
         */

        // LEGO identification attributes
        attribute designId : String = "95648";
        attribute elementId : String = "6008472";
        attribute partName : String = "EV3 Touch Sensor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 24.0;
        attribute height : Real = 32.0;
        attribute buttonDiameter : Real = 8.0;

        // Physical properties
        attribute mass : Real = 24.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Black";
        attribute buttonColor : String = "Red";

        // Mechanical specifications
        attribute buttonTravel : Real = 4.0;        // mm
        attribute activationForce : Real = 1.5;     // Newtons
        attribute springReturnForce : Real = 0.5;   // Newtons

        // Electrical specifications
        attribute outputType : String = "Analog";
        attribute pressedValue : Integer = 1;
        attribute releasedValue : Integer = 0;

        // Current state
        attribute isPressed : Boolean;
        attribute pressCount : Integer;
        attribute lastPressTime : Integer;          // milliseconds

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";

        // Output port
        port output : TouchSensorPort;
    }

    /**
     * EV3 Color Sensor (Design ID: 95650)
     * Multi-mode color and light sensor
     */
    part def ColorSensor {
        doc /*
         * LEGO EV3 Color Sensor - Design ID: 95650
         *
         * Versatile sensor supporting multiple operating modes:
         * - Color Mode: Detects 8 distinct colors
         * - Reflected Light: Measures surface reflectivity (0-100)
         * - Ambient Light: Measures environmental brightness (0-100)
         * - RGB Raw: Provides raw red, green, blue values
         *
         * Optimal detection distance is approximately 16mm from surface.
         */

        // LEGO identification attributes
        attribute designId : String = "95650";
        attribute elementId : String = "6008919";
        attribute partName : String = "EV3 Color Sensor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 24.0;
        attribute height : Real = 32.0;
        attribute apertureWidth : Real = 8.0;
        attribute apertureHeight : Real = 4.0;

        // Physical properties
        attribute mass : Real = 26.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Black";
        attribute lensColor : String = "Clear";

        // Optical specifications
        attribute optimalDistance : Real = 16.0;    // mm
        attribute maxDistance : Real = 40.0;        // mm (reduced accuracy)
        attribute fieldOfView : Real = 20.0;        // degrees

        // Color detection specifications
        attribute detectableColors : Integer = 8;
        attribute colorAccuracy : Real = 0.95;      // 95% under ideal conditions
        // Detectable: None, Black, Blue, Green, Yellow, Red, White, Brown

        // Light measurement specifications
        attribute reflectedRange : Integer = 100;   // 0-100 scale
        attribute ambientRange : Integer = 100;     // 0-100 scale
        attribute lightResolution : Integer = 1;    // unit steps

        // Operating modes
        attribute supportedModes : String = "Color, Reflected, Ambient, RGB Raw";
        attribute currentMode : ColorSensorMode;
        attribute sampleRate : Integer = 1000;      // Hz

        // Current readings
        attribute lastColor : Color;
        attribute lastReflected : Integer;
        attribute lastAmbient : Integer;
        attribute lastRed : Integer;
        attribute lastGreen : Integer;
        attribute lastBlue : Integer;

        // Calibration
        attribute isCalibrated : Boolean;
        attribute whiteReference : Integer;
        attribute blackReference : Integer;

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";

        // Output port
        port output : ColorSensorPort;
    }

    /**
     * EV3 Ultrasonic Sensor (Design ID: 95652)
     * Distance measurement using ultrasonic waves
     */
    part def UltrasonicSensor {
        doc /*
         * LEGO EV3 Ultrasonic Sensor - Design ID: 95652
         *
         * Uses ultrasonic sound waves to measure distance to objects.
         * Features two "eyes" - one transmitter and one receiver.
         *
         * Specifications:
         * - Range: 3-250 cm
         * - Accuracy: +/- 1 cm
         * - Beam angle: 30 degrees
         */

        // LEGO identification attributes
        attribute designId : String = "95652";
        attribute elementId : String = "6008577";
        attribute partName : String = "EV3 Ultrasonic Sensor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 32.0;
        attribute height : Real = 32.0;
        attribute eyeDiameter : Real = 12.0;
        attribute eyeSpacing : Real = 16.0;

        // Physical properties
        attribute mass : Real = 34.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Black";
        attribute eyeColor : String = "Silver";

        // Ultrasonic specifications
        attribute frequency : Real = 40000.0;       // Hz (40 kHz)
        attribute minDistance : Real = 3.0;         // cm
        attribute maxDistance : Real = 250.0;       // cm
        attribute accuracy : Real = 1.0;            // cm
        attribute beamAngle : Real = 30.0;          // degrees (cone width)
        attribute resolution : Real = 0.1;          // cm

        // Timing specifications
        attribute pulseWidth : Real = 0.5;          // milliseconds
        attribute echoTimeout : Real = 15.0;        // milliseconds
        attribute sampleRate : Integer = 100;       // Hz

        // Operating modes
        attribute supportedModes : String = "Distance, Presence";
        attribute currentMode : UltrasonicMode;

        // Current readings
        attribute lastDistance : Real;              // cm
        attribute objectDetected : Boolean;
        attribute signalStrength : Integer;         // 0-100

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";

        // Output port
        port output : UltrasonicSensorPort;
    }

    /**
     * EV3 Gyro Sensor (Design ID: 99380)
     * Rotation rate and accumulated angle measurement
     */
    part def GyroSensor {
        doc /*
         * LEGO EV3 Gyro Sensor - Design ID: 99380
         *
         * Measures rotation rate (angular velocity) and accumulated angle.
         * Single-axis gyroscope for detecting turns and maintaining heading.
         *
         * Specifications:
         * - Max rate: +/- 440 degrees/second
         * - Accuracy: +/- 3 degrees
         * - Internal sample rate: 1000 Hz
         */

        // LEGO identification attributes
        attribute designId : String = "99380";
        attribute elementId : String = "6024105";
        attribute partName : String = "EV3 Gyro Sensor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 24.0;
        attribute height : Real = 32.0;

        // Physical properties
        attribute mass : Real = 28.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Black";

        // Gyroscope specifications
        attribute measurementAxis : String = "Single-axis (vertical)";
        attribute maxRate : Integer = 440;          // degrees/second
        attribute minRate : Integer = -440;         // degrees/second
        attribute rateAccuracy : Real = 3.0;        // degrees
        attribute rateResolution : Real = 1.0;      // degrees/second

        // Angle specifications
        attribute angleRange : String = "Unlimited (accumulated)";
        attribute angleAccuracy : Real = 3.0;       // degrees (cumulative)
        attribute drift : Real = 0.1;               // degrees/second typical

        // Internal specifications
        attribute internalSampleRate : Integer = 1000;  // Hz
        attribute outputSampleRate : Integer = 100;     // Hz
        attribute filterType : String = "Low-pass";

        // Operating modes
        attribute supportedModes : String = "Angle, Rate, Angle and Rate";
        attribute currentMode : GyroMode;

        // Current readings
        attribute accumulatedAngle : Integer;       // degrees
        attribute currentRate : Integer;            // degrees/second
        attribute isCalibrated : Boolean;
        attribute calibrationTime : Integer;        // milliseconds

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";

        // Output port
        port output : GyroSensorPort;
    }

    /**
     * EV3 Infrared Sensor (Design ID: 95654)
     * Proximity detection and beacon tracking
     */
    part def InfraredSensor {
        doc /*
         * LEGO EV3 Infrared Sensor - Design ID: 95654
         *
         * Multi-function infrared sensor supporting:
         * - Proximity Mode: Detect obstacles up to 50-70 cm
         * - Beacon Mode: Track IR Beacon direction and distance
         * - Remote Mode: Receive commands from IR Beacon
         *
         * Works in conjunction with the EV3 Infrared Beacon.
         */

        // LEGO identification attributes
        attribute designId : String = "95654";
        attribute elementId : String = "6008920";
        attribute partName : String = "EV3 Infrared Sensor";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 56.0;
        attribute width : Real = 32.0;
        attribute height : Real = 32.0;
        attribute lensWidth : Real = 24.0;

        // Physical properties
        attribute mass : Real = 32.0;               // grams
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Black";
        attribute lensColor : String = "Dark Red";

        // Proximity specifications
        attribute proximityRange : Integer = 70;    // cm approximate
        attribute proximityMin : Integer = 0;       // cm
        attribute proximityResolution : Integer = 1; // percent (0-100 scale)
        attribute proximityAngle : Real = 35.0;     // degrees field of view

        // Beacon tracking specifications
        attribute beaconRange : Integer = 200;      // cm approximate
        attribute beaconChannels : Integer = 4;
        attribute headingRange : Integer = 25;      // -25 to +25 degrees
        attribute headingResolution : Integer = 1;  // degree

        // Remote control specifications
        attribute remoteButtons : Integer = 4;
        attribute remoteChannels : Integer = 4;

        // Infrared specifications
        attribute wavelength : Integer = 940;       // nm
        attribute sampleRate : Integer = 100;       // Hz

        // Operating modes
        attribute supportedModes : String = "Proximity, Beacon, Remote";
        attribute currentMode : InfraredMode;
        attribute selectedChannel : Integer;

        // Current readings
        attribute lastProximity : Integer;          // 0-100 percent
        attribute lastHeading : Integer;            // -25 to +25 degrees
        attribute lastBeaconDistance : Integer;     // 0-100 percent
        attribute beaconFound : Boolean;
        attribute remoteButton : Integer;

        // Connection interface
        attribute connectorType : String = "RJ12 (6P6C)";

        // Output port
        port output : InfraredSensorPort;
    }

    /**
     * EV3 Infrared Beacon (Design ID: 72156)
     * Remote control and tracking beacon
     */
    part def InfraredBeacon {
        doc /*
         * LEGO EV3 Infrared Beacon - Design ID: 72156
         *
         * Handheld remote control and tracking beacon for use with
         * the EV3 Infrared Sensor. Features 4 channels and 4 buttons.
         *
         * Functions:
         * - Remote control: Send button commands to robot
         * - Beacon: Transmit signal for robot to track and follow
         *
         * Powered by 2x AAA batteries (not included).
         */

        // LEGO identification attributes
        attribute designId : String = "72156";
        attribute elementId : String = "6014051";
        attribute partName : String = "EV3 Infrared Beacon";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 120.0;
        attribute width : Real = 56.0;
        attribute height : Real = 24.0;

        // Physical properties
        attribute mass : Real = 45.0;               // grams (without batteries)
        attribute massWithBatteries : Real = 68.0;  // grams (with AAA batteries)
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Red";
        attribute buttonColor : String = "Gray";

        // Power specifications
        attribute batteryType : String = "2x AAA";
        attribute batteryVoltage : Real = 3.0;      // volts (nominal)
        attribute batteryLife : Integer = 100;      // hours typical

        // Transmitter specifications
        attribute wavelength : Integer = 940;       // nm
        attribute transmitRange : Integer = 200;    // cm to sensor
        attribute beamAngle : Real = 60.0;          // degrees
        attribute transmitPower : Real = 0.5;       // mW

        // Channel and button specifications
        attribute channels : Integer = 4;
        attribute buttons : Integer = 4;
        attribute buttonLayout : String = "2x2 grid";
        attribute channelSelector : String = "Rotary switch";

        // Current state
        attribute selectedChannel : Integer;        // 1-4
        attribute isTransmitting : Boolean;
        attribute beaconModeActive : Boolean;
        attribute batteryOk : Boolean;
        attribute batteryLow : Boolean;

        // Button states
        attribute button1Pressed : Boolean;         // Top-left (red up)
        attribute button2Pressed : Boolean;         // Top-right (blue up)
        attribute button3Pressed : Boolean;         // Bottom-left (red down)
        attribute button4Pressed : Boolean;         // Bottom-right (blue down)
        attribute beaconButtonPressed : Boolean;    // Center beacon button
    }
}
