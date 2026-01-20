package EV3Balls {
    doc /*
     * EV3 Ball Elements Package
     * Contains ball-related parts from the LEGO Mindstorms EV3 31313 Home Edition.
     * These parts are used for ball-shooting mechanisms, ball joints, and related assemblies.
     */

    import EV3Types::*;

    /**
     * Material types for ball elements
     */
    enum def BallMaterial {
        enum ABS;
        enum Rubber;
        enum TPE;
    }

    /**
     * Abstract base definition for all ball-related elements
     */
    abstract part def BallElementBase {
        doc /* Base characteristics shared by all ball elements */

        attribute designId : String;
        attribute partName : String;
        attribute material : BallMaterial;
        attribute colorName : String;
        attribute massGrams : Real;
    }

    /**
     * Ball16_5 - Solid 16.5mm Diameter Ball
     * LEGO Design ID: 41250
     * A solid spherical ball used in ball-shooting mechanisms.
     * Standard ball for EV3 ball shooter assemblies.
     */
    part def Ball16_5 :> BallElementBase {
        doc /*
         * Solid red ball, 16.5mm diameter.
         * Primarily used as projectile in ball shooter mechanisms.
         * Smooth surface for consistent rolling and shooting behavior.
         */

        attribute :>> designId = "41250";
        attribute :>> partName = "Ball 16.5mm";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Red";
        attribute :>> massGrams = 1.2;

        // Dimensional attributes
        attribute diameter : Real = 16.5;           // mm
        attribute sphericity : Real = 0.99;         // roundness factor (1.0 = perfect)
        attribute surfaceFinish : String = "Smooth";

        // Functional attributes
        attribute bounceCoefficient : Real = 0.65;  // restitution coefficient
        attribute rollingFriction : Real = 0.015;   // coefficient of rolling friction
        attribute isHollow : Boolean = false;
    }

    /**
     * BallWithSnap - Ball with Technic Connector
     * LEGO Design ID: 15461
     * A ball element with an integrated snap connector for attachment.
     * Used in articulated joints and moving assemblies.
     */
    part def BallWithSnap :> BallElementBase {
        doc /*
         * Ball with integrated Technic snap connector.
         * Allows secure attachment to beams while providing rotational freedom.
         * Ball diameter: 16.5mm with cross-axle compatible connector.
         */

        attribute :>> designId = "15461";
        attribute :>> partName = "Ball with Snap Connector";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 1.8;

        // Dimensional attributes
        attribute ballDiameter : Real = 16.5;       // mm
        attribute connectorLength : Real = 8.0;     // mm (1 module)
        attribute totalLength : Real = 24.5;        // mm overall

        // Connector attributes
        attribute connectorType : String = "Technic Pin";
        attribute snapForce : Real = 8.0;           // N, force to engage/disengage
        attribute isAxleCompatible : Boolean = true;

        // Functional attributes
        attribute rotationFreedom : Integer = 360;  // degrees, full rotation
        attribute maxDeflection : Real = 30.0;      // degrees from center axis
    }

    /**
     * BallMagazine - Ball Storage Magazine
     * LEGO Design ID: 99948
     * A container that holds and feeds balls into shooter mechanisms.
     * Holds up to 3 standard 16.5mm balls.
     */
    part def BallMagazine :> BallElementBase {
        doc /*
         * Ball storage and feeding mechanism.
         * Gravity-fed design holds 3 balls in queue for shooting.
         * Compatible with standard EV3 ball shooter assembly.
         */

        attribute :>> designId = "99948";
        attribute :>> partName = "Ball Magazine";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Dark Bluish Gray";
        attribute :>> massGrams = 12.5;

        // Dimensional attributes
        attribute length : Real = 64.0;             // mm (8 studs)
        attribute width : Real = 32.0;              // mm (4 studs)
        attribute height : Real = 24.0;             // mm (3 plates)

        // Capacity attributes
        attribute ballCapacity : Integer = 3;
        attribute ballDiameterCompatible : Real = 16.5;  // mm
        attribute currentBallCount : Integer;

        // Functional attributes
        attribute feedType : String = "Gravity";
        attribute feedAngle : Real = 15.0;          // degrees, optimal feed angle
        attribute jamClearanceGap : Real = 1.0;     // mm, anti-jam tolerance

        // Mounting attributes
        attribute hasTechnicHoles : Boolean = true;
        attribute mountingHoleCount : Integer = 4;
    }

    /**
     * BallShooter - Ball Launching Mechanism
     * LEGO Design ID: 15301
     * A spring-loaded mechanism for launching balls.
     * Core component of ball-shooting robot designs.
     */
    part def BallShooter :> BallElementBase {
        doc /*
         * Spring-loaded ball launcher mechanism.
         * Uses compressed spring to propel 16.5mm balls.
         * Designed for motorized triggering via EV3 motors.
         */

        attribute :>> designId = "15301";
        attribute :>> partName = "Ball Shooter";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 18.0;

        // Dimensional attributes
        attribute length : Real = 72.0;             // mm
        attribute width : Real = 32.0;              // mm
        attribute height : Real = 32.0;             // mm

        // Shooting performance attributes
        attribute springConstant : Real = 150.0;   // N/m
        attribute maxCompression : Real = 15.0;     // mm
        attribute launchVelocity : Real = 3.5;      // m/s at max compression
        attribute launchAngle : Real = 0.0;         // degrees, adjustable

        // Operational attributes
        attribute triggerForce : Real = 5.0;        // N, force to release
        attribute reloadTime : Real = 0.5;          // seconds, manual
        attribute isLoaded : Boolean;
        attribute isCocked : Boolean;

        // Compatibility attributes
        attribute compatibleBallDiameter : Real = 16.5;  // mm
        attribute motorTriggerCompatible : Boolean = true;
    }

    /**
     * BallSocket - Ball Receiving Socket
     * LEGO Design ID: 15460
     * A socket element that receives and holds ball connectors.
     * Provides articulated joint movement when paired with ball elements.
     */
    part def BallSocket :> BallElementBase {
        doc /*
         * Ball socket for articulated joints.
         * Accepts 16.5mm ball connectors with snap fit.
         * Allows multi-axis rotation while maintaining secure connection.
         */

        attribute :>> designId = "15460";
        attribute :>> partName = "Ball Socket";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 1.5;

        // Dimensional attributes
        attribute socketDiameter : Real = 17.0;     // mm, inner diameter
        attribute outerDiameter : Real = 24.0;      // mm
        attribute depth : Real = 12.0;              // mm

        // Articulation attributes
        attribute maxRotation : Integer = 360;      // degrees
        attribute maxTilt : Real = 35.0;            // degrees from axis
        attribute snapRetention : Real = 12.0;      // N, pull-out force

        // Mounting attributes
        attribute mountType : String = "Technic Beam";
        attribute beamThickness : Real = 8.0;       // mm (1 module)
    }

    /**
     * BallJoint - 10mm Ball Joint End
     * LEGO Design ID: 50923
     * A smaller ball joint element for precision linkages.
     * Used in steering mechanisms and articulated appendages.
     */
    part def BallJoint :> BallElementBase {
        doc /*
         * Small ball joint end for compact linkages.
         * 10mm ball provides smooth articulation in tight spaces.
         * Common in steering and control linkage assemblies.
         */

        attribute :>> designId = "50923";
        attribute :>> partName = "Ball Joint 10mm";
        attribute :>> material = BallMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 0.8;

        // Dimensional attributes
        attribute ballDiameter : Real = 10.0;       // mm
        attribute stemLength : Real = 8.0;          // mm
        attribute stemDiameter : Real = 4.0;        // mm (Technic pin size)

        // Articulation attributes
        attribute rotationFreedom : Integer = 360;  // degrees
        attribute articulationAngle : Real = 45.0;  // degrees max deflection
        attribute frictionTorque : Real = 0.02;     // Nm

        // Connection attributes
        attribute stemType : String = "Technic Pin";
        attribute isPinHoleCompatible : Boolean = true;
        attribute isAxleCompatible : Boolean = false;
    }

    /**
     * Ball Shooter Assembly - Complete shooting mechanism
     * Combines magazine, shooter, and mounting for a complete system
     */
    part def BallShooterAssembly {
        doc /*
         * Complete ball shooting assembly.
         * Combines magazine, shooter, and balls into operational unit.
         */

        part magazine : BallMagazine;
        part shooter : BallShooter;
        part balls : Ball16_5 [0..3];

        // Assembly attributes
        attribute isAssembled : Boolean;
        attribute shotsRemaining : Integer;
        attribute isReadyToFire : Boolean;
    }
}
