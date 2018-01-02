//
//  VoicePack1ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class VoicePack1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		Sound.play(file: "packOneDemo.wav")
		
		// Setup preference for voice pack to play
		UserDefaults.standard.set(1, forKey: "voicePackToUse")
		
    }


}
