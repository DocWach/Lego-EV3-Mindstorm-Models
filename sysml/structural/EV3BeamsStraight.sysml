package EV3BeamsStraight {

    /**
     * Standard Technic material specification.
     * All EV3 structural components are made from ABS plastic.
     */
    enum def TechnicMaterial {
        enum ABS;
        enum Polycarbonate;
    }

    /**
     * Standard Technic beam colors available in EV3 sets.
     */
    enum def BeamColor {
        enum Black;
        enum White;
        enum Red;
        enum Blue;
        enum Yellow;
        enum LightGray;
        enum DarkGray;
    }

    /**
     * Beam thickness classification.
     */
    enum def BeamThickness {
        enum Standard;  // Full 1-module thickness (7.8mm)
        enum Thin;      // Half thickness (3.9mm)
    }

    /**
     * Abstract base definition for all Technic beams.
     * Provides common attributes for structural beam components.
     */
    abstract part def TechnicBeamBase {
        // Part identification
        attribute designId : String;
        attribute partName : String;

        // Dimensional attributes (in modules, 1M = 8mm)
        attribute lengthModules : Integer;
        attribute holeCount : Integer;
        attribute holeSpacing : Real = 8.0;  // mm between hole centers

        // Physical properties
        attribute thickness : BeamThickness;
        attribute thicknessMM : Real;
        attribute material : TechnicMaterial = TechnicMaterial::ABS;
        attribute color : BeamColor;

        // Weight (approximate)
        attribute weightGrams : Real;
    }

    /**
     * Abstract definition for standard thickness straight beams.
     * Standard beams have full 1-module (7.8mm) thickness.
     */
    abstract part def StandardStraightBeam :> TechnicBeamBase {
        attribute :>> thickness = BeamThickness::Standard;
        attribute :>> thicknessMM = 7.8;
    }

    /**
     * Abstract definition for thin straight beams.
     * Thin beams have half thickness (3.9mm) for compact assemblies.
     */
    abstract part def ThinStraightBeam :> TechnicBeamBase {
        attribute :>> thickness = BeamThickness::Thin;
        attribute :>> thicknessMM = 3.9;
    }

    // =========================================================================
    // STANDARD THICKNESS STRAIGHT BEAMS
    // =========================================================================

    /**
     * Technic Beam 1x2 - Smallest standard beam.
     * LEGO Design ID: 6629 (also 43857)
     * 2 modules long with 2 pin holes.
     */
    part def TechnicBeam1x2 :> StandardStraightBeam {
        attribute :>> designId = "6629";
        attribute :>> partName = "Technic Beam 1x2";
        attribute :>> lengthModules = 2;
        attribute :>> holeCount = 2;
        attribute :>> weightGrams = 0.9;
    }

    /**
     * Technic Beam 1x3 - Short standard beam.
     * LEGO Design ID: 32523
     * 3 modules long with 3 pin holes.
     */
    part def TechnicBeam1x3 :> StandardStraightBeam {
        attribute :>> designId = "32523";
        attribute :>> partName = "Technic Beam 1x3";
        attribute :>> lengthModules = 3;
        attribute :>> holeCount = 3;
        attribute :>> weightGrams = 1.3;
    }

    /**
     * Technic Beam 1x5 - Common medium beam.
     * LEGO Design ID: 32316
     * 5 modules long with 5 pin holes.
     */
    part def TechnicBeam1x5 :> StandardStraightBeam {
        attribute :>> designId = "32316";
        attribute :>> partName = "Technic Beam 1x5";
        attribute :>> lengthModules = 5;
        attribute :>> holeCount = 5;
        attribute :>> weightGrams = 2.2;
    }

    /**
     * Technic Beam 1x7 - Medium-length beam.
     * LEGO Design ID: 32524
     * 7 modules long with 7 pin holes.
     */
    part def TechnicBeam1x7 :> StandardStraightBeam {
        attribute :>> designId = "32524";
        attribute :>> partName = "Technic Beam 1x7";
        attribute :>> lengthModules = 7;
        attribute :>> holeCount = 7;
        attribute :>> weightGrams = 3.1;
    }

    /**
     * Technic Beam 1x9 - Longer beam.
     * LEGO Design ID: 40490
     * 9 modules long with 9 pin holes.
     */
    part def TechnicBeam1x9 :> StandardStraightBeam {
        attribute :>> designId = "40490";
        attribute :>> partName = "Technic Beam 1x9";
        attribute :>> lengthModules = 9;
        attribute :>> holeCount = 9;
        attribute :>> weightGrams = 4.0;
    }

    /**
     * Technic Beam 1x11 - Standard long beam.
     * LEGO Design ID: 32525
     * 11 modules long with 11 pin holes.
     */
    part def TechnicBeam1x11 :> StandardStraightBeam {
        attribute :>> designId = "32525";
        attribute :>> partName = "Technic Beam 1x11";
        attribute :>> lengthModules = 11;
        attribute :>> holeCount = 11;
        attribute :>> weightGrams = 4.9;
    }

    /**
     * Technic Beam 1x13 - Long beam.
     * LEGO Design ID: 41239
     * 13 modules long with 13 pin holes.
     */
    part def TechnicBeam1x13 :> StandardStraightBeam {
        attribute :>> designId = "41239";
        attribute :>> partName = "Technic Beam 1x13";
        attribute :>> lengthModules = 13;
        attribute :>> holeCount = 13;
        attribute :>> weightGrams = 5.8;
    }

    /**
     * Technic Beam 1x15 - Very long beam.
     * LEGO Design ID: 32278
     * 15 modules long with 15 pin holes.
     * Common for chassis and large structures.
     */
    part def TechnicBeam1x15 :> StandardStraightBeam {
        attribute :>> designId = "32278";
        attribute :>> partName = "Technic Beam 1x15";
        attribute :>> lengthModules = 15;
        attribute :>> holeCount = 15;
        attribute :>> weightGrams = 6.7;
    }

    // =========================================================================
    // THIN STRAIGHT BEAMS
    // =========================================================================

    /**
     * Technic Thin Beam 1x5 - Half-thickness beam.
     * LEGO Design ID: 32017
     * 5 modules long with 5 pin holes, thin profile.
     * Useful for compact assemblies and weight reduction.
     */
    part def ThinBeam1x5 :> ThinStraightBeam {
        attribute :>> designId = "32017";
        attribute :>> partName = "Technic Thin Beam 1x5";
        attribute :>> lengthModules = 5;
        attribute :>> holeCount = 5;
        attribute :>> weightGrams = 1.1;
    }

    /**
     * Technic Thin Beam 1x5 with Axle Holes - Thin beam with axle ends.
     * LEGO Design ID: 11478
     * 5 modules long with 5 holes, end holes are cross-axle compatible.
     * Enables direct axle attachment at beam ends.
     */
    part def ThinBeam1x5WithAxle :> ThinStraightBeam {
        attribute :>> designId = "11478";
        attribute :>> partName = "Technic Thin Beam 1x5 with Axle Holes";
        attribute :>> lengthModules = 5;
        attribute :>> holeCount = 5;
        attribute :>> weightGrams = 1.2;

        // Special feature: axle-compatible end holes
        attribute hasAxleEndHoles : Boolean = true;
        attribute axleHolePositions : Integer[2] = (1, 5);
    }

    // =========================================================================
    // UTILITY PARTS
    // =========================================================================

    /**
     * Collection of straight beams for a typical EV3 build.
     * Provides a standard assortment of beam sizes.
     */
    part def StraightBeamAssortment {
        part beam1x2 : TechnicBeam1x2[0..*];
        part beam1x3 : TechnicBeam1x3[0..*];
        part beam1x5 : TechnicBeam1x5[0..*];
        part beam1x7 : TechnicBeam1x7[0..*];
        part beam1x9 : TechnicBeam1x9[0..*];
        part beam1x11 : TechnicBeam1x11[0..*];
        part beam1x13 : TechnicBeam1x13[0..*];
        part beam1x15 : TechnicBeam1x15[0..*];
        part thinBeam1x5 : ThinBeam1x5[0..*];
        part thinBeam1x5Axle : ThinBeam1x5WithAxle[0..*];
    }
}
