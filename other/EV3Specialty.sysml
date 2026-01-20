package EV3Specialty {
    doc /*
     * EV3 Specialty Parts Package
     * Contains universal joints, CV joints, hoses, rubber bands, and other
     * specialty mechanical elements from the LEGO Mindstorms EV3 sets.
     * These parts enable complex mechanical transmissions and flexible connections.
     */

    import EV3Types::*;

    /**
     * Material types for specialty elements
     */
    enum def SpecialtyMaterial {
        enum ABS;
        enum Rubber;
        enum TPE;
        enum Nylon;
        enum Silicone;
    }

    /**
     * Flexibility ratings for flexible components
     */
    enum def FlexibilityRating {
        enum Rigid;
        enum SemiFlexible;
        enum Flexible;
        enum HighlyFlexible;
    }

    /**
     * Abstract base definition for specialty mechanical parts
     */
    abstract part def SpecialtyPartBase {
        doc /* Base characteristics shared by all specialty parts */

        attribute designId : String;
        attribute partName : String;
        attribute material : SpecialtyMaterial;
        attribute colorName : String;
        attribute massGrams : Real;
    }

    /**
     * UniversalJoint3L - 3-Module Universal Joint
     * LEGO Design ID: 61903
     * A universal joint (U-joint) spanning 3 Technic modules.
     * Enables power transmission through angled connections.
     */
    part def UniversalJoint3L :> SpecialtyPartBase {
        doc /*
         * 3L Universal Joint for angled power transmission.
         * Allows torque transfer through misaligned shafts.
         * Maximum operating angle: 35 degrees per joint.
         */

        attribute :>> designId = "61903";
        attribute :>> partName = "Universal Joint 3L";
        attribute :>> material = SpecialtyMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 3.2;

        // Dimensional attributes
        attribute length : Real = 24.0;             // mm (3 modules)
        attribute outerDiameter : Real = 8.0;       // mm
        attribute axleHoleDiameter : Real = 4.8;    // mm (cross-axle)

        // Joint characteristics
        attribute maxOperatingAngle : Real = 35.0;  // degrees
        attribute jointCount : Integer = 2;         // number of pivot points
        attribute axleCompatibility : String = "Technic Cross Axle";

        // Performance attributes
        attribute maxTorque : Real = 0.5;           // Nm
        attribute efficiencyAtAngle : Real = 0.92;  // at 20 degree angle
        attribute backlash : Real = 2.0;            // degrees of play
        attribute flexibility : FlexibilityRating = FlexibilityRating::SemiFlexible;

        // Operational attributes
        attribute isAxleThrough : Boolean = true;
        attribute requiresLubrication : Boolean = false;
    }

    /**
     * CVJointInput - Constant Velocity Joint Input Half
     * LEGO Design ID: 92906
     * The input (drive) half of a CV joint assembly.
     * Provides smoother power transmission than universal joints at angles.
     */
    part def CVJointInput :> SpecialtyPartBase {
        doc /*
         * CV Joint input axle half.
         * Connects to driving axle, pairs with CVJointOutput.
         * Maintains constant velocity ratio regardless of angle.
         */

        attribute :>> designId = "92906";
        attribute :>> partName = "CV Joint Axle Input";
        attribute :>> material = SpecialtyMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 2.5;

        // Dimensional attributes
        attribute length : Real = 16.0;             // mm (2 modules)
        attribute ballDiameter : Real = 12.0;       // mm, CV ball section
        attribute axleLength : Real = 8.0;          // mm, input shaft

        // Joint characteristics
        attribute maxOperatingAngle : Real = 40.0;  // degrees
        attribute cvType : String = "Rzeppa";       // CV joint type
        attribute ballCount : Integer = 6;          // internal CV balls
        attribute flexibility : FlexibilityRating = FlexibilityRating::SemiFlexible;

        // Performance attributes
        attribute velocityConstancy : Real = 0.995; // velocity ratio accuracy
        attribute maxTorque : Real = 0.6;           // Nm
        attribute efficiencyAtAngle : Real = 0.96;  // at 30 degree angle

        // Connection attributes
        attribute inputAxleType : String = "Technic Cross Axle";
        attribute requiresOutputHalf : Boolean = true;
    }

    /**
     * CVJointOutput - Constant Velocity Joint Output Half
     * LEGO Design ID: 92907
     * The output (driven) half of a CV joint assembly.
     * Pairs with CVJointInput for complete CV joint system.
     */
    part def CVJointOutput :> SpecialtyPartBase {
        doc /*
         * CV Joint output axle half.
         * Connects to driven axle, pairs with CVJointInput.
         * Receives power from input half through CV mechanism.
         */

        attribute :>> designId = "92907";
        attribute :>> partName = "CV Joint Axle Output";
        attribute :>> material = SpecialtyMaterial::ABS;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 2.5;

        // Dimensional attributes
        attribute length : Real = 16.0;             // mm (2 modules)
        attribute socketDiameter : Real = 13.0;     // mm, CV socket section
        attribute axleLength : Real = 8.0;          // mm, output shaft

        // Joint characteristics
        attribute maxOperatingAngle : Real = 40.0;  // degrees
        attribute cageType : String = "Ball Cage";  // internal cage type
        attribute flexibility : FlexibilityRating = FlexibilityRating::SemiFlexible;

        // Performance attributes
        attribute maxTorque : Real = 0.6;           // Nm
        attribute snapEngagement : Real = 10.0;     // N, engagement force

        // Connection attributes
        attribute outputAxleType : String = "Technic Cross Axle";
        attribute requiresInputHalf : Boolean = true;
    }

    /**
     * Complete CV Joint Assembly
     * Combines input and output halves for a functional CV joint
     */
    part def CVJointAssembly {
        doc /*
         * Complete CV joint assembly with input and output halves.
         * Provides constant velocity power transmission through angles.
         */

        part input : CVJointInput;
        part output : CVJointOutput;

        attribute assembledLength : Real = 32.0;    // mm
        attribute operatingAngle : Real;            // current angle
        attribute isEngaged : Boolean;
    }

    /**
     * RubberBand25mm - 25mm Diameter Rubber Band
     * LEGO Design ID: 85544
     * A red rubber band for tensioning and power transmission.
     * Common in catapult and launcher mechanisms.
     */
    part def RubberBand25mm :> SpecialtyPartBase {
        doc /*
         * 25mm diameter rubber band.
         * Used for energy storage, tensioning, and belt drives.
         * Red color for high visibility.
         */

        attribute :>> designId = "85544";
        attribute :>> partName = "Rubber Band 25mm";
        attribute :>> material = SpecialtyMaterial::Rubber;
        attribute :>> colorName = "Red";
        attribute :>> massGrams = 0.8;

        // Dimensional attributes
        attribute innerDiameter : Real = 25.0;      // mm, unstretched
        attribute crossSection : Real = 2.0;        // mm, band thickness
        attribute circumference : Real = 78.5;      // mm, unstretched

        // Elastic properties
        attribute maxStretch : Real = 3.0;          // stretch ratio (3x original)
        attribute springConstant : Real = 45.0;     // N/m
        attribute tensileStrength : Real = 8.0;     // N, breaking force
        attribute flexibility : FlexibilityRating = FlexibilityRating::HighlyFlexible;

        // Performance attributes
        attribute energyStorage : Real = 0.15;      // J at 2x stretch
        attribute fatigueLife : Integer = 5000;     // cycles to failure
        attribute temperatureRange : String = "-10C to 60C";

        // Usage attributes
        attribute suitableForBeltDrive : Boolean = true;
        attribute suitableForCatapult : Boolean = true;
    }

    /**
     * RubberBand26mm - 26mm Diameter Rubber Band
     * LEGO Design ID: 700c01
     * A blue rubber band slightly larger than the 25mm version.
     * Provides different tension characteristics.
     */
    part def RubberBand26mm :> SpecialtyPartBase {
        doc /*
         * 26mm diameter rubber band.
         * Slightly larger than 25mm for different tension needs.
         * Blue color distinguishes from red bands.
         */

        attribute :>> designId = "700c01";
        attribute :>> partName = "Rubber Band 26mm";
        attribute :>> material = SpecialtyMaterial::Rubber;
        attribute :>> colorName = "Blue";
        attribute :>> massGrams = 0.9;

        // Dimensional attributes
        attribute innerDiameter : Real = 26.0;      // mm, unstretched
        attribute crossSection : Real = 2.0;        // mm, band thickness
        attribute circumference : Real = 81.7;      // mm, unstretched

        // Elastic properties
        attribute maxStretch : Real = 3.0;          // stretch ratio
        attribute springConstant : Real = 42.0;     // N/m (slightly softer)
        attribute tensileStrength : Real = 8.5;     // N, breaking force
        attribute flexibility : FlexibilityRating = FlexibilityRating::HighlyFlexible;

        // Performance attributes
        attribute energyStorage : Real = 0.14;      // J at 2x stretch
        attribute fatigueLife : Integer = 5500;     // cycles to failure
        attribute temperatureRange : String = "-10C to 60C";

        // Usage attributes
        attribute suitableForBeltDrive : Boolean = true;
        attribute suitableForCatapult : Boolean = true;
    }

    /**
     * HoseCorrugated - Corrugated Flexible Hose
     * LEGO Design ID: 70905
     * A 15.2cm corrugated flexible hose for pneumatic or decorative use.
     * Can bend while maintaining internal passage.
     */
    part def HoseCorrugated :> SpecialtyPartBase {
        doc /*
         * 15.2cm corrugated flexible hose.
         * Ribbed construction allows bending while maintaining shape.
         * Used for pneumatic connections and cable routing.
         */

        attribute :>> designId = "70905";
        attribute :>> partName = "Hose Corrugated 15.2cm";
        attribute :>> material = SpecialtyMaterial::TPE;
        attribute :>> colorName = "Black";
        attribute :>> massGrams = 4.5;

        // Dimensional attributes
        attribute length : Real = 152.0;            // mm (15.2 cm)
        attribute outerDiameter : Real = 7.0;       // mm
        attribute innerDiameter : Real = 4.0;       // mm
        attribute corrugationPitch : Real = 3.0;    // mm, rib spacing

        // Flexibility attributes
        attribute minBendRadius : Real = 20.0;      // mm
        attribute maxBendAngle : Real = 180.0;      // degrees total
        attribute flexibility : FlexibilityRating = FlexibilityRating::Flexible;

        // Functional attributes
        attribute isPneumaticRated : Boolean = true;
        attribute maxPressure : Real = 1.5;         // bar
        attribute kinkResistant : Boolean = true;

        // Connection attributes
        attribute endType : String = "Technic Pin Hole";
        attribute isConnectorIncluded : Boolean = false;
    }

    /**
     * StringWithStuds - String with Stud Connectors
     * LEGO Design ID: 18945
     * A 21-stud length string with connector ends.
     * Used for winches, pulleys, and tethered mechanisms.
     */
    part def StringWithStuds :> SpecialtyPartBase {
        doc /*
         * 21-stud length string with connector ends.
         * Braided nylon construction for strength and flexibility.
         * Used in winch, crane, and tethering applications.
         */

        attribute :>> designId = "18945";
        attribute :>> partName = "String 21 Studs";
        attribute :>> material = SpecialtyMaterial::Nylon;
        attribute :>> colorName = "White";
        attribute :>> massGrams = 1.2;

        // Dimensional attributes
        attribute lengthStuds : Integer = 21;       // in stud units
        attribute lengthMm : Real = 168.0;          // mm (21 * 8mm)
        attribute diameter : Real = 1.5;            // mm
        attribute flexibility : FlexibilityRating = FlexibilityRating::HighlyFlexible;

        // Strength attributes
        attribute breakingStrength : Real = 25.0;   // N
        attribute workingLoad : Real = 10.0;        // N, safe load
        attribute stretchFactor : Real = 1.02;      // minimal stretch

        // End connector attributes
        attribute endConnectorType : String = "Stud Hole";
        attribute hasEndConnectors : Boolean = true;
        attribute connectorCount : Integer = 2;

        // Usage attributes
        attribute suitableForWinch : Boolean = true;
        attribute suitableForPulley : Boolean = true;
    }

    /**
     * ChainLink - Small Chain Link
     * LEGO Design ID: 3711
     * A small chain link for creating chain drives and decorative chains.
     * Links together to form continuous chains.
     */
    part def ChainLink :> SpecialtyPartBase {
        doc /*
         * Small chain link element.
         * Connects with other links to form chains.
         * Used in chain drives and decorative applications.
         */

        attribute :>> designId = "3711";
        attribute :>> partName = "Chain Link Small";
        attribute :>> material = SpecialtyMaterial::ABS;
        attribute :>> colorName = "Dark Bluish Gray";
        attribute :>> massGrams = 0.3;

        // Dimensional attributes
        attribute length : Real = 8.0;              // mm, single link
        attribute width : Real = 4.0;               // mm
        attribute thickness : Real = 2.0;           // mm
        attribute pitchLength : Real = 8.0;         // mm, link-to-link
        attribute flexibility : FlexibilityRating = FlexibilityRating::SemiFlexible;

        // Articulation attributes
        attribute maxArticulation : Real = 45.0;    // degrees per joint
        attribute linkageType : String = "Interlocking";

        // Strength attributes
        attribute tensileStrength : Real = 15.0;    // N, per link
        attribute workingLoad : Real = 8.0;         // N, safe load

        // Connection attributes
        attribute isOpenLink : Boolean = false;
        attribute canConnectToSprocket : Boolean = true;
        attribute sprocketTeeth : Integer = 16;     // compatible sprocket size
    }

    /**
     * Chain Assembly - Multiple linked chain segments
     */
    part def ChainAssembly {
        doc /*
         * Assembly of connected chain links.
         * Variable length chain for drives and mechanisms.
         */

        part links : ChainLink [1..*];

        attribute linkCount : Integer;
        attribute totalLength : Real;               // mm
        attribute isClosed : Boolean;               // loop or open
    }
}
