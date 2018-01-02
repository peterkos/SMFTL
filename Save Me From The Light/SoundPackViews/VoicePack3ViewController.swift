//
//  VoicePack3ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class VoicePack3ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		Sound.play(file: "packThreeDemo.wav")
		
		// Setup preference for voice pack to play
		UserDefaults.standard.set(3, forKey: "voicePackToUse")
		
	}
	
	
}
