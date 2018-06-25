//
//  ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/17/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import UserNotifications
import SwiftySound


class ViewController: UIViewController {
	
	let userDefaults = UserDefaults.standard
	
	@IBAction func addAlert(_ sender: Any) {
		
		var alertData: [ReminderData] = userDefaults.array(forKey: "alertData") as? [ReminderData] ?? []
		alertData.append(ReminderData(sliderNumber: 0.5, enabled: true))
		
		userDefaults.set(alertData, forKey: "alertData")
		userDefaults.synchronize()

	}
	
	
	// Old functions for testing purposes later on
	@IBAction func testWarningNotification(_ sender: Any) {
		NotificationManager.showWarning()
	}
	
	@IBAction func testReliefNotification(_ sender: Any) {
		NotificationManager.showRelief()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		userDefaults.synchronize()
	}
	

}
