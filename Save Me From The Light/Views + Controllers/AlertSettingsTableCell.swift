//
//  AlertSettingsViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 5/5/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit

class AlertSettingsTableCell: UITableViewCell {

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
	
	override func layoutSubviews() {
		
		// TODO: Do this for each cell, and in add() method in main viewcontroller
		NotificationCenter.default.addObserver(self, selector: #selector(changeTint(_:)), name: NSNotification.Name(rawValue: "PageViewDidChange"), object: nil)
	}

	
	/*
	* I’d still like this to be REALTIME, but alas, this seems impossible.
	* Possible solution: each element (particularly the sliderValueLabel) samples the color
	* behind it to determine if it should be black or white?
	* Ideally, the status bar should update in realtime as well. */
	@objc func changeTint(_ notification: Notification) {
		
		guard notification.name.rawValue == "PageViewDidChange" else {
			print("Error: Invalid notification sent to changeTint() in AlertSettingsViewController.")
			return
		}
		
		// Format mirrors protocol: [tintColor, textColor]
		let colors: [UIColor] = notification.object as! [UIColor]
		alertSlider.minimumTrackTintColor = colors[0]
		sliderValueLabel.textColor = colors[1]
		
	}
	
}
