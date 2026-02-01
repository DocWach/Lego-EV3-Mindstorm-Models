package EV3Sensors {
    import EV3Interfaces::*;
    import EV3Types::*;

    /**
     * Abstract base sensor definition for all EV3 sensors
     */
    part def EV3SensorBase {
        attribute isConnected : Boolean;
        attribute sampleRate : Integer;
    }

    /**
     * EV3 Color Sensor - Detects colors, reflected light, and ambient light
     * Based on LEGO EV3 Color Sensor specifications
     */
    part def EV3ColorSensor :> EV3SensorBase {
        attribute detectionDistance : Real = 16.0;
        attribute colorAccuracy : Real = 0.95;
        attribute reflectedRange : Integer = 100;
        attribute ambientRange : Integer = 100;
        attribute currentMode : ColorSensorMode;
        attribute lastColor : Color;
        attribute lastReflected : Integer;
        attribute lastAmbient : Integer;
        attribute lastRed : Integer;
        attribute lastGreen : Integer;
        attribute lastBlue : Integer;
        port output : ColorSensorPort;
    }

    /**
     * EV3 Touch Sensor - Simple bump/press detection
     * Based on LEGO EV3 Touch Sensor specifications
     */
    part def EV3TouchSensor :> EV3SensorBase {
        attribute buttonTravel : Real = 4.0;
        attribute activationForce : Real = 1.5;
        attribute currentState : Boolean;
        attribute pressCount : Integer;
        port output : TouchSensorPort;
    }

    /**
     * EV3 Ultrasonic Sensor - Distance measurement using ultrasonic waves
     * Based on LEGO EV3 Ultrasonic Sensor specifications
     * Range: 3-250 cm, Accuracy: +/- 1 cm, Beam angle: 30 degrees
     */
    part def EV3UltrasonicSensor :> EV3SensorBase {
        attribute minDistance : Real = 3.0;
        attribute maxDistance : Real = 250.0;
        attribute accuracy : Real = 1.0;
        attribute beamAngle : Real = 30.0;
        attribute frequency : Real = 40000.0;
        attribute currentMode : UltrasonicMode;
        attribute lastDistance : Real;
        attribute objectDetected : Boolean;
        port output : UltrasonicSensorPort;
    }

    /**
     * EV3 Gyro Sensor - Measures rotation rate and accumulated angle
     * Based on LEGO EV3 Gyro Sensor specifications
     * Max rate: 440 deg/s, Accuracy: +/- 3 degrees, Internal rate: 1kHz
     */
    part def EV3GyroSensor :> EV3SensorBase {
        attribute maxRate : Integer = 440;
        attribute rateAccuracy : Real = 3.0;
        attribute sampleRateHz : Integer = 1000;
        attribute drift : Real = 0.1;
        attribute currentMode : GyroMode;
        attribute accumulatedAngle : Integer;
        attribute currentRate : Integer;
        attribute isCalibrated : Boolean;
        port output : GyroSensorPort;
    }

    /**
     * EV3 Infrared Sensor - Proximity detection and beacon tracking
     * Based on LEGO EV3 Infrared Sensor specifications
     * Proximity: ~70 cm, Beacon range: ~200 cm, 4 channels
     */
    part def EV3InfraredSensor :> EV3SensorBase {
        attribute proximityRange : Integer = 70;
        attribute beaconRange : Integer = 200;
        attribute beaconChannels : Integer = 4;
        attribute headingRange : Integer = 25;
        attribute currentMode : InfraredMode;
        attribute selectedChannel : Integer;
        attribute lastProximity : Integer;
        attribute lastHeading : Integer;
        attribute lastBeaconDistance : Integer;
        attribute beaconFound : Boolean;
        port output : InfraredSensorPort;
    }

    /**
     * EV3 Infrared Beacon - Remote control and tracking beacon
     * Works with EV3 Infrared Sensor for remote control and seek modes
     */
    part def EV3InfraredBeacon {
        attribute channel : Integer;
        attribute isTransmitting : Boolean;
        attribute batteryOk : Boolean;
    }
}
