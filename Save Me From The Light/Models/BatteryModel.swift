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
		if (UIDevice.current.batteryState == .charging) {
			NotificationManager.showRelief()
		}
	}
	
	@objc func batteryLevelDidChange(_ notification: Notification) {

		// User preferences
		let tenPercentWarning = UserDefaults.standard.bool(forKey: "tenPercentWarning")
		let fivePercentWarning = UserDefaults.standard.bool(forKey: "fivePercentWarning")
		let onePercentWarning = UserDefaults.standard.bool(forKey: "onePercentWarning")
		
		// Warning Sounds
		// TODO: Notification messages!
		if (batteryLevel == 10.0 && tenPercentWarning) {
			NotificationManager.showWarning()
		} else if (batteryLevel == 5.0 && fivePercentWarning) {
			NotificationManager.showWarning()
		} else if (batteryLevel == 1.0 && onePercentWarning) {
			NotificationManager.showWarning()
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

		// Observers for level & state change
		UIDevice.current.isBatteryMonitoringEnabled = true
		NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange),
											   name: .UIDeviceBatteryStateDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange),
											   name: .UIDeviceBatteryLevelDidChange, object: nil)
		
		print("State on load: \(printState(UIDevice.current.batteryState.rawValue))")
		print("Level on load: \(UIDevice.current.batteryLevel)")
		
	}
	
	
}
