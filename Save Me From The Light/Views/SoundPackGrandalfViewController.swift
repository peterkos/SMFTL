
//
//  VoicePack2ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class SoundPackGrandalfViewController: UIViewController {
	
	let pack: SoundPack = SoundPack("Grandalf")
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		// Play a random sound to preview
		pack.playSound()
	}
	
	// When user slides out of view, stop playing the current preview
	override func viewWillDisappear(_ animated: Bool) {
		if let sound = SoundPack.currentSound {
			sound.stop()
		}
	}
	
}
