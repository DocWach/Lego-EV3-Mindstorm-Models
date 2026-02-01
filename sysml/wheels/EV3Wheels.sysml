package EV3Wheels {
    doc /*
     * EV3 Wheel Rim Definitions
     *
     * This package defines the various wheel rims compatible with the
     * LEGO Mindstorms EV3 system. All rims feature axle-compatible hubs
     * for connection to EV3 motors via axles and gears.
     */

    import ScalarValues::*;

    /**
     * Material types for EV3 wheel components.
     */
    enum def WheelMaterial {
        enum ABS;           // Acrylonitrile Butadiene Styrene plastic
        enum Rubber;        // Natural or synthetic rubber
        enum Nylon;         // Polyamide plastic
    }

    /**
     * Hub connection types for wheel rims.
     */
    enum def HubType {
        enum AxleHole;      // Standard cross-axle hole
        enum PinHole;       // Pin connector hole
        enum Magazine;      // Ball bearing magazine mount
    }

    /**
     * Abstract base definition for EV3 wheel rims.
     * Provides common attributes for all rim types.
     */
    abstract part def EV3WheelRimBase {
        doc /* Base wheel rim definition with common attributes */

        // LEGO identification
        attribute designId : String;
        attribute partName : String;

        // Physical dimensions (mm)
        attribute outerDiameter : Real;
        attribute width : Real;
        attribute hubDiameter : Real;

        // Construction
        attribute material : WheelMaterial;
        attribute hubType : HubType;
        attribute color : String;
    }

    /**
     * Small wheel rim 11x8mm.
     * LEGO Design ID: 42610
     * Compact rim for small mechanisms and caster wheels.
     */
    part def Rim11x8 :> EV3WheelRimBase {
        doc /* 11.2mm diameter x 8mm width wheel rim */

        attribute :>> designId = "42610";
        attribute :>> partName = "Wheel Rim 11 x 8";
        attribute :>> outerDiameter = 11.2;
        attribute :>> width = 8.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Small-medium wheel rim 18x14mm.
     * LEGO Design ID: 55982
     * Versatile rim for light-duty applications.
     */
    part def Rim18x14 :> EV3WheelRimBase {
        doc /* 18mm diameter x 14mm width wheel rim */

        attribute :>> designId = "55982";
        attribute :>> partName = "Wheel Rim 18 x 14";
        attribute :>> outerDiameter = 18.0;
        attribute :>> width = 14.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Medium wheel rim 24x14mm.
     * LEGO Design ID: 30027
     * Standard rim for medium-sized tires.
     */
    part def Rim24x14 :> EV3WheelRimBase {
        doc /* 24mm diameter x 14mm width wheel rim */

        attribute :>> designId = "30027";
        attribute :>> partName = "Wheel Rim 24 x 14";
        attribute :>> outerDiameter = 24.0;
        attribute :>> width = 14.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Medium-large wheel rim 30x20mm.
     * LEGO Design ID: 56145
     * Popular rim for EV3 robot drive wheels.
     */
    part def Rim30x20 :> EV3WheelRimBase {
        doc /* 30mm diameter x 20mm width wheel rim */

        attribute :>> designId = "56145";
        attribute :>> partName = "Wheel Rim 30 x 20";
        attribute :>> outerDiameter = 30.0;
        attribute :>> width = 20.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Large wheel rim 43x26mm.
     * LEGO Design ID: 56908
     * Large rim for high-traction applications.
     */
    part def Rim43x26 :> EV3WheelRimBase {
        doc /* 43.2mm diameter x 26mm width wheel rim */

        attribute :>> designId = "56908";
        attribute :>> partName = "Wheel Rim 43.2 x 26";
        attribute :>> outerDiameter = 43.2;
        attribute :>> width = 26.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Extra-large wheel rim 56x34mm.
     * LEGO Design ID: 41896
     * Largest standard rim for maximum ground clearance.
     */
    part def Rim56x34 :> EV3WheelRimBase {
        doc /* 56mm diameter x 34mm width wheel rim */

        attribute :>> designId = "41896";
        attribute :>> partName = "Wheel Rim 56 x 34";
        attribute :>> outerDiameter = 56.0;
        attribute :>> width = 34.0;
        attribute :>> hubDiameter = 4.8;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::AxleHole;
        attribute :>> color = "Light Bluish Gray";
    }

    /**
     * Ball wheel / caster wheel.
     * LEGO Design ID: 99948
     * Omnidirectional ball bearing wheel for caster applications.
     */
    part def BallWheel :> EV3WheelRimBase {
        doc /* Ball bearing caster wheel */

        attribute :>> designId = "99948";
        attribute :>> partName = "Ball Wheel with Magazine";
        attribute :>> outerDiameter = 24.0;
        attribute :>> width = 24.0;
        attribute :>> hubDiameter = 0.0;
        attribute :>> material = WheelMaterial::ABS;
        attribute :>> hubType = HubType::Magazine;
        attribute :>> color = "White";

        // Ball-specific attributes
        attribute ballDiameter : Real = 19.0;
        attribute ballMaterial : WheelMaterial = WheelMaterial::Nylon;
    }

    /**
     * Wheel assembly combining rim and tire.
     * Represents a complete wheel ready for mounting.
     */
    part def WheelAssembly {
        doc /* Complete wheel assembly with rim */

        part rim : EV3WheelRimBase;

        // Computed assembly dimensions
        attribute assemblyDiameter : Real;
        attribute assemblyWidth : Real;
    }

}
