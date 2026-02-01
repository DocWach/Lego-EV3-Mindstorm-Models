package EV3AxleConnectors {
    import EV3Types::*;

    /**
     * Base definition for all Technic cross blocks and angle connectors
     */
    part def TechnicConnectorBase {
        attribute designId : String;
        attribute partName : String;
        attribute axleHoles : Integer;
        attribute pinHoles : Integer;
        attribute material : String default "ABS Plastic";
        attribute color : String;
    }

    /**
     * Cross Block 3M (Dark Bluish Gray) - Perpendicular 3-module connector
     * LEGO Design ID: 32184
     * Creates perpendicular axle connections with 3 axle holes
     */
    part def CrossBlock3M :> TechnicConnectorBase {
        attribute redefines designId = "32184";
        attribute redefines partName = "Technic Cross Block 1 x 3";
        attribute redefines axleHoles = 3;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute length : Real = 3.0;
        attribute perpendicular : Boolean = true;
    }

    /**
     * Cross Block 90 Degrees (Light Bluish Gray) - Right angle connector
     * LEGO Design ID: 6536
     * Standard 90-degree angle cross block
     */
    part def CrossBlock90 :> TechnicConnectorBase {
        attribute redefines designId = "6536";
        attribute redefines partName = "Technic Cross Block 90 Degree";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Light Bluish Gray";
        attribute angle : Real = 90.0;
    }

    /**
     * Double Cross Block (Dark Bluish Gray) - Two parallel axle holes
     * LEGO Design ID: 32291
     * Provides parallel axle mounting with pin connections
     */
    part def DoubleCrossBlock :> TechnicConnectorBase {
        attribute redefines designId = "32291";
        attribute redefines partName = "Technic Cross Block 2 x 2";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 4;
        attribute redefines color = "Dark Bluish Gray";
        attribute isDoubleWide : Boolean = true;
    }

    /**
     * Cross Block 3L with 4 Pin Holes (Dark Bluish Gray) - Extended block
     * LEGO Design ID: 42003
     * Large connector with multiple pin attachment points
     */
    part def CrossBlock3L :> TechnicConnectorBase {
        attribute redefines designId = "42003";
        attribute redefines partName = "Technic Cross Block 1 x 3 with 4 Pins";
        attribute redefines axleHoles = 1;
        attribute redefines pinHoles = 4;
        attribute redefines color = "Dark Bluish Gray";
        attribute length : Real = 3.0;
    }

    /**
     * Axle Joiner Perpendicular (Black) - 90-degree axle connector
     * LEGO Design ID: 6538c
     * Creates perpendicular connection between two axles
     */
    part def AxleJoiner :> TechnicConnectorBase {
        attribute redefines designId = "6538c";
        attribute redefines partName = "Technic Axle Joiner Perpendicular";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 0;
        attribute redefines color = "Black";
        attribute angle : Real = 90.0;
        attribute allowsRotation : Boolean = false;
    }

    /**
     * Axle Joiner Double (Black) - Inline axle extender
     * LEGO Design ID: 32034
     * Extends axle length by joining two axles inline
     */
    part def AxleJoinerDouble :> TechnicConnectorBase {
        attribute redefines designId = "32034";
        attribute redefines partName = "Technic Axle Joiner";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 0;
        attribute redefines color = "Black";
        attribute isInline : Boolean = true;
        attribute totalLength : Real = 2.0;
    }

    /**
     * T-Beam Connector (Dark Bluish Gray) - T-shaped structural connector
     * LEGO Design ID: 60483
     * Provides T-shaped connection point for beams
     */
    part def TBeam :> TechnicConnectorBase {
        attribute redefines designId = "60483";
        attribute redefines partName = "Technic T-Beam with Holes";
        attribute redefines axleHoles = 1;
        attribute redefines pinHoles = 3;
        attribute redefines color = "Dark Bluish Gray";
        attribute shape : String = "T";
    }

    /**
     * Pin Joiner Round (Light Bluish Gray) - Pin-to-pin connector
     * LEGO Design ID: 62462
     * Connects two pins together with round profile
     */
    part def PinJoiner :> TechnicConnectorBase {
        attribute redefines designId = "62462";
        attribute redefines partName = "Technic Pin Joiner Round";
        attribute redefines axleHoles = 0;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Light Bluish Gray";
        attribute isRound : Boolean = true;
    }

    /**
     * Axle to Pin Adapter (Blue) - Converts axle to pin connection
     * LEGO Design ID: 11214
     * Allows axle drive to connect to pin-based structures
     */
    part def AxleToPin :> TechnicConnectorBase {
        attribute redefines designId = "11214";
        attribute redefines partName = "Technic Axle to Pin Connector Angled";
        attribute redefines axleHoles = 1;
        attribute redefines pinHoles = 1;
        attribute redefines color = "Blue";
        attribute angle : Real = 180.0;
    }

    /**
     * Cross Block 2M with 2 Axle Holes (Dark Bluish Gray) - Compact dual axle
     * LEGO Design ID: 32184
     * Two perpendicular axle holes in compact form
     */
    part def CrossBlock2M :> TechnicConnectorBase {
        attribute redefines designId = "41678";
        attribute redefines partName = "Technic Axle Joiner Perpendicular Double";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute length : Real = 2.0;
    }

    /**
     * Axle and Pin Connector Perpendicular (Blue) - Mixed connector
     * LEGO Design ID: 6536
     * Combines axle and pin connection at 90 degrees
     */
    part def AxlePinConnectorPerp :> TechnicConnectorBase {
        attribute redefines designId = "6536";
        attribute redefines partName = "Technic Axle and Pin Connector Perpendicular";
        attribute redefines axleHoles = 1;
        attribute redefines pinHoles = 1;
        attribute redefines color = "Blue";
        attribute angle : Real = 90.0;
    }

    /**
     * Cross Block 180 Degree (Red) - Straight-through connector
     * LEGO Design ID: 32034
     * Provides inline axle connection with pin mounting
     */
    part def CrossBlock180 :> TechnicConnectorBase {
        attribute redefines designId = "32034";
        attribute redefines partName = "Technic Axle Connector 2 x 3 with Ball Socket";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 0;
        attribute redefines color = "Red";
        attribute angle : Real = 180.0;
    }

    /**
     * Universal Joint Element (Black) - Cardan joint part
     * LEGO Design ID: 61903
     * Half of universal joint for angled power transmission
     */
    part def UniversalJointElement :> TechnicConnectorBase {
        attribute redefines designId = "61903";
        attribute redefines partName = "Technic Universal Joint Element";
        attribute redefines axleHoles = 1;
        attribute redefines pinHoles = 0;
        attribute redefines color = "Black";
        attribute jointType : String = "Cardan";
        attribute maxAngle : Real = 90.0;
    }

    /**
     * Universal Joint Complete (Black) - Full cardan joint
     * LEGO Design ID: 9244
     * Complete universal joint for power transmission at angles
     */
    part def UniversalJoint :> TechnicConnectorBase {
        attribute redefines designId = "9244";
        attribute redefines partName = "Technic Universal Joint";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 0;
        attribute redefines color = "Black";
        attribute jointType : String = "Universal";
        attribute maxOperatingAngle : Real = 90.0;
        attribute minOperatingAngle : Real = 0.0;
    }

    /**
     * Axle Connector with Axle Hole (Black) - Hub-style connector
     * LEGO Design ID: 32039
     * Connects axle to structure with central axle pass-through
     */
    part def AxleConnectorHub :> TechnicConnectorBase {
        attribute redefines designId = "32039";
        attribute redefines partName = "Technic Axle Connector with Axle Hole";
        attribute redefines axleHoles = 2;
        attribute redefines pinHoles = 4;
        attribute redefines color = "Black";
        attribute hasPassThrough : Boolean = true;
    }

    /**
     * Angle Connector #1 (Dark Bluish Gray) - 90-degree beam connector
     * LEGO Design ID: 32013
     * Standard angle connector for beam frames
     */
    part def AngleConnector1 :> TechnicConnectorBase {
        attribute redefines designId = "32013";
        attribute redefines partName = "Technic Angle Connector #1";
        attribute redefines axleHoles = 0;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute angle : Real = 90.0;
    }

    /**
     * Angle Connector #2 (Dark Bluish Gray) - 180-degree beam connector
     * LEGO Design ID: 32034
     * Straight connector for beam alignment
     */
    part def AngleConnector2 :> TechnicConnectorBase {
        attribute redefines designId = "32034";
        attribute redefines partName = "Technic Angle Connector #2";
        attribute redefines axleHoles = 0;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute angle : Real = 180.0;
    }

    /**
     * Angle Connector #3 (Dark Bluish Gray) - 157.5-degree beam connector
     * LEGO Design ID: 32016
     * Angled connector for non-perpendicular frames
     */
    part def AngleConnector3 :> TechnicConnectorBase {
        attribute redefines designId = "32016";
        attribute redefines partName = "Technic Angle Connector #3";
        attribute redefines axleHoles = 0;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute angle : Real = 157.5;
    }

    /**
     * Angle Connector #4 (Dark Bluish Gray) - 135-degree beam connector
     * LEGO Design ID: 32192
     * Obtuse angle connector for frame designs
     */
    part def AngleConnector4 :> TechnicConnectorBase {
        attribute redefines designId = "32192";
        attribute redefines partName = "Technic Angle Connector #4";
        attribute redefines axleHoles = 0;
        attribute redefines pinHoles = 2;
        attribute redefines color = "Dark Bluish Gray";
        attribute angle : Real = 135.0;
    }

}
