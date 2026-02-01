package EV3Electronics::Brick {
    doc /*
     * EV3 Intelligent Brick - Electronic Component Definitions
     *
     * This package defines the EV3 Programmable Brick (Design ID: 95646)
     * with all its electronic components, ports, and specifications.
     *
     * The EV3 Intelligent Brick is the central processing unit of the
     * LEGO Mindstorms EV3 system, featuring an ARM9 processor, multiple
     * I/O ports, and various communication interfaces.
     */

    import EV3Interfaces::*;
    import EV3Types::*;

    /**
     * ARM9 Processor - Main processing unit for the EV3 Brick
     * Texas Instruments AM1808 ARM9 processor at 300MHz
     */
    part def ARM9Processor {
        doc /* ARM9 processor specifications */

        attribute clockSpeed : Real = 300.0;      // MHz
        attribute architecture : String = "ARM926EJ-S";
        attribute manufacturer : String = "Texas Instruments";
        attribute partNumber : String = "AM1808";
        attribute coreBits : Integer = 32;
    }

    /**
     * RAM Memory Module - 64MB DDR RAM
     */
    part def RAMModule {
        doc /* DDR RAM module specifications */

        attribute capacity : Integer = 64;        // MB
        attribute type : String = "DDR";
        attribute busWidth : Integer = 16;        // bits
    }

    /**
     * Flash Memory Module - 16MB Flash storage
     */
    part def FlashMemory {
        doc /* Flash storage specifications */

        attribute capacity : Integer = 16;        // MB
        attribute type : String = "NAND Flash";
    }

    /**
     * MicroSD Card Slot - Expandable storage interface
     */
    part def MicroSDSlot {
        doc /* MicroSD card slot for expandable storage */

        attribute maxCapacity : Integer = 32;     // GB
        attribute interface : String = "SD/SDHC";
        attribute hasCard : Boolean;
    }

    /**
     * LCD Display Module - 178x128 pixel monochrome display
     */
    part def LCDDisplay {
        doc /* Monochrome LCD display specifications */

        attribute widthPixels : Integer = 178;
        attribute heightPixels : Integer = 128;
        attribute displayType : String = "Monochrome LCD";
        attribute backlight : Boolean = false;
        attribute isOn : Boolean;
    }

    /**
     * Button Panel - 6 navigation buttons with center select
     */
    part def ButtonPanel {
        doc /* Physical button panel with 6 buttons */

        attribute buttonCount : Integer = 6;
        attribute buttonLayout : String = "D-pad with center and back";

        // Button states
        attribute leftPressed : Boolean;
        attribute rightPressed : Boolean;
        attribute upPressed : Boolean;
        attribute downPressed : Boolean;
        attribute centerPressed : Boolean;
        attribute backPressed : Boolean;
    }

    /**
     * Speaker Module - Built-in speaker for audio output
     */
    part def SpeakerModule {
        doc /* Internal speaker for sound playback */

        attribute maxFrequency : Integer = 10000;   // Hz
        attribute minFrequency : Integer = 250;     // Hz
        attribute maxVolume : Integer = 100;        // percent
        attribute sampleRate : Integer = 8000;      // Hz
        attribute currentVolume : Integer;
        attribute isPlaying : Boolean;
    }

    /**
     * Status LED - Multi-color LED indicator
     */
    part def StatusLED {
        doc /* RGB status LED around buttons */

        attribute colors : String = "Red, Green, Orange";
        attribute patterns : String = "Solid, Pulsing, Off";
        attribute currentColor : String;
        attribute currentPattern : String;
        attribute brightness : Integer;             // 0-100 percent
    }

    /**
     * Bluetooth Module - Bluetooth 2.1 + EDR communication
     */
    part def BluetoothModule {
        doc /* Bluetooth communication module */

        attribute version : String = "2.1 + EDR";
        attribute maxConnections : Integer = 7;
        attribute range : Real = 10.0;              // meters
        attribute isEnabled : Boolean;
        attribute isConnected : Boolean;
        attribute pairedDevices : Integer;
    }

    /**
     * WiFi Module - Optional USB WiFi dongle support
     */
    part def WiFiModule {
        doc /* WiFi communication via USB dongle */

        attribute standard : String = "802.11 b/g/n";
        attribute usbDongleRequired : Boolean = true;
        attribute isEnabled : Boolean;
        attribute isConnected : Boolean;
        attribute ssid : String;
    }

    /**
     * USB Host Port - USB 1.1 host interface
     */
    part def USBHostPort {
        doc /* USB host port for accessories */

        attribute version : String = "1.1";
        attribute maxCurrent : Integer = 500;       // mA
        attribute connectorType : String = "USB-A";
        attribute isConnected : Boolean;
    }

    /**
     * USB Device Port - Mini-USB for PC connection
     */
    part def USBDevicePort {
        doc /* Mini-USB port for PC connection */

        attribute version : String = "2.0";
        attribute connectorType : String = "Mini-USB";
        attribute isConnected : Boolean;
    }

    /**
     * Motor Output Port - RJ12 connector for motor control
     */
    part def MotorOutputPort {
        doc /* Motor output port with encoder feedback */

        attribute connectorType : String = "RJ12 (6P6C)";
        attribute maxCurrent : Real = 1.0;          // Amps
        attribute pwmFrequency : Integer = 8000;    // Hz
        attribute encoderSupport : Boolean = true;
        attribute portLabel : String;               // A, B, C, or D
        attribute isConnected : Boolean;
    }

    /**
     * Sensor Input Port - RJ12 connector for sensor input
     */
    part def SensorInputPort {
        doc /* Sensor input port with auto-ID */

        attribute connectorType : String = "RJ12 (6P6C)";
        attribute analogResolution : Integer = 10;  // bits
        attribute digitalI2C : Boolean = true;
        attribute uartSupport : Boolean = true;
        attribute autoIdSupport : Boolean = true;
        attribute portLabel : String;               // 1, 2, 3, or 4
        attribute isConnected : Boolean;
        attribute sensorType : String;
    }

    /**
     * EV3 Intelligent Brick (Design ID: 95646)
     * The main programmable brick for the EV3 system
     */
    part def EV3IntelligentBrick {
        doc /*
         * LEGO EV3 Intelligent Brick - Design ID: 95646
         *
         * The central processing and control unit of the EV3 Mindstorms system.
         * Features ARM9 processor, 64MB RAM, 16MB Flash, and multiple I/O ports.
         */

        // LEGO identification attributes
        attribute designId : String = "95646";
        attribute elementId : String = "4575001";
        attribute partName : String = "EV3 Intelligent Brick";
        attribute partCategory : String = "Electronic";

        // Physical dimensions (mm)
        attribute length : Real = 112.0;
        attribute width : Real = 72.0;
        attribute height : Real = 48.0;

        // Physical properties
        attribute mass : Real = 287.0;              // grams (without battery)
        attribute massWithBattery : Real = 500.0;   // grams (with rechargeable battery)
        attribute material : String = "ABS Plastic";
        attribute color : String = "White/Gray";

        // Operating specifications
        attribute operatingVoltage : Real = 7.4;    // volts nominal
        attribute minVoltage : Real = 6.0;          // volts minimum
        attribute maxVoltage : Real = 8.4;          // volts maximum (fully charged)

        // Internal components
        part processor : ARM9Processor;
        part ram : RAMModule;
        part flash : FlashMemory;
        part sdSlot : MicroSDSlot;
        part display : LCDDisplay;
        part buttons : ButtonPanel;
        part speaker : SpeakerModule;
        part statusLED : StatusLED;
        part bluetooth : BluetoothModule;
        part wifi : WiFiModule;
        part usbHost : USBHostPort;
        part usbDevice : USBDevicePort;

        // Motor output ports (A-D)
        part motorPortA : MotorOutputPort {
            attribute :>> portLabel = "A";
        }
        part motorPortB : MotorOutputPort {
            attribute :>> portLabel = "B";
        }
        part motorPortC : MotorOutputPort {
            attribute :>> portLabel = "C";
        }
        part motorPortD : MotorOutputPort {
            attribute :>> portLabel = "D";
        }

        // Sensor input ports (1-4)
        part sensorPort1 : SensorInputPort {
            attribute :>> portLabel = "1";
        }
        part sensorPort2 : SensorInputPort {
            attribute :>> portLabel = "2";
        }
        part sensorPort3 : SensorInputPort {
            attribute :>> portLabel = "3";
        }
        part sensorPort4 : SensorInputPort {
            attribute :>> portLabel = "4";
        }

        // Communication ports
        port bluetoothComm : BluetoothPort;
        port usbComm : USBPort;

        // Firmware and system info
        attribute firmwareVersion : String;
        attribute osVersion : String = "Linux";
        attribute serialNumber : String;
        attribute deviceName : String;
    }
}
