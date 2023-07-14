//
//  CZDatePicker+Delegate.swift
//  doctor
//
//  Created by guaker on 2022/10/26.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension CZDatePicker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - UIPickerViewDataSource + UIPickerViewDelegate
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return self.dataArray.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray[component].count
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let titleLabel = UILabel()
        titleLabel.font = font16pt
        titleLabel.text = self.dataArray[component][row] + self.units[component]
        titleLabel.textAlignment = .center
        return titleLabel
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch self.model {
        case .year:
            self.indexYear = row
        case .yearAndMonth:
            switch component {
            case 0:
                self.indexYear = row
                self.indexMonth = 0
                
                self.months = self.getMonths()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(1)
                pickerView.selectRow(0, inComponent: 1, animated: true)
            default:
                self.indexMonth = row
            }
        case .date:
            switch component {
            case 0:
                self.indexYear = row
                self.indexMonth = 0
                self.indexDay = 0
                
                self.months = self.getMonths()
                self.days = self.getDays()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(1)
                pickerView.reloadComponent(2)
                pickerView.selectRow(0, inComponent: 1, animated: true)
                pickerView.selectRow(0, inComponent: 2, animated: true)
            case 1:
                self.indexMonth = row
                self.indexDay = 0
                
                self.days = self.getDays()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(2)
                pickerView.selectRow(0, inComponent: 2, animated: true)
            default:
                self.indexDay = row
            }
        case .dateAndTime:
            switch component {
            case 0:
                self.indexYear = row
                self.indexMonth = 0
                self.indexDay = 0
                self.indexHour = 0
                self.indexMinute = 0
                
                self.months = self.getMonths()
                self.days = self.getDays()
                self.hours = self.getHours()
                self.minutes = self.getMinutes()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(1)
                pickerView.reloadComponent(2)
                pickerView.reloadComponent(3)
                pickerView.reloadComponent(4)
                pickerView.selectRow(0, inComponent: 1, animated: true)
                pickerView.selectRow(0, inComponent: 2, animated: true)
                pickerView.selectRow(0, inComponent: 3, animated: true)
                pickerView.selectRow(0, inComponent: 4, animated: true)
            case 1:
                self.indexMonth = row
                self.indexDay = 0
                self.indexHour = 0
                self.indexMinute = 0
                
                self.days = self.getDays()
                self.hours = self.getHours()
                self.minutes = self.getMinutes()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(2)
                pickerView.reloadComponent(3)
                pickerView.reloadComponent(4)
                pickerView.selectRow(0, inComponent: 2, animated: true)
                pickerView.selectRow(0, inComponent: 3, animated: true)
                pickerView.selectRow(0, inComponent: 4, animated: true)
            case 2:
                self.indexDay = row
                self.indexHour = 0
                self.indexMinute = 0
                
                self.hours = self.getHours()
                self.minutes = self.getMinutes()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(3)
                pickerView.reloadComponent(4)
                pickerView.selectRow(0, inComponent: 3, animated: true)
                pickerView.selectRow(0, inComponent: 4, animated: true)
            case 3:
                self.indexHour = row
                self.indexMinute = 0
                
                self.minutes = self.getMinutes()
                self.dataArray = self.getDataArray()
                
                pickerView.reloadComponent(4)
                pickerView.selectRow(0, inComponent: 4, animated: true)
            default:
                self.indexMinute = row
            }
        }
    }
    
}

