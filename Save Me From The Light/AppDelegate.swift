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
	let notificationDelegate = NotificationManager()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		// Setup preference for voice pack to play
		// By default, uses the first.
		UserDefaults.standard.set("8Bit", forKey: "soundPack")
		
		
		// Configure notifications
		let current = UNUserNotificationCenter.current()
		current.delegate = notificationDelegate
		
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
			print("dis is de wey")
		}
		
//		let batteryMod = BatteryModel()
		
		return true
	}



}

