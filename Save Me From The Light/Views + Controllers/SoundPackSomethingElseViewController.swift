//
//  VoicePack3ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 12/18/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound

class SoundPackSomethingElseViewController: UIViewController, ASoundPackViewController {
	
	@IBOutlet var packNumber: UILabel!
	@IBOutlet var packName: UILabel!
	
	// I don't have a third unique pack just yet, so just reusing ol' Grandalf.
	let pack: SoundPack = SoundPack("Grandalf")
	var backgroundColor: UIColor?
	var tintColor: UIColor?
	var textColor: UIColor?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set the scrumptious Blue color (with tint)
		backgroundColor = #colorLiteral(red: 0.4, green: 0.4, blue: 1, alpha: 1)
		tintColor = #colorLiteral(red: 1, green: 1, blue: 0.2517471591, alpha: 1)
		textColor = UIColor.white
		
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
