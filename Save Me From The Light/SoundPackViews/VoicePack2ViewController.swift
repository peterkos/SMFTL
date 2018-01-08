//
//  VoicePack2ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class VoicePack2ViewController: UIViewController {
	
	let packTwo: SoundPack = SoundPack("PackTwo", numberOfSounds: 3)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		
		// Setup preference for voice pack to play
		UserDefaults.standard.set(2, forKey: "voicePackToUse")
		
		// Play a random sound to preview
		packTwo.playSound()
		
	}
	
	// When user slides out of view, stop playing the current preview
	override func viewWillDisappear(_ animated: Bool) {
		if let sound = packTwo.currentSound {
			sound.stop()
		}
	}
	
}
