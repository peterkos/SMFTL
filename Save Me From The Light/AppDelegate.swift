//
//  AppDelegate.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/17/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var notificationManager: NotificationManager?
	var notificationDelegate: UNUserNotificationCenterDelegate?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		// Load in the first sound pack
		let soundPack = SoundPack("8Bit")
		
		// Configure notifications
		notificationManager = NotificationManager(withSoundPack: soundPack)!
		UNUserNotificationCenter.current().delegate = notificationManager
		
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
			print("dis is de wey")
		}
		
//		let batteryMod = BatteryModel()
		
		// Instantiate model if none
		if UserDefaults.standard.array(forKey: "alertData") == nil {
			UserDefaults.standard.set([ReminderData(sliderNumber: 0.5, enabled: true)], forKey: "alertData")
			print("Instantiating data model...")
		}
		
		return true
	}



}

