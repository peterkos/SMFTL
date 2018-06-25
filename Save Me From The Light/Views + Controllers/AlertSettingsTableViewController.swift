//
//  AlertSettingsTableViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 6/22/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit


class AlertSettingsTableCell: UITableViewCell {
	
	@IBOutlet var percentageSlider: UISlider!
	
}

class AlertSettingsTableViewController: UITableViewController {
	
	
	var reminderData: [ReminderData] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Array has already been instantiated
		reminderData = UserDefaults.standard.array(forKey: "alertData") as! [ReminderData]
		print("reminderData: \(reminderData)")
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reminderData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Label", for: indexPath) as! AlertSettingsTableCell
		
		cell.percentageSlider.value = reminderData[indexPath.row].sliderNumber
		
		return cell
	}
	
	
	
}
