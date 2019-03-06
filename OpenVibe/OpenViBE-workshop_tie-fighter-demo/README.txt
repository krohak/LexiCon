 ****************************************
 *                                      *
 * OpenViBE Workshop - Tie-Fighter Demo *
 *                                      *
 ****************************************
 
 
 
 Files included :
 
  - electrodes_demo_ov_workshop  	// conatins list of electrodes plugged.
  - img7.jpg  				// image used in threshold_movement_calibration scenario.
  - stim_Use-the-force_calibration.lua  // lua script used by lua stimulator box in threshold_movement_calibration scenario.
  - stim_Use-the-force_freeTime.lua     // lua script used by lua stimulator box in Use-the-force-online_5chanLaplacianCz_self-paced-session scenario.
  
  - Signals.xml				// Scenario to display signals.
  - threshold_movement_calibration.xml  // Calibration scenario.
  - Use-the-force-online_5chanLaplacianCz_self-paced-session.xml   // Demo scenario.
  
  - Crop     // Folder where cropped signal are saved.
  - signals  //	Folder where raw signal are saved.
  
  - signals\workshop_calibration_example.ov  // Example recording of calibration session from workshop (to replay using reader in calibration scenario).
  - signals\workshop_session_example.ov	     // Example recording of demo session from workshop (to replay using reader in self-paced-session scenario).
  
  
  
  How to run Demo :
  
  1. Play Signals.xml scenario to check quality of eeg signals.
  
  2. Play threshold_movement_calibration.xml, the participant should relax looking at the image in fullscreen
     until the image disappear (30 sec). Pause the scenario, note the value displayed by "Mean + 3*sqrt(Variance)"
     window before stopping scenario.
     
  3. Open Use-the-force-online_5chanLaplacianCz_self-paced-session.xml scenario. The value obtain from the calibration scenario
     should be placed in "Min crop value" field in configuration of Crop box and in "Shift values" to center the signal on it.
     
  4. Play Use-the-force-online_5chanLaplacianCz_self-paced-session.xml, then launch vr-demo-tie-fighter in your OpenViBE installation.
  
  Enjoy ! 
