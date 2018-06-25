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
	
	
	var alertData: [AlertData] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Pull data from local store
		if let alertDataRead = UserDefaults.standard.object(forKey: "alertData") as? Data {
			do {
				alertData = try JSONDecoder().decode([AlertData].self, from: alertDataRead)
			} catch {
				print("Unable to decode from store in AlertSettingsTableViewController")
			}
		} else {
			print("Unable to read store in AlertSettingsTableViewController")
			return
		}
		
		print(alertData)
		
		
		print("alertData from tableviewcontroller: \(alertData)")
		
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return alertData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "alertDataCell", for: indexPath) as! AlertSettingsTableCell
		
		cell.percentageSlider.value = alertData[indexPath.row].sliderNumber
		
		return cell
	}
	
	
	
}
