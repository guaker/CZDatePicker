//
//  Date+Category.swift
//  doctor
//
//  Created by apple on 2017/3/30.
//  Copyright © 2017年 digital. All rights reserved.
//

import Foundation

extension Date {
    
    /// 时间格式化
    /// - Parameter dateFormat: 日期格式
    func string(_ dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale.system
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = dateFormat
        
        return formatter.string(from: self)
    }
    
}
