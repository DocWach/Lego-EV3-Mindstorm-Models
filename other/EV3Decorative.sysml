package EV3Decorative {
    doc /*
     * EV3 Decorative Parts Package
     * Contains eyes, cones, panels, wings, and other decorative elements
     * from the LEGO Mindstorms EV3 sets. These parts add character and
     * visual appeal to robot designs.
     */

    import EV3Types::*;

    /**
     * Decorative part color options
     */
    enum def DecorativeColor {
        enum White;
        enum Black;
        enum Red;
        enum Blue;
        enum Yellow;
        enum Green;
        enum Orange;
        enum LightBluishGray;
        enum DarkBluishGray;
        enum Tan;
        enum TransClear;
        enum TransRed;
        enum TransBlue;
    }

    /**
     * Surface finish types for decorative elements
     */
    enum def SurfaceFinish {
        enum Matte;
        enum Glossy;
        enum Textured;
        enum Transparent;
    }

    /**
     * Abstract base definition for decorative parts
     */
    abstract part def DecorativePartBase {
        doc /* Base characteristics shared by all decorative parts */

        attribute designId : String;
        attribute partName : String;
        attribute material : String = "ABS";
        attribute colorName : DecorativeColor;
        attribute massGrams : Real;
        attribute surfaceFinish : SurfaceFinish;
    }

    /**
     * Eye - Round Eye Element
     * LEGO Design ID: 2654
     * A round eye element for creating expressive robot faces.
     * Features printed pupil detail.
     */
    part def Eye :> DecorativePartBase {
        doc /*
         * Round decorative eye element.
         * Printed pupil on white background for expressive robot faces.
         * Dish-shaped for dimensional appearance.
         */

        attribute :>> designId = "2654";
        attribute :>> partName = "Round Eye 2x2";
        attribute :>> colorName = DecorativeColor::White;
        attribute :>> massGrams = 0.6;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute diameter : Real = 16.0;           // mm (2 studs)
        attribute depth : Real = 4.0;               // mm, dish depth
        attribute studCompatible : Boolean = true;

        // Visual attributes
        attribute hasPupil : Boolean = true;
        attribute pupilColor : DecorativeColor = DecorativeColor::Black;
        attribute pupilDiameter : Real = 6.0;       // mm
        attribute pupilPosition : String = "Center";

        // Mounting attributes
        attribute mountType : String = "Anti-Stud";
        attribute canRotate : Boolean = true;       // pupil direction adjustable
    }

    /**
     * EyeSocket - Eye Holder Frame
     * LEGO Design ID: 32474
     * A frame that holds and positions eye elements.
     * Provides mounting structure for robot faces.
     */
    part def EyeSocket :> DecorativePartBase {
        doc /*
         * Eye holder/socket frame.
         * Provides structural mounting for eye elements.
         * Creates recessed eye appearance.
         */

        attribute :>> designId = "32474";
        attribute :>> partName = "Eye Socket Frame";
        attribute :>> colorName = DecorativeColor::Black;
        attribute :>> massGrams = 1.2;
        attribute :>> surfaceFinish = SurfaceFinish::Matte;

        // Dimensional attributes
        attribute width : Real = 24.0;              // mm (3 studs)
        attribute height : Real = 16.0;             // mm (2 studs)
        attribute depth : Real = 8.0;               // mm (1 plate height)

        // Socket attributes
        attribute socketDiameter : Real = 17.0;     // mm, eye opening
        attribute recessDepth : Real = 4.0;         // mm
        attribute eyeRetention : Real = 2.0;        // N, holding force

        // Mounting attributes
        attribute hasTechnicHoles : Boolean = true;
        attribute technicHoleCount : Integer = 2;
        attribute studMountPoints : Integer = 4;
    }

    /**
     * Cone1x1 - 1x1 Cone Element
     * LEGO Design ID: 4589b
     * A small cone element for decorative accents.
     * Available in multiple colors.
     */
    part def Cone1x1 :> DecorativePartBase {
        doc /*
         * 1x1 Cone decorative element.
         * Tapered shape for spikes, horns, or accent details.
         * Stud-compatible base.
         */

        attribute :>> designId = "4589b";
        attribute :>> partName = "Cone 1x1";
        attribute :>> colorName = DecorativeColor::Black;  // varies
        attribute :>> massGrams = 0.25;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute baseWidth : Real = 8.0;           // mm (1 stud)
        attribute height : Real = 9.6;              // mm
        attribute topDiameter : Real = 3.2;         // mm, pointed top

        // Geometry attributes
        attribute taperAngle : Real = 15.0;         // degrees
        attribute isHollow : Boolean = true;
        attribute wallThickness : Real = 1.0;       // mm

        // Mounting attributes
        attribute hasStudOnTop : Boolean = true;
        attribute hasAntiStudBase : Boolean = true;
        attribute canStack : Boolean = true;
    }

    /**
     * Tile1x2 - 1x2 Flat Tile
     * LEGO Design ID: 3069b
     * A flat tile element for smooth surfaces.
     * No studs on top for clean appearance.
     */
    part def Tile1x2 :> DecorativePartBase {
        doc /*
         * 1x2 Flat tile element.
         * Smooth top surface without studs.
         * Used for panels, labels, and smooth surfaces.
         */

        attribute :>> designId = "3069b";
        attribute :>> partName = "Tile 1x2";
        attribute :>> colorName = DecorativeColor::LightBluishGray;  // varies
        attribute :>> massGrams = 0.4;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute length : Real = 16.0;             // mm (2 studs)
        attribute width : Real = 8.0;               // mm (1 stud)
        attribute height : Real = 3.2;              // mm (1 plate)

        // Surface attributes
        attribute hasStudsOnTop : Boolean = false;
        attribute topSurface : String = "Smooth";
        attribute canBePrinted : Boolean = true;
        attribute printArea : Real = 100.0;         // mm^2

        // Mounting attributes
        attribute hasAntiStudGroove : Boolean = true;
        attribute snapFit : Boolean = true;
    }

    /**
     * Plate2x4 - 2x4 Plate
     * LEGO Design ID: 3020
     * A standard 2x4 plate for structural and decorative use.
     * Foundational element for many assemblies.
     */
    part def Plate2x4 :> DecorativePartBase {
        doc /*
         * 2x4 Standard plate element.
         * Versatile building element for structure and decoration.
         * 8 studs on top surface.
         */

        attribute :>> designId = "3020";
        attribute :>> partName = "Plate 2x4";
        attribute :>> colorName = DecorativeColor::Red;  // varies
        attribute :>> massGrams = 1.1;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute length : Real = 32.0;             // mm (4 studs)
        attribute width : Real = 16.0;              // mm (2 studs)
        attribute height : Real = 3.2;              // mm (1 plate)

        // Stud configuration
        attribute studCountLength : Integer = 4;
        attribute studCountWidth : Integer = 2;
        attribute totalStuds : Integer = 8;
        attribute studDiameter : Real = 4.8;        // mm
        attribute studHeight : Real = 1.8;          // mm

        // Structural attributes
        attribute antiStudPattern : String = "Standard";
        attribute clutchPower : Real = 3.0;         // N per stud
        attribute stackable : Boolean = true;
    }

    /**
     * WingLeft - Left Wing Panel
     * LEGO Design ID: 44351
     * A wedge-shaped wing panel for aerodynamic robot designs.
     * Left-hand version with angled profile.
     */
    part def WingLeft :> DecorativePartBase {
        doc /*
         * Left wing/wedge panel element.
         * Aerodynamic shape for vehicle and aircraft designs.
         * Pairs with WingRight for symmetrical builds.
         */

        attribute :>> designId = "44351";
        attribute :>> partName = "Wing Left 3x6";
        attribute :>> colorName = DecorativeColor::Black;
        attribute :>> massGrams = 2.8;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute length : Real = 48.0;             // mm (6 studs)
        attribute width : Real = 24.0;              // mm (3 studs)
        attribute thicknessBase : Real = 6.4;       // mm (2 plates)
        attribute thicknessTip : Real = 3.2;        // mm (1 plate), tapered

        // Wing geometry
        attribute sweepAngle : Real = 25.0;         // degrees
        attribute taperRatio : Real = 0.5;          // tip/root chord
        attribute leadingEdgeAngle : Real = 30.0;   // degrees
        attribute handedness : String = "Left";

        // Mounting attributes
        attribute studPattern : String = "Partial";
        attribute studCount : Integer = 12;
        attribute hasTechnicHoles : Boolean = false;

        // Pairing attributes
        attribute mirrorPartId : String = "44352"; // WingRight
        attribute isSymmetricPair : Boolean = true;
    }

    /**
     * WingRight - Right Wing Panel
     * LEGO Design ID: 44352
     * A wedge-shaped wing panel for aerodynamic robot designs.
     * Right-hand version, mirror of WingLeft.
     */
    part def WingRight :> DecorativePartBase {
        doc /*
         * Right wing/wedge panel element.
         * Aerodynamic shape for vehicle and aircraft designs.
         * Pairs with WingLeft for symmetrical builds.
         */

        attribute :>> designId = "44352";
        attribute :>> partName = "Wing Right 3x6";
        attribute :>> colorName = DecorativeColor::Black;
        attribute :>> massGrams = 2.8;
        attribute :>> surfaceFinish = SurfaceFinish::Glossy;

        // Dimensional attributes
        attribute length : Real = 48.0;             // mm (6 studs)
        attribute width : Real = 24.0;              // mm (3 studs)
        attribute thicknessBase : Real = 6.4;       // mm (2 plates)
        attribute thicknessTip : Real = 3.2;        // mm (1 plate), tapered

        // Wing geometry
        attribute sweepAngle : Real = 25.0;         // degrees
        attribute taperRatio : Real = 0.5;          // tip/root chord
        attribute leadingEdgeAngle : Real = 30.0;   // degrees
        attribute handedness : String = "Right";

        // Mounting attributes
        attribute studPattern : String = "Partial";
        attribute studCount : Integer = 12;
        attribute hasTechnicHoles : Boolean = false;

        // Pairing attributes
        attribute mirrorPartId : String = "44351"; // WingLeft
        attribute isSymmetricPair : Boolean = true;
    }

    /**
     * TrianglePanel - Triangular Flag/Panel
     * LEGO Design ID: 2450
     * A triangular flag or panel element.
     * Used for decorative flags, fins, and accents.
     */
    part def TrianglePanel :> DecorativePartBase {
        doc /*
         * Triangular flag/panel element.
         * Pennant shape for flags, fins, and decorative accents.
         * Clip attachment at base.
         */

        attribute :>> designId = "2450";
        attribute :>> partName = "Flag Triangle";
        attribute :>> colorName = DecorativeColor::Red;
        attribute :>> massGrams = 0.5;
        attribute :>> surfaceFinish = SurfaceFinish::Matte;

        // Dimensional attributes
        attribute height : Real = 32.0;             // mm (4 studs)
        attribute baseWidth : Real = 16.0;          // mm (2 studs)
        attribute thickness : Real = 2.0;           // mm

        // Triangle geometry
        attribute triangleType : String = "Isoceles";
        attribute apexAngle : Real = 30.0;          // degrees
        attribute baseAngle : Real = 75.0;          // degrees

        // Attachment attributes
        attribute attachmentType : String = "Bar Clip";
        attribute clipDiameter : Real = 3.2;        // mm, bar size
        attribute clipRetention : Real = 1.5;       // N

        // Decorative attributes
        attribute canBePrinted : Boolean = true;
        attribute isTwoSided : Boolean = true;
        attribute flexibility : String = "Semi-Rigid";
    }

    /**
     * Wing Panel Assembly - Symmetric wing pair
     */
    part def WingPairAssembly {
        doc /*
         * Matched pair of left and right wing panels.
         * Creates symmetric aerodynamic surfaces.
         */

        part leftWing : WingLeft;
        part rightWing : WingRight;

        attribute totalSpan : Real = 96.0;          // mm, combined width
        attribute isSymmetric : Boolean = true;
    }

    /**
     * Robot Face Assembly - Eyes and socket combination
     */
    part def RobotFaceAssembly {
        doc /*
         * Robot face assembly with eyes and sockets.
         * Creates expressive robot character faces.
         */

        part leftEyeSocket : EyeSocket;
        part rightEyeSocket : EyeSocket;
        part leftEye : Eye;
        part rightEye : Eye;

        attribute eyeSpacing : Real = 32.0;         // mm between eye centers
        attribute expressionType : String = "Neutral";
        attribute canAnimateEyes : Boolean = true;  // if motorized
    }
}
