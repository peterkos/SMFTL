//
//  ViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 11/17/17.
//  Copyright © 2017 UW. All rights reserved.
//

import UIKit
import SwiftySound


class ViewController: UIViewController {
	
	// Literally saving two words here
	private let userDeafults = UserDefaults.standard
	
	// OUTLETS for reading settings
	@IBOutlet var tenPercentWarningSetting: UISwitch!
	@IBOutlet var fivePercentWarningSetting: UISwitch!
	@IBOutlet var onePercentWarningSetting: UISwitch!
	
	
	// TODO: Move to Constants file
	// ACTIONS for setting data
	@IBAction func tenPercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "tenPercentWarning")
	}
	
	@IBAction func fivePercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "fivePercentWarning")
	}
	
	@IBAction func onePercentWarningSetting(_ sender: UISwitch) {
		userDeafults.set(sender.isOn, forKey: "onePercentWarning")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		userDeafults.synchronize()
		
		// Set switches on load
		tenPercentWarningSetting.isOn  = userDeafults.bool(forKey: "tenPercentWarning")
		fivePercentWarningSetting.isOn = userDeafults.bool(forKey: "fivePercentWarning")
		onePercentWarningSetting.isOn  = userDeafults.bool(forKey: "onePercentWarning")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		userDeafults.synchronize()
	}

}

