//
//  AlertSettingsTableViewController.swift
//  Save Me From The Light
//
//  Created by Peter Kos on 6/22/18.
//  Copyright © 2018 UW. All rights reserved.
//

import UIKit


class AlertSettingsTableViewController: UITableViewController {
	
	
	var alertData: [AlertData] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set background color
		self.view.backgroundColor = UIColor.clear
		
		
		// Subscribe to notifications
		NotificationCenter.default.addObserver(self, selector: #selector(updateAlertData(_:)), name: NSNotification.Name(rawValue: "UpdateAlertData"), object: nil)
		
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

		print("alertData from tableviewcontroller: \(alertData)")
		
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("count: \(alertData.count)")
		return alertData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		print("data is \(alertData)")
		let cell = tableView.dequeueReusableCell(withIdentifier: "alertDataCell", for: indexPath) as! AlertSettingsTableCell
		cell.alertSlider.value = alertData[indexPath.row].sliderNumber
		cell.backgroundColor = UIColor.clear
		
		return cell
	}
	
	@objc func updateAlertData(_ data: Notification) {
		let data = data.object as! AlertData
		alertData.append(data)
		self.tableView.reloadData()
	}
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		cell.backgroundColor = UIColor.clear
	}
	
	
	
}
