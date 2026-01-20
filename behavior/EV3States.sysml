/**
 * EV3States.sysml
 * State machine definitions for Lego EV3 Mindstorm robot
 * Defines behavioral states for motors, sensors, brick, and robot operations
 */
package EV3States {

    /**
     * MotorStates - Motor state machine
     * Defines the operational states of an EV3 motor
     */
    state def MotorStates {
        entry action motorEntry;
        do action motorMonitor;
        exit action motorExit;

        state idle;
        state running;
        state holding;
        state stalled;
        state braking;
        state coasting;

        transition first idle then running;
        transition startMotor first idle if speedSet then running;
        transition reachTargetBrake first running if targetReachedWithBrake then holding;
        transition reachTargetCoast first running if targetReachedNoBrake then coasting;
        transition motorStall first running if currentExceedsThreshold then stalled;
        transition stopWithBrake first running if brakeCommanded then braking;
        transition releaseHold first holding if released then idle;
        transition stallRecover first stalled if currentNormalizes then idle;
        transition brakeComplete first braking if stopped then idle;
        transition coastComplete first coasting if stopped then idle;
    }

    /**
     * SensorStates - Generic sensor state machine
     * Base state machine for all EV3 sensors
     */
    state def SensorStates {
        entry action sensorEntry;
        do action sensorMonitor;
        exit action sensorExit;

        state disconnected;
        state initializing;
        state ready;
        state reading;
        state error;

        transition first disconnected then initializing;
        transition sensorConnect first disconnected if sensorConnected then initializing;
        transition initComplete first initializing if initializationComplete then ready;
        transition startRead first ready if readRequested then reading;
        transition readComplete first reading if readDone then ready;
        transition sensorFault first reading if faultDetected then error;
        transition resetSensor first error if resetCommanded then initializing;
    }

    /**
     * BrickStates - EV3 Brick state machine
     * Defines the operational states of the EV3 programmable brick
     */
    state def BrickStates {
        entry action brickEntry;
        do action brickMonitor;
        exit action brickExit;

        state off;
        state booting;
        state idle;
        state running;
        state lowBattery;
        state shuttingDown;

        transition first off then booting;
        transition powerOn first off if powerButtonPressed then booting;
        transition bootComplete first booting if bootDone then idle;
        transition programStart first idle if programStarted then running;
        transition programEnd first running if programEnds then idle;
        transition runningLowBattery first running if voltageBelowThreshold then lowBattery;
        transition idleLowBattery first idle if voltageBelowThreshold then lowBattery;
        transition criticalBattery first lowBattery if voltageCritical then shuttingDown;
        transition userShutdown first idle if powerButtonHeld then shuttingDown;
        transition shutdownComplete first shuttingDown if shutdownDone then off;
    }

    /**
     * ColorSensorModeStates - Color sensor mode state machine
     * Defines the operating modes of the EV3 color sensor
     */
    state def ColorSensorModeStates {
        entry action modeEntry;
        do action modeOperation;
        exit action modeExit;

        state colorDetection;
        state reflectedLight;
        state ambientLight;
        state rgbRaw;

        transition first colorDetection then reflectedLight;
        transition colorToReflected first colorDetection if modeChangeRequested then reflectedLight;
        transition colorToAmbient first colorDetection if modeChangeRequested then ambientLight;
        transition colorToRgb first colorDetection if modeChangeRequested then rgbRaw;
        transition reflectedToColor first reflectedLight if modeChangeRequested then colorDetection;
        transition reflectedToAmbient first reflectedLight if modeChangeRequested then ambientLight;
        transition reflectedToRgb first reflectedLight if modeChangeRequested then rgbRaw;
        transition ambientToColor first ambientLight if modeChangeRequested then colorDetection;
        transition ambientToReflected first ambientLight if modeChangeRequested then reflectedLight;
        transition ambientToRgb first ambientLight if modeChangeRequested then rgbRaw;
        transition rgbToColor first rgbRaw if modeChangeRequested then colorDetection;
        transition rgbToReflected first rgbRaw if modeChangeRequested then reflectedLight;
        transition rgbToAmbient first rgbRaw if modeChangeRequested then ambientLight;
    }

    /**
     * GyroSensorStates - Gyro sensor state machine
     * Extends sensor concept with calibration and drift correction
     */
    state def GyroSensorStates {
        entry action gyroEntry;
        do action gyroMonitor;
        exit action gyroExit;

        state disconnected;
        state initializing;
        state calibrating;
        state ready;
        state reading;
        state driftCorrection;

        transition first disconnected then initializing;
        transition gyroConnect first disconnected if sensorConnected then initializing;
        transition startCalibration first initializing if autoCalibrate then calibrating;
        transition calibrationComplete first calibrating if calibrationDone then ready;
        transition startGyroRead first ready if readRequested then reading;
        transition gyroReadComplete first reading if readDone then ready;
        transition startDriftCorrection first ready if driftDetected then driftCorrection;
        transition driftCorrectionComplete first driftCorrection if correctionDone then ready;
    }

    /**
     * RobotOperationalStates - High-level robot operation states
     * Defines the overall operational states of the robot system
     */
    state def RobotOperationalStates {
        entry action robotEntry;
        do action robotMonitor;
        exit action robotExit;

        state startup;
        state waitingForCommand;
        state executingTask;
        state pausedTask;
        state errorRecovery;
        state shutdown;

        transition first startup then waitingForCommand;
        transition startupComplete first startup if initDone then waitingForCommand;
        transition receiveCommand first waitingForCommand if commandReceived then executingTask;
        transition taskComplete first executingTask if taskDone then waitingForCommand;
        transition pauseTask first executingTask if pauseCommanded then pausedTask;
        transition resumeTask first pausedTask if resumeCommanded then executingTask;
        transition taskError first executingTask if errorOccurred then errorRecovery;
        transition recoverySuccess first errorRecovery if recovered then waitingForCommand;
        transition initiateShutdown first waitingForCommand if shutdownCommanded then shutdown;
    }
}
