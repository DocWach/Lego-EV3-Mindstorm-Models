package EV3Brick {
    import EV3Interfaces::*;

    /**
     * EV3Battery - Rechargeable battery pack for the EV3 Intelligent Brick
     */
    part def EV3Battery {
        attribute nominalVoltage : Real = 7.4;
        attribute capacity : Real = 2050;
        attribute minVoltage : Real = 6.0;
        attribute lowVoltageWarning : Real = 6.5;
        attribute currentVoltage : Real;
        attribute chargePercent : Integer;
    }

    /**
     * EV3ButtonPanel - The 6 physical buttons on the brick
     */
    part def EV3ButtonPanel {
        attribute leftPressed : Boolean;
        attribute rightPressed : Boolean;
        attribute upPressed : Boolean;
        attribute downPressed : Boolean;
        attribute centerPressed : Boolean;
        attribute backPressed : Boolean;
    }

    /**
     * EV3Display - The LCD display
     */
    part def EV3Display {
        attribute width : Integer = 178;
        attribute height : Integer = 128;
        attribute isOn : Boolean;
    }

    /**
     * EV3Speaker - Built-in speaker
     */
    part def EV3Speaker {
        attribute volume : Integer;
        attribute isPlaying : Boolean;
    }

    /**
     * EV3IntelligentBrick - The main EV3 programmable brick
     */
    part def EV3IntelligentBrick {
        attribute serialNumber : String;
        attribute firmwareVersion : String;
        attribute name : String;

        /* Motor control ports (4 output ports A-D) */
        port motorPortA : MotorControlPort;
        port motorPortB : MotorControlPort;
        port motorPortC : MotorControlPort;
        port motorPortD : MotorControlPort;

        /* Motor feedback ports */
        port motorFeedbackA : MotorFeedbackPort;
        port motorFeedbackB : MotorFeedbackPort;
        port motorFeedbackC : MotorFeedbackPort;
        port motorFeedbackD : MotorFeedbackPort;

        /* Sensor ports (4 input ports 1-4) */
        attribute sensorPort1Type : String;
        attribute sensorPort2Type : String;
        attribute sensorPort3Type : String;
        attribute sensorPort4Type : String;

        /* Internal parts */
        part battery : EV3Battery;
        part buttons : EV3ButtonPanel;
        part display : EV3Display;
        part speaker : EV3Speaker;

        /* Communication ports */
        port bluetooth : BluetoothPort;
        port usb : USBPort;
    }
}
