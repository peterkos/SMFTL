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
	
	@IBAction func addAlert(_ sender: Any) {
		
		var alertData: [AlertData] = []
		
		// Pull data from local store
		if let alertDataRead = UserDefaults.standard.object(forKey: "alertData") as? Data {
			do {
				alertData = try JSONDecoder().decode([AlertData].self, from: alertDataRead)
			} catch {
				print("Unable to decode from store in main ViewController")
			}
		} else {
			print("Unable to read store in main ViewController")
			return
		}
		
		// Append the new element
		let data = AlertData(sliderNumber: 0.5, enabled: true)
		alertData.append(data)
		print("Added element \(alertData.last!)")
		
		// Send notification
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateAlertData"), object: data)
		
		// Write it back out
		let alertDataWrite = try! JSONEncoder().encode(alertData)
		UserDefaults.standard.set(alertDataWrite, forKey: "alertData")
		
		UserDefaults.standard.synchronize()

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
	}
	

}
