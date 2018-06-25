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
			print("Notification authorization granted!")
		}
		
//		let batteryMod = BatteryModel()
		
		// Instantiate model if none
		print("Instantiating data model...")
		var alertData = UserDefaults.standard.object(forKey: "alertData") as? [AlertData]
		
		// Instantiating
		if alertData == nil {
			alertData = [AlertData()]
//			let alertDataWrite = NSKeyedArchiver.archivedData(withRootObject: alertData!)
			let alertDataWrite = try! JSONEncoder().encode(alertData)
			UserDefaults.standard.set(alertDataWrite, forKey: "alertData")
		}
		
		
		
		return true
	}


}


// Extensions from Jeffrey Fulton
//public extension UserDefaults {
//	func codableValue<T: Codable>(forKey key: String) throws -> T? {
//		guard let encoded = self.value(forKey: key) as? Data else { return nil }
//		return try PropertyListDecoder().decode(T.self, from: encoded)
//	}
//
//	func set<T: Codable>(codable value: T?, forKey key: String) throws {
//		let encoded = try PropertyListEncoder().encode(value)
//		self.set(encoded, forKey: key)
//	}
//}

