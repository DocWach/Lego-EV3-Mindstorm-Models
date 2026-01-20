package EV3Bushings {
    import EV3Types::*;

    /**
     * Base definition for all Technic bushings and spacers
     */
    part def TechnicBushingBase {
        attribute designId : String;
        attribute partName : String;
        attribute size : Real;
        attribute material : String default "ABS Plastic";
        attribute color : String;
        attribute innerDiameter : Real default 4.8;
        attribute outerDiameter : Real;
    }

    /**
     * Half Bushing (Yellow) - 0.5-module axle spacer
     * LEGO Design ID: 4265c
     * Compact spacer for precise axle positioning
     */
    part def HalfBushing :> TechnicBushingBase {
        attribute redefines designId = "4265c";
        attribute redefines partName = "Technic Bush 1/2 Smooth";
        attribute redefines size = 0.5;
        attribute redefines color = "Yellow";
        attribute redefines outerDiameter = 6.2;
        attribute hasFlange : Boolean = false;
    }

    /**
     * Full Bushing (Light Bluish Gray) - 1-module axle spacer
     * LEGO Design ID: 3713
     * Standard bushing for axle spacing and retention
     */
    part def FullBushing :> TechnicBushingBase {
        attribute redefines designId = "3713";
        attribute redefines partName = "Technic Bush";
        attribute redefines size = 1.0;
        attribute redefines color = "Light Bluish Gray";
        attribute redefines outerDiameter = 6.8;
        attribute hasFlange : Boolean = false;
    }

    /**
     * Bush with 2 Studs (Light Bluish Gray) - Bushing with stud attachments
     * LEGO Design ID: 6590
     * Allows stud-based connections to axle assemblies
     */
    part def BushWith2Studs :> TechnicBushingBase {
        attribute redefines designId = "6590";
        attribute redefines partName = "Technic Bush with Two Studs";
        attribute redefines size = 1.0;
        attribute redefines color = "Light Bluish Gray";
        attribute redefines outerDiameter = 8.0;
        attribute studCount : Integer = 2;
        attribute studSpacing : Real = 8.0;
    }

    /**
     * Spacer 2M (Light Bluish Gray) - 2-module axle spacer tube
     * LEGO Design ID: 59443
     * Extended spacer for longer axle positioning needs
     */
    part def Spacer2M :> TechnicBushingBase {
        attribute redefines designId = "59443";
        attribute redefines partName = "Technic Axle Spacer 2L";
        attribute redefines size = 2.0;
        attribute redefines color = "Light Bluish Gray";
        attribute redefines outerDiameter = 6.2;
        attribute isReinforced : Boolean = false;
    }

    /**
     * Half Bushing with Flange (Blue) - Flanged 0.5M spacer
     * LEGO Design ID: 32123b
     * Half bushing with wider flange for retention
     */
    part def HalfBushingFlanged :> TechnicBushingBase {
        attribute redefines designId = "32123b";
        attribute redefines partName = "Technic Bush 1/2 Smooth with Axle Hole Semi-Reduced";
        attribute redefines size = 0.5;
        attribute redefines color = "Blue";
        attribute redefines outerDiameter = 7.8;
        attribute hasFlange : Boolean = true;
        attribute flangeWidth : Real = 2.0;
    }

    /**
     * Spacer Ring (Light Bluish Gray) - Thin axle spacer
     * LEGO Design ID: 4211622
     * Ultra-thin spacer for fine position adjustment
     */
    part def SpacerRing :> TechnicBushingBase {
        attribute redefines designId = "4211622";
        attribute redefines partName = "Technic Spacer Ring";
        attribute redefines size = 0.25;
        attribute redefines color = "Light Bluish Gray";
        attribute redefines outerDiameter = 6.0;
        attribute thickness : Real = 2.0;
    }

    /**
     * Spacer 3M (White) - 3-module axle spacer tube
     * LEGO Design ID: 6587
     * Long spacer for extended axle assemblies
     */
    part def Spacer3M :> TechnicBushingBase {
        attribute redefines designId = "6587";
        attribute redefines partName = "Technic Axle Spacer 3L";
        attribute redefines size = 3.0;
        attribute redefines color = "White";
        attribute redefines outerDiameter = 6.2;
    }

    /**
     * Ball Joint Socket Bushing (Black) - Ball joint receptacle
     * LEGO Design ID: 32474
     * Bushing with integrated ball socket for articulation
     */
    part def BallSocketBushing :> TechnicBushingBase {
        attribute redefines designId = "32474";
        attribute redefines partName = "Technic Ball Joint Socket";
        attribute redefines size = 1.0;
        attribute redefines color = "Black";
        attribute redefines outerDiameter = 10.4;
        attribute socketDiameter : Real = 10.2;
        attribute maxArticulationAngle : Real = 22.0;
    }

    /**
     * Steering Bushing (Light Bluish Gray) - Rack and pinion bushing
     * LEGO Design ID: 87408
     * Bushing designed for steering rack assemblies
     */
    part def SteeringBushing :> TechnicBushingBase {
        attribute redefines designId = "87408";
        attribute redefines partName = "Technic Steering Axle Hub";
        attribute redefines size = 1.0;
        attribute redefines color = "Light Bluish Gray";
        attribute redefines outerDiameter = 11.2;
        attribute hasPinHole : Boolean = true;
        attribute steeringRange : Real = 30.0;
    }

    /**
     * Wheel Bearing Bushing (Dark Bluish Gray) - Heavy-duty wheel mount
     * LEGO Design ID: 6014b
     * Reinforced bushing for wheel axle support
     */
    part def WheelBearingBushing :> TechnicBushingBase {
        attribute redefines designId = "6014b";
        attribute redefines partName = "Wheel 11 x 12 mm";
        attribute redefines size = 1.5;
        attribute redefines color = "Dark Bluish Gray";
        attribute redefines outerDiameter = 12.0;
        attribute loadCapacity : String = "Heavy";
        attribute forWheelMount : Boolean = true;
    }

    /**
     * Stop Bush (Red) - Axle position stop
     * LEGO Design ID: 4265c
     * Colored bushing used as visual stop indicator
     */
    part def StopBush :> TechnicBushingBase {
        attribute redefines designId = "4265c";
        attribute redefines partName = "Technic Bush 1/2 Smooth - Stop";
        attribute redefines size = 0.5;
        attribute redefines color = "Red";
        attribute redefines outerDiameter = 6.2;
        attribute isStopIndicator : Boolean = true;
    }

    /**
     * Reduction Bush (Yellow) - Axle diameter reducer
     * LEGO Design ID: 6590
     * Adapts axle connection to smaller diameter
     */
    part def ReductionBush :> TechnicBushingBase {
        attribute redefines designId = "6590";
        attribute redefines partName = "Technic Reduction Bush";
        attribute redefines size = 1.0;
        attribute redefines color = "Yellow";
        attribute redefines outerDiameter = 6.8;
        attribute redefines innerDiameter = 4.8;
        attribute reducedDiameter : Real = 3.2;
    }

    /**
     * Turntable Bushing (Black) - Rotational bearing bushing
     * LEGO Design ID: 4267
     * Allows 360-degree rotation for turntable assemblies
     */
    part def TurntableBushing :> TechnicBushingBase {
        attribute redefines designId = "4267";
        attribute redefines partName = "Technic Turntable Base";
        attribute redefines size = 2.0;
        attribute redefines color = "Black";
        attribute redefines outerDiameter = 28.0;
        attribute rotationRange : Real = 360.0;
        attribute hasDetents : Boolean = false;
    }

}
