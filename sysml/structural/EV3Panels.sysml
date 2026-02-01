package EV3Panels {
    import EV3BeamsStraight::TechnicMaterial;
    import EV3BeamsStraight::BeamColor;

    /**
     * Panel orientation/handedness.
     */
    enum def PanelSide {
        enum Left;
        enum Right;
        enum Symmetric;  // No handedness
    }

    /**
     * Panel curvature type.
     */
    enum def CurvatureType {
        enum Convex;   // Curves outward
        enum Concave;  // Curves inward
        enum Flat;     // No curvature
    }

    /**
     * Abstract base definition for Technic curved panels.
     * Panels are decorative/aerodynamic elements with mounting holes.
     */
    abstract part def TechnicPanelBase {
        // Part identification
        attribute designId : String;
        attribute partName : String;

        // Panel dimensions (in modules, 1M = 8mm)
        attribute widthModules : Integer;   // Width in modules
        attribute lengthModules : Integer;  // Length in modules
        attribute thicknessMM : Real;       // Nominal thickness

        // Hole configuration
        attribute holeCount : Integer;
        attribute holeSpacing : Real = 8.0;  // mm between hole centers

        // Panel geometry
        attribute curvature : CurvatureType;
        attribute curveRadius : Real;  // mm, approximate curve radius
        attribute side : PanelSide;

        // Physical properties
        attribute material : TechnicMaterial = TechnicMaterial::ABS;
        attribute color : BeamColor;
        attribute weightGrams : Real;
    }

    // =========================================================================
    // SMALL CURVED PANELS (3-MODULE WIDTH)
    // =========================================================================

    /**
     * Technic Panel Curved 3x6 - Small curved panel, Left.
     * LEGO Design ID: 64683
     * 3-module width, 6-module length curved panel.
     */
    part def Panel3x6CurvedLeft :> TechnicPanelBase {
        attribute :>> designId = "64683";
        attribute :>> partName = "Technic Panel Curved 3x6 Left";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 6;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 6;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 48.0;
        attribute :>> side = PanelSide::Left;
        attribute :>> weightGrams = 4.8;
    }

    /**
     * Technic Panel Curved 3x6 - Small curved panel, Right.
     * LEGO Design ID: 64391
     * 3-module width, 6-module length curved panel (mirrored).
     */
    part def Panel3x6CurvedRight :> TechnicPanelBase {
        attribute :>> designId = "64391";
        attribute :>> partName = "Technic Panel Curved 3x6 Right";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 6;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 6;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 48.0;
        attribute :>> side = PanelSide::Right;
        attribute :>> weightGrams = 4.8;
    }

    /**
     * Technic Panel Curved 3x7 - Medium curved panel, Left.
     * LEGO Design ID: 24119
     * 3-module width, 7-module length curved panel.
     */
    part def Panel3x7CurvedLeft :> TechnicPanelBase {
        attribute :>> designId = "24119";
        attribute :>> partName = "Technic Panel Curved 3x7 Left";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 7;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 7;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 56.0;
        attribute :>> side = PanelSide::Left;
        attribute :>> weightGrams = 5.6;
    }

    /**
     * Technic Panel Curved 3x7 - Medium curved panel, Right.
     * LEGO Design ID: 24120
     * 3-module width, 7-module length curved panel (mirrored).
     */
    part def Panel3x7CurvedRight :> TechnicPanelBase {
        attribute :>> designId = "24120";
        attribute :>> partName = "Technic Panel Curved 3x7 Right";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 7;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 7;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 56.0;
        attribute :>> side = PanelSide::Right;
        attribute :>> weightGrams = 5.6;
    }

    // =========================================================================
    // LARGE CURVED PANELS (3-MODULE WIDTH, LONG)
    // =========================================================================

    /**
     * Technic Panel Curved 3x11 - Large curved panel, Left.
     * LEGO Design ID: 64393
     * 3-module width, 11-module length curved panel.
     */
    part def Panel3x11CurvedLeft :> TechnicPanelBase {
        attribute :>> designId = "64393";
        attribute :>> partName = "Technic Panel Curved 3x11 Left";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 11;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 10;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 88.0;
        attribute :>> side = PanelSide::Left;
        attribute :>> weightGrams = 8.9;
    }

    /**
     * Technic Panel Curved 3x11 - Large curved panel, Right.
     * LEGO Design ID: 64681
     * 3-module width, 11-module length curved panel (mirrored).
     */
    part def Panel3x11CurvedRight :> TechnicPanelBase {
        attribute :>> designId = "64681";
        attribute :>> partName = "Technic Panel Curved 3x11 Right";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 11;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 10;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 88.0;
        attribute :>> side = PanelSide::Right;
        attribute :>> weightGrams = 8.9;
    }

    // =========================================================================
    // WIDE CURVED PANELS (5-MODULE WIDTH)
    // =========================================================================

    /**
     * Technic Panel Curved 5x7 - Wide curved panel, Left.
     * LEGO Design ID: 64394
     * 5-module width, 7-module length curved panel.
     */
    part def Panel5x7CurvedLeft :> TechnicPanelBase {
        attribute :>> designId = "64394";
        attribute :>> partName = "Technic Panel Curved 5x7 Left";
        attribute :>> widthModules = 5;
        attribute :>> lengthModules = 7;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 10;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 56.0;
        attribute :>> side = PanelSide::Left;
        attribute :>> weightGrams = 9.2;
    }

    /**
     * Technic Panel Curved 5x7 - Wide curved panel, Right.
     * LEGO Design ID: 64680
     * 5-module width, 7-module length curved panel (mirrored).
     */
    part def Panel5x7CurvedRight :> TechnicPanelBase {
        attribute :>> designId = "64680";
        attribute :>> partName = "Technic Panel Curved 5x7 Right";
        attribute :>> widthModules = 5;
        attribute :>> lengthModules = 7;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 10;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 56.0;
        attribute :>> side = PanelSide::Right;
        attribute :>> weightGrams = 9.2;
    }

    // =========================================================================
    // SPECIAL CURVED PANELS
    // =========================================================================

    /**
     * Technic Panel Curved 11x3 - Extra long curved panel.
     * LEGO Design ID: 87080
     * 11-module length, 3-module width special curved panel.
     * Symmetric design (no left/right).
     */
    part def Panel11x3Curved :> TechnicPanelBase {
        attribute :>> designId = "87080";
        attribute :>> partName = "Technic Panel Curved 11x3";
        attribute :>> widthModules = 3;
        attribute :>> lengthModules = 11;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 11;
        attribute :>> curvature = CurvatureType::Convex;
        attribute :>> curveRadius = 88.0;
        attribute :>> side = PanelSide::Symmetric;
        attribute :>> weightGrams = 9.5;
    }

    // =========================================================================
    // FLAT PANELS
    // =========================================================================

    /**
     * Technic Panel Plate 2x5 - Small flat panel, Left.
     * LEGO Design ID: 44351
     * 2-module width, 5-module length flat panel.
     */
    part def Panel2x5Left :> TechnicPanelBase {
        attribute :>> designId = "44351";
        attribute :>> partName = "Technic Panel Plate 2x5 Left";
        attribute :>> widthModules = 2;
        attribute :>> lengthModules = 5;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 5;
        attribute :>> curvature = CurvatureType::Flat;
        attribute :>> curveRadius = 0.0;  // No curvature
        attribute :>> side = PanelSide::Left;
        attribute :>> weightGrams = 3.1;

        // Panel has angled edge
        attribute hasAngledEdge : Boolean = true;
        attribute edgeAngleDegrees : Real = 45.0;
    }

    /**
     * Technic Panel Plate 2x5 - Small flat panel, Right.
     * LEGO Design ID: 44352
     * 2-module width, 5-module length flat panel (mirrored).
     */
    part def Panel2x5Right :> TechnicPanelBase {
        attribute :>> designId = "44352";
        attribute :>> partName = "Technic Panel Plate 2x5 Right";
        attribute :>> widthModules = 2;
        attribute :>> lengthModules = 5;
        attribute :>> thicknessMM = 3.2;
        attribute :>> holeCount = 5;
        attribute :>> curvature = CurvatureType::Flat;
        attribute :>> curveRadius = 0.0;  // No curvature
        attribute :>> side = PanelSide::Right;
        attribute :>> weightGrams = 3.1;

        // Panel has angled edge
        attribute hasAngledEdge : Boolean = true;
        attribute edgeAngleDegrees : Real = 45.0;
    }

    // =========================================================================
    // PANEL PAIRS AND ASSEMBLIES
    // =========================================================================

    /**
     * Matched pair of curved panels (left and right).
     * Common for symmetric robot bodywork.
     */
    part def CurvedPanelPair3x6 {
        part leftPanel : Panel3x6CurvedLeft;
        part rightPanel : Panel3x6CurvedRight;
    }

    /**
     * Matched pair of 3x7 curved panels.
     */
    part def CurvedPanelPair3x7 {
        part leftPanel : Panel3x7CurvedLeft;
        part rightPanel : Panel3x7CurvedRight;
    }

    /**
     * Matched pair of 3x11 curved panels.
     */
    part def CurvedPanelPair3x11 {
        part leftPanel : Panel3x11CurvedLeft;
        part rightPanel : Panel3x11CurvedRight;
    }

    /**
     * Matched pair of 5x7 curved panels.
     */
    part def CurvedPanelPair5x7 {
        part leftPanel : Panel5x7CurvedLeft;
        part rightPanel : Panel5x7CurvedRight;
    }

    /**
     * Matched pair of 2x5 flat panels.
     */
    part def FlatPanelPair2x5 {
        part leftPanel : Panel2x5Left;
        part rightPanel : Panel2x5Right;
    }

    /**
     * Complete panel assortment for EV3 builds.
     */
    part def PanelAssortment {
        // 3x6 panels
        part panel3x6Left : Panel3x6CurvedLeft[0..*];
        part panel3x6Right : Panel3x6CurvedRight[0..*];

        // 3x7 panels
        part panel3x7Left : Panel3x7CurvedLeft[0..*];
        part panel3x7Right : Panel3x7CurvedRight[0..*];

        // 3x11 panels
        part panel3x11Left : Panel3x11CurvedLeft[0..*];
        part panel3x11Right : Panel3x11CurvedRight[0..*];

        // 5x7 panels
        part panel5x7Left : Panel5x7CurvedLeft[0..*];
        part panel5x7Right : Panel5x7CurvedRight[0..*];

        // Special panels
        part panel11x3 : Panel11x3Curved[0..*];

        // Flat panels
        part panel2x5Left : Panel2x5Left[0..*];
        part panel2x5Right : Panel2x5Right[0..*];
    }
}
