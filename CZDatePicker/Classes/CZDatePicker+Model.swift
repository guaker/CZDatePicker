//
//  CZDatePicker+Model.swift
//  doctor
//
//  Created by guaker on 2022/10/26.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension CZDatePicker {
    
    public enum Model: Int {
        //自定义pickerView
        case year           = 1
        case yearAndMonth   = 2
        case date           = 3 //使用自定义的
        case dateAndTime    = 4 //使用自定义的
        case week           = 5
        
        //系统datePicker
        case time           = 6
        case countDownTimer = 7 //倒计时（值：秒）
    }
    
}
