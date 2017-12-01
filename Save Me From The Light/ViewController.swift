//
//  ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/17/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound


class ViewController: UIViewController {
	
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
	
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		// Create a custom container view
		// This is required to set custom bounds on the container
		// i.e., fill the trapezoidal shape bounds found in Constants.
		let customContainer = storyboard!.instantiateViewController(withIdentifier: "customContainerViewController")
		self.addChildViewController(customContainer)
		self.view.addSubview(customContainer.view)
		
		customContainer.view.frame = Constants(withViewFrame: self.view.frame).path.bounds
		// Set autoresizing mask?
		customContainer.didMove(toParentViewController: self)
		
		print("VCs: \(self.childViewControllers)")
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()

		UIDevice.current.isBatteryMonitoringEnabled = true
		
		// Observers for level & state change
		NotificationCenter.default.addObserver(self, selector: #selector(batteryStateDidChange),
											   name: .UIDeviceBatteryStateDidChange, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelDidChange),
											   name: .UIDeviceBatteryLevelDidChange, object: nil)
		
		print("State: \(printState(UIDevice.current.batteryState.rawValue))")
		print("Level: \(UIDevice.current.batteryLevel)")
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

