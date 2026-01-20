package EV3Electronics::Cables {
    doc /*
     * EV3 Cables - Connection Cable Definitions
     *
     * This package defines the connection cables for EV3 components:
     * - Sensor/Motor Cable 25cm (Design ID: 55804)
     * - Sensor/Motor Cable 35cm (Design ID: 55805)
     * - Sensor/Motor Cable 50cm (Design ID: 55806)
     * - USB Cable (Design ID: 10916): 2m length for PC connection
     *
     * All sensor/motor cables use RJ12 (6P6C) connectors and carry
     * power, ground, and data signals for motor control and sensor input.
     */

    /**
     * RJ12 Connector - Standard 6P6C modular connector
     */
    part def RJ12Connector {
        doc /*
         * RJ12 6P6C modular connector used on all EV3 sensor/motor cables
         * Pin assignments:
         * - Pin 1: Analog input / Motor encoder A
         * - Pin 2: Ground
         * - Pin 3: Ground
         * - Pin 4: Power (4.3V regulated)
         * - Pin 5: Digital I/O / I2C SDA / Motor encoder B
         * - Pin 6: Digital I/O / I2C SCL / Motor PWM
         */

        attribute connectorType : String = "RJ12 6P6C";
        attribute contacts : Integer = 6;
        attribute pitch : Real = 1.27;              // mm between pins
        attribute insertionForce : Real = 5.0;      // Newtons
        attribute extractionForce : Real = 3.0;     // Newtons
        attribute matingCycles : Integer = 750;     // rated insertion/extraction cycles
        attribute color : String = "Clear";
    }

    /**
     * Abstract base definition for EV3 sensor/motor cables
     */
    abstract part def EV3CableBase {
        doc /* Base definition for all EV3 RJ12 cables */

        // Cable construction
        attribute conductorCount : Integer = 6;
        attribute conductorGauge : Integer = 26;    // AWG
        attribute conductorType : String = "Stranded copper";
        attribute jacketMaterial : String = "PVC";
        attribute jacketColor : String = "White";

        // Electrical specifications
        attribute maxCurrent : Real = 1.0;          // Amps per conductor
        attribute maxVoltage : Real = 12.0;         // Volts
        attribute resistance : Real;                // Ohms per meter

        // Connectors
        part connector1 : RJ12Connector;
        part connector2 : RJ12Connector;
    }

    /**
     * EV3 Cable 25cm (Design ID: 55804)
     * Short connection cable for compact builds
     */
    part def Cable25cm :> EV3CableBase {
        doc /*
         * LEGO EV3 Connection Cable 25cm - Design ID: 55804
         *
         * Short cable ideal for compact robot designs where sensors
         * or motors are mounted close to the EV3 brick.
         */

        // LEGO identification attributes
        attribute designId : String = "55804";
        attribute elementId : String = "4563089";
        attribute partName : String = "EV3 Cable 25cm";
        attribute partCategory : String = "Electronic";

        // Physical dimensions
        attribute length : Real = 250.0;            // mm
        attribute cableDiameter : Real = 4.5;       // mm

        // Physical properties
        attribute mass : Real = 12.0;               // grams
        attribute material : String = "PVC/Copper";
        attribute color : String = "White";

        // Electrical characteristics
        attribute :>> resistance = 0.08;            // Ohms total (both ways)
        attribute capacitance : Real = 50.0;        // pF total
    }

    /**
     * EV3 Cable 35cm (Design ID: 55805)
     * Medium length connection cable
     */
    part def Cable35cm :> EV3CableBase {
        doc /*
         * LEGO EV3 Connection Cable 35cm - Design ID: 55805
         *
         * Medium-length cable for typical robot configurations
         * where moderate routing distance is required.
         */

        // LEGO identification attributes
        attribute designId : String = "55805";
        attribute elementId : String = "4563090";
        attribute partName : String = "EV3 Cable 35cm";
        attribute partCategory : String = "Electronic";

        // Physical dimensions
        attribute length : Real = 350.0;            // mm
        attribute cableDiameter : Real = 4.5;       // mm

        // Physical properties
        attribute mass : Real = 15.0;               // grams
        attribute material : String = "PVC/Copper";
        attribute color : String = "White";

        // Electrical characteristics
        attribute :>> resistance = 0.11;            // Ohms total (both ways)
        attribute capacitance : Real = 70.0;        // pF total
    }

    /**
     * EV3 Cable 50cm (Design ID: 55806)
     * Long connection cable for extended reach
     */
    part def Cable50cm :> EV3CableBase {
        doc /*
         * LEGO EV3 Connection Cable 50cm - Design ID: 55806
         *
         * Long cable for larger robot designs where sensors
         * or motors need to be positioned far from the brick.
         */

        // LEGO identification attributes
        attribute designId : String = "55806";
        attribute elementId : String = "4563091";
        attribute partName : String = "EV3 Cable 50cm";
        attribute partCategory : String = "Electronic";

        // Physical dimensions
        attribute length : Real = 500.0;            // mm
        attribute cableDiameter : Real = 4.5;       // mm

        // Physical properties
        attribute mass : Real = 20.0;               // grams
        attribute material : String = "PVC/Copper";
        attribute color : String = "White";

        // Electrical characteristics
        attribute :>> resistance = 0.16;            // Ohms total (both ways)
        attribute capacitance : Real = 100.0;       // pF total
    }

    /**
     * USB Type-A Connector
     */
    part def USBTypeAConnector {
        doc /* Standard USB Type-A connector */

        attribute connectorType : String = "USB Type-A";
        attribute version : String = "2.0";
        attribute contacts : Integer = 4;
        attribute matingCycles : Integer = 1500;
        attribute color : String = "Black";
    }

    /**
     * Mini-USB Connector
     */
    part def MiniUSBConnector {
        doc /* Mini-USB Type-B connector */

        attribute connectorType : String = "Mini-USB Type-B";
        attribute version : String = "2.0";
        attribute contacts : Integer = 5;
        attribute matingCycles : Integer = 5000;
        attribute color : String = "Black";
    }

    /**
     * EV3 USB Cable (Design ID: 10916)
     * 2-meter USB cable for PC connection
     */
    part def USBCable {
        doc /*
         * LEGO EV3 USB Cable - Design ID: 10916
         *
         * USB cable for connecting the EV3 brick to a PC for
         * programming, data transfer, and firmware updates.
         * Features USB Type-A to Mini-USB connectors.
         */

        // LEGO identification attributes
        attribute designId : String = "10916";
        attribute elementId : String = "6012820";
        attribute partName : String = "EV3 USB Cable";
        attribute partCategory : String = "Electronic";

        // Physical dimensions
        attribute length : Real = 2000.0;           // mm (2 meters)
        attribute cableDiameter : Real = 4.0;       // mm

        // Physical properties
        attribute mass : Real = 45.0;               // grams
        attribute material : String = "PVC/Copper";
        attribute color : String = "Black";

        // USB specifications
        attribute usbVersion : String = "2.0";
        attribute maxDataRate : Real = 480.0;       // Mbps (High Speed)
        attribute maxCurrent : Real = 0.5;          // Amps

        // Electrical characteristics
        attribute shielding : String = "Foil + Braid";
        attribute impedance : Real = 90.0;          // Ohms (differential)

        // Connectors
        part hostConnector : USBTypeAConnector;
        part deviceConnector : MiniUSBConnector;
    }

    /**
     * Cable length selection guide
     */
    part def CableLengthGuide {
        doc /*
         * Reference guide for selecting appropriate cable length
         * based on robot size and configuration
         */

        // Recommended uses
        attribute cable25cmUse : String = "Compact builds, brick-mounted sensors";
        attribute cable35cmUse : String = "Medium robots, wheel-mounted motors";
        attribute cable50cmUse : String = "Large robots, arm mechanisms, remote sensors";

        // Available lengths
        attribute shortLength : Real = 250.0;       // mm
        attribute mediumLength : Real = 350.0;      // mm
        attribute longLength : Real = 500.0;        // mm
    }
}
