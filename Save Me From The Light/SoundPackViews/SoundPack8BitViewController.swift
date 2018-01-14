//
//  VoicePack1ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class SoundPack8BitViewController: UIViewController {

	let packOne: SoundPack = SoundPack("8Bit", numberOfSounds: 3)
	
    override func viewDidLoad() {
        super.viewDidLoad()	
    }
	
	override func viewDidAppear(_ animated: Bool) {
		
		// Setup preference for voice pack to play
		UserDefaults.standard.set("8Bit", forKey: "soundPack")
		
		// Play a random sound to preview
		packOne.playSound()

	}
	
	// When user slides out of view, stop playing the current preview
	override func viewWillDisappear(_ animated: Bool) {
		if let sound = packOne.currentSound {
			sound.stop()
		}
	}

}
