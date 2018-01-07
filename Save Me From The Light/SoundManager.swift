//
//  SoundManager.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/21/17.
//  Copyright © 2017 UW. All rights reserved.
//

import Foundation
import SwiftySound

struct PackOne {
	
	var warningSounds = [String: Sound]()
	var reliefSounds = [String: Sound]()
	
	init() {

		// Load all warning sounds
		let warningSoundURLS = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: "Sounds/PackOne/Warnings", localization: nil)!
		
		guard warningSoundURLS.count >= 3 else {
			let message = "Unable to load all warning sound files. Only \(warningSoundURLS.count)/3 found."
			print(message)
			fatalError(message)
		}
		
		warningSounds["tenPercent"]  = Sound(url: warningSoundURLS[0])
		warningSounds["fivePercent"] = Sound(url: warningSoundURLS[1])
		warningSounds["onePercent"]  = Sound(url: warningSoundURLS[2])
		
		
		// Load all relief sounds
		let reliefSoundURLS = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: "Sounds/PackOne/Relief", localization: nil)!
		
		guard reliefSoundURLS.count >= 3 else {
			let message = "Unable to load all warning sound files. Only \(reliefSoundURLS.count)/3 found."
			print(message)
			fatalError(message)
		}
		
		reliefSounds["tenPercent"]  = Sound(url: reliefSoundURLS[0])
		reliefSounds["fivePercent"] = Sound(url: reliefSoundURLS[1])
		reliefSounds["onePercent"]  = Sound(url: reliefSoundURLS[2])
		
	}
	
	// Selects a random warning sound to play
	func playWarningSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(warningSounds.count)))
		let randomKey = Array(warningSounds.keys)[randomIndex]
		
		warningSounds[randomKey]!.play()
	}
	
	// Selects a random relief sound to play
	func playReliefSound() {
		let randomIndex = Int(arc4random_uniform(UInt32(reliefSounds.count)))
		let randomKey = Array(reliefSounds.keys)[randomIndex]
		
		reliefSounds[randomKey]!.play()
	}
	
}
