//
//  AlertSettingsViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 5/5/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit

class AlertSettingsViewController: UIViewController {

	@IBOutlet var alertSlider: UISlider!
	@IBOutlet var sliderValueLabel: UILabel!
	@IBAction func alertSliderValueIsDoneChanging(_ sender: UISlider) {
		
		print("Value: \(Int(sender.value).description)")
		
	}
	@IBAction func alertSliderValueIsChanging(_ sender: UISlider) {
		
		DispatchQueue.main.async {
			let text = Int(sender.value).description
			
			self.sliderValueLabel.attributedText = NSAttributedString(string: text)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

		// TODO: Move to constants file
		NotificationCenter.default.addObserver(self, selector: #selector(changeTint(_:)), name: NSNotification.Name(rawValue: "PageViewDidChange"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@objc func changeTint(_ notification: Notification) {
		
		guard notification.name.rawValue == "PageViewDidChange" else {
			print("Error: Invalid notification sent to changeTint() in AlertSettingsViewController.")
			return
		}
		
		if (notification.name.rawValue == "PageViewDidChange") {
			print("Changed!")
		} else {
			print("Wrong notification...")
		}
		
	}
	
}
