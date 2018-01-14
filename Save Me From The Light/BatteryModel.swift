//
//  BatteryModel.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit


class BatteryModel {
	
	fileprivate var sounds: SoundPack
	
	var batteryLevel: Float {
		return UIDevice.current.batteryLevel
	}
	
	@objc func batteryStateDidChange(_ notification: Notification) {
		
		if (UIDevice.current.batteryState == .charging) {
			sounds.playReliefSound()
		}
		
	}
	
	@objc func batteryLevelDidChange(_ notification: Notification) {
		
		// Play sound when == 10%, 5%, etc.
		// TODO: Add specific warning sounds?

		// User preferences
		let tenPercentWarning = UserDefaults.standard.bool(forKey: "tenPercentWarning")
		let fivePercentWarning = UserDefaults.standard.bool(forKey: "fivePercentWarning")
		let onePercentWarning = UserDefaults.standard.bool(forKey: "onePercentWarning")
		
		// Warning Sounds
		if (batteryLevel == 10.0 && tenPercentWarning) {
			sounds.playWarningSound()
		} else if (batteryLevel == 5.0 && fivePercentWarning) {
			sounds.playWarningSound()
		} else if (batteryLevel == 1.0 && onePercentWarning) {
			sounds.playWarningSound()
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
		
		
		// Load in sounds
		let pack = UserDefaults.standard.string(forKey: "soundPack")!
		sounds = SoundPack.init(pack, numberOfSounds: 3)
		
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
