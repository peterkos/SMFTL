//
//  BatteryModel.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit


class BatteryModel {
	
	
	var batteryLevel: Float {
		return UIDevice.current.batteryLevel
	}
	
	@objc func batteryStateDidChange(_ notification: Notification) {
		// State change
		// Reset message when plugged in
	}
	
	@objc func batteryLevelDidChange(_ notification: Notification) {
		
		// Level change
		// Play sound when == 10%, 5%, etc.
		let pack = UserDefaults.standard.string(forKey: "soundPack")
//		let sounds = SoundPack.init(<#T##pack: String##String#>, numberOfSounds: <#T##Int#>)
		
		// User preferences
		let tenPercentWarning = UserDefaults.standard.bool(forKey: "tenPercentWarning")
		let fivePercentWarning = UserDefaults.standard.bool(forKey: "fivePercentWarning")
		let onePercentWarning = UserDefaults.standard.bool(forKey: "onePercentWarning")
		
		if (batteryLevel == 10.0 && tenPercentWarning) {
			
		} else if (batteryLevel == 5.0 && fivePercentWarning) {
			
		} else if (batteryLevel == 1.0 && onePercentWarning) {
			
		}
	}

	// Useful print state function
	func printState(_ state: Int) -> String {
		switch UIDevice.current.batteryState {
		case .charging:  return "Charging!"
		case .full:		 return "Full!"
		case .unknown:	 return "Unknown?"
		case .unplugged: return "Unplugged."
		}
	}
	
	init() {
		UIDevice.current.isBatteryMonitoringEnabled = true
		
		// Observers for level & state change
		NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange),
											   name: .UIDeviceBatteryStateDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange),
											   name: .UIDeviceBatteryLevelDidChange, object: nil)
		
		print("State on load: \(printState(UIDevice.current.batteryState.rawValue))")
		print("Level on load: \(UIDevice.current.batteryLevel)")
	}
	
	
}
