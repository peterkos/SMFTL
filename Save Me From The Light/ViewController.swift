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


class ViewController: UIViewController, UNUserNotificationCenterDelegate {
	
	let soundPack = SoundPack("Grandalf", numberOfSounds: 6)
	
	// Literally saving two words here
	private let userDeafults = UserDefaults.standard
	
	// OUTLETS for reading settings
	@IBOutlet var tenPercentWarningSetting: UISwitch!
	@IBOutlet var fivePercentWarningSetting: UISwitch!
	@IBOutlet var onePercentWarningSetting: UISwitch!
	
	
	// TODO: Move to Constants file
	// ACTIONS for setting data
	@IBAction func tenPercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "tenPercentWarning")
	}
	
	@IBAction func fivePercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "fivePercentWarning")
	}
	
	@IBAction func onePercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "onePercentWarning")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		userDeafults.synchronize()
		
		// Set switches on load
		tenPercentWarningSetting.isOn  = userDeafults.bool(forKey: "tenPercentWarning")
		fivePercentWarningSetting.isOn = userDeafults.bool(forKey: "fivePercentWarning")
		onePercentWarningSetting.isOn  = userDeafults.bool(forKey: "onePercentWarning")
		
		scheduleIt()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		userDeafults.synchronize()
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		print("Handling...")
		completionHandler(.sound)
	}
	
	func scheduleIt() {
		
		// Implement notification
		let notifContent = UNMutableNotificationContent()
		notifContent.title = "battery!"
		notifContent.body = "Lawl dis is battery"
		
		// Grab a random warning sound to play
		let randomIndex = Int(arc4random_uniform(UInt32(soundPack.soundCount)))
		notifContent.sound = UNNotificationSound(named: soundPack.pack + "Warning" + String(randomIndex))
		
		let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
		let notif = UNNotificationRequest(identifier: "WarningNotification", content: notifContent, trigger: notifTrigger)
		
		UNUserNotificationCenter.current().add(notif) { (error) in
			guard error != nil else {
				print(error.debugDescription)
				return
			}
			
			print("Deploying notification!")
		}
		
	}
	

}

