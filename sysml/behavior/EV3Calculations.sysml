package EV3Calculations {
    doc /*
     * SysML v2 Calculation Definitions for Lego EV3 Mindstorm Robot
     * Contains common calculations for motor control, navigation, and sensors.
     */

    // 1. Convert power percentage to actual motor speed in RPM
    calc def CalculateMotorSpeed {
        doc /* Converts motor power percentage (-100 to 100) to actual RPM */
        in powerPercent : Integer;
        in maxRPM : Real;
        return : Real;

        powerPercent / 100.0 * maxRPM
    }

    // 2. Convert encoder ticks (degrees) to distance traveled
    calc def CalculateEncoderToDistance {
        doc /* Converts encoder degrees to linear distance in mm */
        in encoderDegrees : Integer;
        in wheelDiameter : Real;
        return : Real;

        encoderDegrees / 360.0 * wheelDiameter * 3.14159
    }

    // 3. Convert desired distance to encoder target
    calc def CalculateDistanceToEncoder {
        doc /* Converts desired distance (mm) to encoder degrees */
        in distance : Real;
        in wheelDiameter : Real;
        return : Integer;

        (distance / (wheelDiameter * 3.14159) * 360.0)
    }

    // 4. Calculate wheel rotation needed for robot turn
    calc def CalculateTurnAngleToEncoder {
        doc /* Calculates encoder degrees per wheel for a robot turn */
        in turnAngle : Integer;
        in wheelBase : Real;
        in wheelDiameter : Real;
        return : Integer;

        (turnAngle / 360.0) * wheelBase * 3.14159 / (wheelDiameter * 3.14159) * 360.0
    }

    // 5. PID controller calculation
    calc def CalculatePIDOutput {
        doc /* Standard PID controller output calculation */
        in error : Real;
        in integral : Real;
        in derivative : Real;
        in kP : Real;
        in kI : Real;
        in kD : Real;
        return : Real;

        kP * error + kI * integral + kD * derivative
    }

    // 6. Convert raw ultrasonic reading to distance
    calc def ConvertUltrasonicToDistance {
        doc /* Converts raw ultrasonic sensor reading to distance */
        in rawValue : Integer;
        in useCentimeters : Boolean;
        return : Real;

        if useCentimeters ? rawValue / 10.0 else rawValue / 25.4
    }

    // 7. Calculate X position from wheel encoders (odometry)
    calc def CalculateOdometryX {
        doc /* Updates X position based on wheel encoder changes */
        in leftEncoder : Integer;
        in rightEncoder : Integer;
        in wheelDiameter : Real;
        in previousX : Real;
        in heading : Real;
        return : Real;

        attribute avgDistance : Real = (leftEncoder + rightEncoder) / 2.0 / 360.0 * wheelDiameter * 3.14159;
        previousX + avgDistance * cos(heading)
    }

    // 8. Calculate Y position from wheel encoders (odometry)
    calc def CalculateOdometryY {
        doc /* Updates Y position based on wheel encoder changes */
        in leftEncoder : Integer;
        in rightEncoder : Integer;
        in wheelDiameter : Real;
        in previousY : Real;
        in heading : Real;
        return : Real;

        attribute avgDistance : Real = (leftEncoder + rightEncoder) / 2.0 / 360.0 * wheelDiameter * 3.14159;
        previousY + avgDistance * sin(heading)
    }

    // 9. Calculate robot heading from wheel encoder difference
    calc def CalculateHeading {
        doc /* Updates heading based on differential wheel rotation */
        in leftEncoder : Integer;
        in rightEncoder : Integer;
        in wheelBase : Real;
        in wheelDiameter : Real;
        in previousHeading : Real;
        return : Real;

        attribute leftDistance : Real = leftEncoder / 360.0 * wheelDiameter * 3.14159;
        attribute rightDistance : Real = rightEncoder / 360.0 * wheelDiameter * 3.14159;
        attribute deltaHeading : Real = (rightDistance - leftDistance) / wheelBase;
        previousHeading + deltaHeading
    }

    // 10. Convert battery voltage to percentage
    calc def CalculateBatteryPercentage {
        doc /* Converts battery voltage to percentage (0-100) */
        in voltage : Real;
        in minVoltage : Real;
        in maxVoltage : Real;
        return : Integer;

        ((voltage - minVoltage) / (maxVoltage - minVoltage) * 100)
    }

    // 11. Calculate motor correction for line following
    calc def CalculateLineFollowingCorrection {
        doc /* Proportional correction for line following */
        in currentReflection : Integer;
        in targetReflection : Integer;
        in kP : Real;
        return : Integer;

        (kP * (targetReflection - currentReflection))
    }

    // 12. Normalize angle to -180 to 180 range
    calc def NormalizeAngle {
        doc /* Normalizes angle to range -180 to 180 degrees */
        in angle : Integer;
        return : Integer;

        attribute normalized : Integer = angle % 360;
        if normalized > 180 ? normalized - 360
        else if normalized < -180 ? normalized + 360
        else normalized
    }
}
