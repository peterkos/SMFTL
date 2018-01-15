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
	
	var warningSounds = [Sound]()
	var reliefSounds = [Sound]()
	var soundCount: Int
	var currentSound: Sound?
	var pack: String

	// Precondition: Warning/Relief sound files are equal in number!
	init(_ pack: String, numberOfSounds soundCount: Int)  {
		
		self.soundCount = soundCount
		self.pack = pack
		
		// Load all warning sounds
		let warningSoundURLS = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: "Sounds/" + pack + "/Warnings", localization: nil)!
		let reliefSoundURLS  = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: "Sounds/" + pack + "/Relief", localization: nil)!
		
		guard warningSoundURLS.count >= soundCount else {
			let message = "Unable to load all warning sound files for pack \(pack). Only \(warningSoundURLS.count)/\(soundCount) found."
			print(message)
			fatalError(message)
		}
		
		guard reliefSoundURLS.count >= soundCount else {
			let message = "Unable to load all relief sound files for pack \(pack). Only \(reliefSoundURLS.count)/\(soundCount) found."
			print(message)
			fatalError(message)
		}
		
		// Instantiate sounds
		for i in 0..<soundCount {
			warningSounds.append(Sound(url: warningSoundURLS[i])!)
			reliefSounds.append(Sound(url: reliefSoundURLS[i])!)
		}
		
	}
	
	
	// Selects a random warning sound to play
	func playWarningSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		currentSound = warningSounds[randomIndex]
		currentSound!.play()
	}
	
	// Selects a random relief sound to play
	func playReliefSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		currentSound = reliefSounds[randomIndex]
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
	}
}
