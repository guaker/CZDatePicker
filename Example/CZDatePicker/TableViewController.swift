//
//  TableViewController.swift
//  CZDatePicker_Example
//
//  Created by guaker on 2023/7/13.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import CZDatePicker

class TableViewController: UITableViewController {
    
    let dataArray = ["年", "年月", "年月日", "年月日时分"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }

    //MARK: UITableViewDataSource + UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let datePicker = CZDatePicker()
        datePicker.model = .date
        datePicker.modalPresentationStyle = .overFullScreen
        datePicker.modalTransitionStyle = .crossDissolve
        self.present(datePicker, animated: true, completion: nil)
    }

}
