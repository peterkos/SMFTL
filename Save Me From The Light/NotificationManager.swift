//
//  NotificationManager.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 1/15/18.
//  Copyright © 2018 UW. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
	
	var soundPack: SoundPack?
	
	init(withSoundPack pack: SoundPack? = nil) {
		soundPack = pack
	}

	func warningNotification() {
		
		guard let soundPack = soundPack else {
			print("ERROR: Initialize a sound pack first.")
			return
		}
		
		let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
		let notifContent = UNMutableNotificationContent()
		notifContent.title = "OI M8"
		notifContent.body = "I SWEAR ON ME MUM U BETTR PLOOG ET IN"
		notifContent.setValue("YES", forKeyPath: "shouldAlwaysAlertWhileAppIsForeground")
		
		// Grab a random warning sound to play
		notifContent.sound = UNNotificationSound(named: soundPack.randomWarningPath())
		
		// Request the notification
		let notif = UNNotificationRequest(identifier: "WarningNotification", content: notifContent, trigger: notifTrigger)
		requestNotification(notif)
		
	}
	
	func reliefNotification() {
		
		guard let soundPack = soundPack else {
			print("ERROR: Initialize a sound pack first.")
			return
		}
		
		let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
		let notifContent = UNMutableNotificationContent()
		notifContent.title = "you have found de wey"
		notifContent.body = "click click click click click"
		notifContent.setValue("YES", forKeyPath: "shouldAlwaysAlertWhileAppIsForeground")
		
		// Grab a random relief sound to play
		notifContent.sound = UNNotificationSound(named: soundPack.randomReliefPath())
		
		// Request the notification
		let notif = UNNotificationRequest(identifier: "ReliefNotification", content: notifContent, trigger: notifTrigger)
		requestNotification(notif)
		
	}
	
	func requestNotification(_ request: UNNotificationRequest) {
		let center = UNUserNotificationCenter.current()
		center.add(request) { (error) in
			guard error == nil else {
				print(error.debugDescription)
				print("There was an error :c")
				return
			}
			
			print("Deploying notification!")
		}
	}
	
	
	// UNUserNotificationCenterDelegate methods
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
		completionHandler([.alert, .sound])
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		print("Handel-ed!")
		completionHandler()
	}
}
