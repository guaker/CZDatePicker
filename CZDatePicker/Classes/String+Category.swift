//
//  String+Category.swift
//  doctor
//
//  Created by apple on 2017/3/30.
//  Copyright © 2017年 digital. All rights reserved.
//

import Foundation

extension String {
    
    /// 字符串转时间
    /// - Parameter dateFormat: 日期格式
    func date(_ dateFormat: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = NSLocale.system
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = dateFormat
        
        return formatter.date(from: self)
    }
    
}
