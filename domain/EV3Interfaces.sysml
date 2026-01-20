package EV3Interfaces {
    import EV3Types::*;

    /**
     * Power supply interface for EV3 components.
     * Provides voltage and current from the battery or power source.
     */
    port def PowerPort {
        in attribute voltage : Real;    // volts
        in attribute current : Real;    // amps
    }

    /**
     * Motor control signals for EV3 large and medium motors.
     * Controls speed, direction, and encoder reset.
     */
    port def MotorControlPort {
        in attribute speed : Integer;         // -100 to 100 percent
        in attribute direction : MotorDirection;
        in attribute targetAngle : Integer;   // degrees
        in attribute resetEncoder : Boolean;
    }

    /**
     * Motor feedback signals from EV3 motors.
     * Provides position, velocity, stall detection, and current draw.
     */
    port def MotorFeedbackPort {
        out attribute position : Integer;   // encoder degrees
        out attribute velocity : Integer;   // degrees/second
        out attribute isStalled : Boolean;
        out attribute current : Real;       // amps
    }

    /**
     * Color sensor data port for EV3 color sensor.
     * Supports color detection, reflected light, ambient light, and RGB modes.
     */
    port def ColorSensorPort {
        out attribute color : Color;
        out attribute reflectedLight : Integer;  // 0-100
        out attribute ambientLight : Integer;    // 0-100
        out attribute rgbRed : Integer;
        out attribute rgbGreen : Integer;
        out attribute rgbBlue : Integer;
    }

    /**
     * Touch sensor data port for EV3 touch sensor.
     * Provides press state and bump count.
     */
    port def TouchSensorPort {
        out attribute isPressed : Boolean;
        out attribute bumpCount : Integer;
    }

    /**
     * Ultrasonic sensor data port for EV3 ultrasonic sensor.
     * Provides distance measurement and presence detection.
     */
    port def UltrasonicSensorPort {
        out attribute distance : Real;      // centimeters, 3-250 range
        out attribute presence : Boolean;
    }

    /**
     * Gyroscope sensor data port for EV3 gyro sensor.
     * Provides accumulated angle and rotation rate.
     */
    port def GyroSensorPort {
        out attribute angle : Integer;  // accumulated degrees
        out attribute rate : Integer;   // degrees/second
    }

    /**
     * Infrared sensor data port for EV3 infrared sensor.
     * Supports proximity, beacon tracking, and remote control modes.
     */
    port def InfraredSensorPort {
        out attribute proximity : Integer;       // 0-100 percent
        out attribute beaconHeading : Integer;   // -25 to 25
        out attribute beaconDistance : Integer;  // 0-100
        out attribute beaconDetected : Boolean;
    }

    /**
     * LCD display interface for EV3 brick display.
     * Allows text rendering at specified coordinates.
     */
    port def DisplayPort {
        in attribute text : String;
        in attribute xPos : Integer;
        in attribute yPos : Integer;
        in attribute fontSize : Integer;
    }

    /**
     * Speaker interface for EV3 brick speaker.
     * Supports tone generation with frequency, duration, and volume control.
     */
    port def SpeakerPort {
        in attribute frequency : Integer;  // Hz
        in attribute duration : Integer;   // milliseconds
        in attribute volume : Integer;     // 0-100
    }

    /**
     * Bluetooth communication port for EV3 brick.
     * Provides bidirectional data transfer and connection status.
     */
    port def BluetoothPort {
        in attribute txData : String;
        out attribute rxData : String;
        out attribute isConnected : Boolean;
    }

    /**
     * USB communication port for EV3 brick.
     * Provides bidirectional data transfer and connection status.
     */
    port def USBPort {
        in attribute txData : String;
        out attribute rxData : String;
        out attribute isConnected : Boolean;
    }
}
