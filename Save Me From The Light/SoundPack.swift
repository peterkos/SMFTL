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
	
	private var warningSounds = [Sound]()
	private var reliefSounds = [Sound]()
	var soundCount: Int
	var pack: String {
		// When setting a new pack, the preference is saved.
		willSet {
			UserDefaults.standard.set(pack, forKey: "soundPack")
		}
	}
	static var currentSound: Sound?
	

	// Precondition: Warning/Relief sound files are equal in number!
	// Precondition: One or more sounds are available to load!
	// TODO: Error check loading sound names -- i.e., possibly 2/5 were named incorrectly?
	init(_ pack: String)  {
		
		self.pack = pack
		
		// Load all warning sounds in pack
		let warningSoundURLS = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: "Sounds/" + pack + "/Warnings", localization: nil)!
		let reliefSoundURLS  = Bundle.main.urls(forResourcesWithExtension: "wav", subdirectory: "Sounds/" + pack + "/Relief", localization: nil)!
		
		// Check to see if sounds were loaded properly
		guard warningSoundURLS.count == reliefSoundURLS.count else {
			let message = "Unequal count of Warning sounds (\(warningSoundURLS.count)) and Relief sounds (\(reliefSoundURLS.count))!"
			print(message)
			fatalError(message)
		}
		
		guard warningSoundURLS.count >= 0 else {
			let message = "Unable to load warning sound files for pack \(pack)."
			print(message)
			fatalError(message)
		}
		
		guard reliefSoundURLS.count >= 0 else {
			let message = "Unable to load all relief sound files for pack \(pack)."
			print(message)
			fatalError(message)
		}
		
		// They were -- assign the number...
		self.soundCount = warningSoundURLS.count
		
		// ... and instantiate the sounds!
		for i in 0..<soundCount {
			warningSounds.append(Sound(url: warningSoundURLS[i])!)
			reliefSounds.append(Sound(url: reliefSoundURLS[i])!)
		}
		
	}
	
	
	// Selects a random warning sound to play
	func playWarningSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		SoundPack.currentSound = warningSounds[randomIndex]
		SoundPack.currentSound!.play()
	}
	
	// Selects a random relief sound to play
	func playReliefSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount)))
		SoundPack.currentSound = reliefSounds[randomIndex]
		SoundPack.currentSound!.play()
	}
	
	// Selects either random or warning sound (random)
	func playSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(100)))
		randomIndex % 2 == 0 ? playReliefSound() : playWarningSound()
	}
	
	func randomWarningPath() -> String {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount))) + 1
		return "Sounds/" + pack + "/Warnings/" + pack + "Warning" + String(randomIndex) + ".wav"
	}
	
	func randomReliefPath() -> String {
		let randomIndex = Int(arc4random_uniform(UInt32(soundCount))) + 1
		return "Sounds/" + pack + "/Relief/" + pack + "Relief" + String(randomIndex) + ".wav"
	}
}
