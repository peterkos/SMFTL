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
		// Play sound when < 10%, 5%, etc.
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
		
		print("State: \(printState(UIDevice.current.batteryState.rawValue))")
		print("Level: \(UIDevice.current.batteryLevel)")
	}
	
	
}
