//
//  SoundManager.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/21/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import UserNotifications
import SwiftySound


// Common func to load soundpack in

class SoundPack {
	
	var warningSounds = [String: Sound]()
	var reliefSounds = [String: Sound]()
	var currentSound: Sound?
	var soundCount: Int

	// Precondition: Warning/Relief sound files are equal in number!
	init(_ pack: String, numberOfSounds soundCount: Int)  {
		
		self.soundCount = soundCount
		
		// Load all warning sounds
		let warningSoundURLS = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: "Sounds/" + pack + "/Warnings", localization: nil)!
		let reliefSoundURLS  = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: "Sounds/" + pack + "/Relief", localization: nil)!
		
		guard warningSoundURLS.count >= soundCount else {
			let message = "Unable to load all warning sound files for pack \(pack). Only \(warningSoundURLS.count)/3 found."
			print(message)
			fatalError(message)
		}
		
		guard reliefSoundURLS.count >= soundCount else {
			let message = "Unable to load all relief sound files for pack \(pack). Only \(reliefSoundURLS.count)/3 found."
			print(message)
			fatalError(message)
		}
		
		// Instantiate sounds
		warningSounds["tenPercent"]  = Sound(url: warningSoundURLS[0])
		warningSounds["fivePercent"] = Sound(url: warningSoundURLS[1])
		warningSounds["onePercent"]  = Sound(url: warningSoundURLS[2])
		
		reliefSounds["tenPercent"]  = Sound(url: reliefSoundURLS[0])
		reliefSounds["fivePercent"] = Sound(url: reliefSoundURLS[1])
		reliefSounds["onePercent"]  = Sound(url: reliefSoundURLS[2])
		
		
		// Implement notification
		// Redo all the sound loading code >:(
		let notifContent = UNMutableNotificationContent()
//		notif.title = "battery!"
//		notif.body = "Lawl dis is battery"
		
		let notif = UNNotificationRequest(identifier: "SoundPlay", content: notifContent, trigger: nil)
	}
	
	
	// Selects a random warning sound to play
	func playWarningSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		let randomKey = Array(warningSounds.keys)[randomIndex]
		
		currentSound = warningSounds[randomKey]!
		currentSound!.play()
	}
	
	// Selects a random relief sound to play
	func playReliefSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		let randomKey = Array(reliefSounds.keys)[randomIndex]
		
		currentSound = reliefSounds[randomKey]!
		currentSound!.play()
	}
	
	// Selects either random or warning sound (random)
	func playSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(100)))
		
		if randomIndex % 2 == 0 {
			playReliefSound()
		} else {
			playWarningSound()
		}
		
		print(randomIndex)
	}
}
