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
		warningSounds["tenPercentWarning"] = Sound(url: URL(fileURLWithPath: Bundle.main.path(forResource: "CongratsChris", ofType: "wav")!))
		print(URL(fileURLWithPath: Bundle.main.path(forResource: "CongratsChris", ofType: "wav")!))
		warningSounds.first!.value.prepare()
	}
	
	func playWarningSound() {
//
//		// Play the first warning sound
//		warningSounds.first!.value.volume = 1.0
//		warningSounds.first!.value.play(numberOfLoops: 2) { (result) in
//			print(result)
//		}
		
//		Sound(url: URL(fileURLWithPath: Bundle.main.path(forResource: "CongratsChris", ofType: "wav")!)
		let soundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "CongratsChris", ofType: "wav")!)
		Sound(url: soundURL)!.play()
		
		// Can't get proper sound file URL
		// Works properly just using Sound().play however....
		
		print("asdf")
	}
	
}
