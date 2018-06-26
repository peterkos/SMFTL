//
//  VoicePack1ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class SoundPack8BitViewController: UIViewController, ASoundPackViewController {
	
	@IBOutlet var packNumber: UILabel!
	@IBOutlet var packName: UILabel!
	
	let pack: SoundPack = SoundPack("8Bit")
	var backgroundColor: UIColor?
	var tintColor: UIColor?
	var textColor: UIColor?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set the jubilant Yellow color (with tint)
		backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.2517471591, alpha: 1)
		tintColor = #colorLiteral(red: 1, green: 0.4235294118, blue: 0.4274509804, alpha: 1)
		textColor = UIColor.black
		
		self.view.backgroundColor = backgroundColor
		self.view.tintColor = tintColor
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

