package EV3Pins {
    import EV3Types::*;

    /**
     * Friction type for Technic pins
     */
    enum def FrictionType {
        enum Friction;
        enum Smooth;
        enum Mixed;
    }

    /**
     * Base definition for all Technic pin connectors
     */
    part def TechnicPinBase {
        attribute designId : String;
        attribute partName : String;
        attribute length : Real;
        attribute frictionType : FrictionType;
        attribute material : String default "ABS Plastic";
        attribute color : String;
    }

    /**
     * Pin 2L Friction (Black) - Standard 2-module friction connector pin
     * LEGO Design ID: 2780
     * Most common connector for secure axle-to-beam connections
     */
    part def Pin2LFriction :> TechnicPinBase {
        attribute redefines designId = "2780";
        attribute redefines partName = "Technic Pin with Friction Ridges Lengthwise";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Black";
        attribute ridgeCount : Integer = 8;
    }

    /**
     * Pin 3L Friction (Blue) - Extended 3-module friction connector pin
     * LEGO Design ID: 6558
     * Used for connections requiring extra length and holding power
     */
    part def Pin3LFriction :> TechnicPinBase {
        attribute redefines designId = "6558";
        attribute redefines partName = "Technic Pin 3L with Friction Ridges";
        attribute redefines length = 3.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Blue";
        attribute ridgeCount : Integer = 12;
    }

    /**
     * Pin 2L No Friction (Light Gray) - Smooth 2-module pin for rotating joints
     * LEGO Design ID: 3673
     * Allows free rotation, ideal for pivot points and hinges
     */
    part def Pin2LNoFriction :> TechnicPinBase {
        attribute redefines designId = "3673";
        attribute redefines partName = "Technic Pin without Friction Ridges";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Smooth;
        attribute redefines color = "Light Bluish Gray";
    }

    /**
     * Pin 3L No Friction (Tan) - Extended smooth pin for rotating joints
     * LEGO Design ID: 32556
     * Extended smooth pin allowing free rotation over longer spans
     */
    part def Pin3LNoFriction :> TechnicPinBase {
        attribute redefines designId = "32556";
        attribute redefines partName = "Technic Pin 3L without Friction Ridges";
        attribute redefines length = 3.0;
        attribute redefines frictionType = FrictionType::Smooth;
        attribute redefines color = "Tan";
    }

    /**
     * Half Pin (Light Gray) - Short 0.5-module pin connector
     * LEGO Design ID: 4274
     * Used for compact connections and stud-to-pin adapters
     */
    part def HalfPin :> TechnicPinBase {
        attribute redefines designId = "4274";
        attribute redefines partName = "Technic Pin 1/2";
        attribute redefines length = 0.5;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Light Bluish Gray";
        attribute hasStopRing : Boolean = true;
    }

    /**
     * Axle Pin with Friction (Blue) - Hybrid axle and pin connector
     * LEGO Design ID: 43093
     * Combines axle drive capability with pin connection
     */
    part def AxlePin :> TechnicPinBase {
        attribute redefines designId = "43093";
        attribute redefines partName = "Technic Axle Pin with Friction Ridges";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Blue";
        attribute axleLength : Real = 1.0;
        attribute pinLength : Real = 1.0;
    }

    /**
     * Axle Pin No Friction (Light Gray) - Smooth hybrid axle and pin
     * LEGO Design ID: 3749
     * Allows rotation while providing axle drive on opposite end
     */
    part def AxlePinNoFriction :> TechnicPinBase {
        attribute redefines designId = "3749";
        attribute redefines partName = "Technic Axle Pin without Friction Ridges";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Smooth;
        attribute redefines color = "Light Bluish Gray";
        attribute axleLength : Real = 1.0;
        attribute pinLength : Real = 1.0;
    }

    /**
     * Pin 1L with 2L Axle (Black) - Extended pin-axle combination
     * LEGO Design ID: 18651
     * 1-module pin section with 2-module axle extension
     */
    part def PinAxle1L2L :> TechnicPinBase {
        attribute redefines designId = "18651";
        attribute redefines partName = "Technic Axle 2L with Pin with Friction Ridges";
        attribute redefines length = 3.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Black";
        attribute pinLength : Real = 1.0;
        attribute axleLength : Real = 2.0;
    }

    /**
     * Pin Connector Perpendicular 1.5L (Tan) - Angle connector with pins
     * LEGO Design ID: 32002
     * Creates perpendicular connection between beams
     */
    part def PinConnector1_5 :> TechnicPinBase {
        attribute redefines designId = "32002";
        attribute redefines partName = "Technic Pin Joiner Perpendicular 1.5L";
        attribute redefines length = 1.5;
        attribute redefines frictionType = FrictionType::Mixed;
        attribute redefines color = "Tan";
        attribute angle : Real = 90.0;
    }

    /**
     * Pin Long 3L Double (Tan) - Extended double-ended pin connector
     * LEGO Design ID: 32054
     * Provides secure 3-module connection with friction on both ends
     */
    part def PinLong3L :> TechnicPinBase {
        attribute redefines designId = "32054";
        attribute redefines partName = "Technic Pin 3L Double";
        attribute redefines length = 3.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Tan";
        attribute hasCenterRidge : Boolean = true;
    }

    /**
     * Pin with Ball (Black) - Ball joint pin connector
     * LEGO Design ID: 6628
     * Enables ball-and-socket joint connections
     */
    part def PinWithBall :> TechnicPinBase {
        attribute redefines designId = "6628";
        attribute redefines partName = "Technic Pin with Ball";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Black";
        attribute ballDiameter : Real = 10.2;
    }

    /**
     * Pin with Towball (Light Gray) - Towball-style pin connector
     * LEGO Design ID: 6553
     * Alternative ball joint with towball end
     */
    part def PinWithTowball :> TechnicPinBase {
        attribute redefines designId = "6553";
        attribute redefines partName = "Technic Pin with Towball";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Light Bluish Gray";
        attribute towballDiameter : Real = 6.2;
    }

    /**
     * Pin 1L (Tan) - Short 1-module connector pin
     * LEGO Design ID: 32062
     * Compact pin for tight spaces
     */
    part def Pin1L :> TechnicPinBase {
        attribute redefines designId = "32062";
        attribute redefines partName = "Technic Axle 2 Notched";
        attribute redefines length = 1.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Tan";
    }

    /**
     * Pin Connector Perpendicular 2L (Black) - 2-module angle connector
     * LEGO Design ID: 44809
     * Creates perpendicular connections with extended reach
     */
    part def PinConnector2L :> TechnicPinBase {
        attribute redefines designId = "44809";
        attribute redefines partName = "Technic Pin Joiner Perpendicular 2L";
        attribute redefines length = 2.0;
        attribute redefines frictionType = FrictionType::Mixed;
        attribute redefines color = "Black";
        attribute angle : Real = 90.0;
    }

    /**
     * Pin Connector Round 1L (Tan) - Round profile single-hole connector
     * LEGO Design ID: 18654
     * Cylindrical connector for specialized joints
     */
    part def PinConnectorRound1L :> TechnicPinBase {
        attribute redefines designId = "18654";
        attribute redefines partName = "Technic Pin Connector Round 1L";
        attribute redefines length = 1.0;
        attribute redefines frictionType = FrictionType::Friction;
        attribute redefines color = "Tan";
        attribute isRound : Boolean = true;
    }

}
