//
//  TableViewController.swift
//  CZDatePicker_Example
//
//  Created by guaker on 2023/7/13.
//  Copyright © 2023 guaker. All rights reserved.
//

import UIKit
import CZDatePicker

class TableViewController: UITableViewController {
    
    let dataArray = ["年", "年月", "年月日", "年月日时分", "周", "时分", "倒计时"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: "TableViewCell")
    }
    
    //MARK: UITableViewDataSource + UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = self.dataArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let datePicker = CZDatePicker()
        
        switch indexPath.row {
        case 0:
            datePicker.model = .year
        case 1:
            datePicker.model = .yearAndMonth
        case 2:
            datePicker.model = .date
        case 3:
            datePicker.model = .dateAndTime
        case 4:
            datePicker.model = .week
        case 5:
            datePicker.model = .time
        case 6:
            datePicker.model = .countDownTimer
        default:
            break
        }
        
        datePicker.modalPresentationStyle = .overFullScreen
        datePicker.modalTransitionStyle = .crossDissolve
        self.present(datePicker, animated: true, completion: nil)
        
        //回调
        datePicker.selectCallBack = { (date, dateStr) in
            print(date)
            print(dateStr)
            
            //获取cell
            if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
                cell.detailLabel.text = dateStr
            }
        }
    }
    
}
