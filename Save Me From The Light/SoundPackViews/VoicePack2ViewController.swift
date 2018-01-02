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

	override func viewDidLoad() {
		super.viewDidLoad()
		
		Sound.play(file: "packTwoDemo.wav")
		
		// Setup preference for voice pack to play
		UserDefaults.standard.set(2, forKey: "voicePackToUse")
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		// Initialize soundpack manager
		let firstPack = PackOne()
		firstPack.playWarningSound()
	}
	
	
}
