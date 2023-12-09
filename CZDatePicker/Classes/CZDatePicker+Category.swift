//
//  CZDatePicker+Category.swift
//  doctor
//
//  Created by guaker on 2022/10/26.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension CZDatePicker {
    
    /// 处理数据
    func processData() {
        switch model {
        case .year:
            self.processYear()
        case .yearAndMonth:
            self.processYearAndMonth()
        case .date, .week:
            self.processDate()
        case .dateAndTime:
            self.processDateAndTime()
        case .time:
            //系统datePicker类型
            self.datePicker.datePickerMode = .time
            //系统datePicker类型
        case .countDownTimer:
            self.datePicker.datePickerMode = .countDownTimer
        }
    }
    
    /// 年
    private func processYear() {
        let date = self.processValue("yyyy")
        let year = String(format: "%04d", self.getYear(date))
        
        //获取数据
        self.years = self.getYears()
        self.indexYear = self.years.firstIndex(of: year) ?? 0
        
        //设置展示数据
        self.dataArray = self.getDataArray()
        
        //设置下标
        self.pickerView.selectRow(self.indexYear, inComponent: 0, animated: true)
    }
    
    /// 年月
    private func processYearAndMonth() {
        let date = self.processValue("yyyy-MM")
        let year = String(format: "%04d", self.getYear(date))
        let month = String(format: "%02d", self.getMonth(date))
        
        //获取数据
        self.years = self.getYears()
        self.indexYear = self.years.firstIndex(of: year) ?? 0
        self.months = self.getMonths()
        self.indexMonth = self.months.firstIndex(of: month) ?? 0
        
        //设置展示数据
        self.dataArray = self.getDataArray()
        
        //设置下标
        self.pickerView.selectRow(self.indexYear, inComponent: 0, animated: true)
        self.pickerView.selectRow(self.indexMonth, inComponent: 1, animated: true)
    }
    
    /// 年月日
    private func processDate() {
        let date = self.processValue("yyyy-MM-dd")
        let year = String(format: "%04d", self.getYear(date))
        let month = String(format: "%02d", self.getMonth(date))
        let day = String(format: "%02d", self.getDay(date))
        
        //获取数据
        self.years = self.getYears()
        self.indexYear = self.years.firstIndex(of: year) ?? 0
        self.months = self.getMonths()
        self.indexMonth = self.months.firstIndex(of: month) ?? 0
        self.days = self.getDays()
        self.indexDay = self.days.firstIndex(of: day) ?? 0
        
        //设置展示数据
        self.dataArray = self.getDataArray()
        
        //设置下标
        self.pickerView.selectRow(self.indexYear, inComponent: 0, animated: true)
        self.pickerView.selectRow(self.indexMonth, inComponent: 1, animated: true)
        self.pickerView.selectRow(self.indexDay, inComponent: 2, animated: true)
    }
    
    /// 年月日时分
    private func processDateAndTime() {
        let date = self.processValue("yyyy-MM-dd HH:mm")
        let year = String(format: "%04d", self.getYear(date))
        let month = String(format: "%02d", self.getMonth(date))
        let day = String(format: "%02d", self.getDay(date))
        let hour = String(format: "%02d", self.getHour(date))
        let minute = String(format: "%02d", self.getMinute(date))
        
        //获取数据
        self.years = self.getYears()
        self.indexYear = self.years.firstIndex(of: year) ?? 0
        self.months = self.getMonths()
        self.indexMonth = self.months.firstIndex(of: month) ?? 0
        self.days = self.getDays()
        self.indexDay = self.days.firstIndex(of: day) ?? 0
        self.hours = self.getHours()
        self.indexHour = self.hours.firstIndex(of: hour) ?? 0
        self.minutes = self.getMinutes()
        self.indexMinute = self.minutes.firstIndex(of: minute) ?? 0
        
        //设置展示数据
        self.dataArray = self.getDataArray()
        
        //设置下标
        self.pickerView.selectRow(self.indexYear, inComponent: 0, animated: true)
        self.pickerView.selectRow(self.indexMonth, inComponent: 1, animated: true)
        self.pickerView.selectRow(self.indexDay, inComponent: 2, animated: true)
        self.pickerView.selectRow(self.indexHour, inComponent: 3, animated: true)
        self.pickerView.selectRow(self.indexMinute, inComponent: 4, animated: true)
    }
    
    /// 处理值
    private func processValue(_ dateFormat: String) -> Date {
        var date = self.value?.date(dateFormat) ?? Date()
        self.minDate = self.min?.date(dateFormat) ?? "1900-01-01 00:00".date("yyyy-MM-dd HH:mm")
        self.maxDate = self.max?.date(dateFormat) ?? "2099-12-31 23:59".date("yyyy-MM-dd HH:mm")
        
        if date < self.minDate {
            date = self.minDate
        }
        
        if date > self.maxDate {
            date = self.maxDate
        }
        
        return date
    }
    
    /// 根据日期获取年
    func getYear(_ date: Date) -> Int {
        return NSCalendar.current.component(.year, from: date)
    }
    
    /// 根据日期获取月
    func getMonth(_ date: Date) -> Int {
        return NSCalendar.current.component(.month, from: date)
    }
    
    /// 根据日期获取日
    func getDay(_ date: Date) -> Int {
        return NSCalendar.current.component(.day, from: date)
    }
    
    /// 根据日期获取时
    func getHour(_ date: Date) -> Int {
        return NSCalendar.current.component(.hour, from: date)
    }
    
    /// 根据日期获取分
    func getMinute(_ date: Date) -> Int {
        return NSCalendar.current.component(.minute, from: date)
    }
    
    /// 根据日期获取周
    func getWeekOfYear(_ date: Date) -> String {
        return "\(NSCalendar.current.component(.yearForWeekOfYear, from: date))第\(NSCalendar.current.component(.weekOfYear, from: date))周"
    }
    
    /// 年数据
    func getYears() -> [String] {
        let minYear = self.getYear(self.minDate)
        let maxYear = self.getYear(self.maxDate)
        
        var years = [String]()
        for i in minYear ... maxYear {
            years.append(String(i))
        }
        
        return years
    }
    
    /// 月数据
    func getMonths() -> [String] {
        let minYear = self.getYear(self.minDate)
        let maxYear = self.getYear(self.maxDate)
        let selectYear = Int(self.years[self.indexYear]) ?? 0
        
        var minMonth = 1
        var maxMonth = 12
        
        if selectYear == minYear {
            minMonth = self.getMonth(self.minDate)
        }
        
        if selectYear == maxYear {
            maxMonth = self.getMonth(self.maxDate)
        }
        
        var strs = [String]()
        for i in minMonth ... maxMonth {
            strs.append( String(format: "%02d", i))
        }
        
        return strs
    }
    
    /// 日数据
    func getDays() -> [String] {
        let minYear = self.getYear(self.minDate)
        let maxYear = self.getYear(self.maxDate)
        let selectYear = Int(self.years[self.indexYear]) ?? 0
        
        let minMonth = self.getMonth(self.minDate)
        let maxMonth = self.getMonth(self.maxDate)
        let selectMonth = Int(self.months[self.indexMonth]) ?? 0
        
        var minDay = 1
        var maxDay = self.getDayNumber(selectYear, selectMonth)
        
        if selectYear == minYear, selectMonth == minMonth {
            minDay = self.getDay(self.minDate)
        }
        
        if selectYear == maxYear, selectMonth == maxMonth {
            maxDay = self.getDay(self.maxDate)
        }
        
        var strs = [String]()
        for i in minDay ... maxDay {
            strs.append( String(format: "%02d", i))
        }
        
        return strs
    }
    
    /// 根据年月获取天数
    private func getDayNumber(_ year: Int, _ month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 4, 6, 9, 11:
            return 30
        default:
            if (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0) {
                return 29
            } else {
                return 28
            }
        }
    }
    
    /// 时数据
    func getHours() -> [String] {
        let minYear = self.getYear(self.minDate)
        let maxYear = self.getYear(self.maxDate)
        let selectYear = Int(self.years[self.indexYear]) ?? 0
        
        let minMonth = self.getMonth(self.minDate)
        let maxMonth = self.getMonth(self.maxDate)
        let selectMonth = Int(self.months[self.indexMonth]) ?? 0
        
        let minDay = self.getDay(self.minDate)
        let maxDay = self.getDay(self.maxDate)
        let selectDay = Int(self.days[self.indexDay]) ?? 0
        
        var minHour = 0
        var maxHour = 23
        
        if selectYear == minYear, selectMonth == minMonth, selectDay == minDay {
            minHour = self.getHour(self.minDate)
        }
        
        if selectYear == maxYear, selectMonth == maxMonth, selectDay == maxDay {
            maxHour = self.getHour(self.maxDate)
        }
        
        var strs = [String]()
        for i in minHour ... maxHour {
            strs.append( String(format: "%02d", i))
        }
        
        return strs
    }
    
    /// 分数据
    func getMinutes() -> [String] {
        let minYear = self.getYear(self.minDate)
        let maxYear = self.getYear(self.maxDate)
        let selectYear = Int(self.years[self.indexYear]) ?? 0
        
        let minMonth = self.getMonth(self.minDate)
        let maxMonth = self.getMonth(self.maxDate)
        let selectMonth = Int(self.months[self.indexMonth]) ?? 0
        
        let minDay = self.getDay(self.minDate)
        let maxDay = self.getDay(self.maxDate)
        let selectDay = Int(self.days[self.indexDay]) ?? 0
        
        let minHour = self.getHour(self.minDate)
        let maxHour = self.getHour(self.maxDate)
        let selectHour = Int(self.hours[self.indexHour]) ?? 0
        
        var minMinute = 0
        var maxMinute = 59
        
        if selectYear == minYear, selectMonth == minMonth, selectDay == minDay, selectHour == minHour {
            minMinute = self.getMinute(self.minDate)
        }
        
        if selectYear == maxYear, selectMonth == maxMonth, selectDay == maxDay, selectHour == maxHour {
            maxMinute = self.getMinute(self.maxDate)
        }
        
        var strs = [String]()
        for i in minMinute ... maxMinute {
            strs.append( String(format: "%02d", i))
        }
        
        return strs
    }
    
    //展示数据
    func getDataArray() -> [[String]] {
        switch self.model {
        case .year:
            return [self.years]
        case .yearAndMonth:
            return [self.years, self.months]
        case .date, .week:
            return [self.years, self.months, self.days]
        case .dateAndTime:
            return [self.years, self.months, self.days, self.hours, self.minutes]
        default:
            //系统datePicker类型
            return []
        }
    }
    
    /// 获取选中日期
    func getSelectDate() -> (Date?, String) {
        switch self.model {
        case .year:
            let year = self.years[self.indexYear]
            
            return (year.date("yyyy"), year)
        case .yearAndMonth:
            let year = self.years[self.indexYear]
            let month = self.months[self.indexMonth]
            let str = year + "-" + month
            
            return (str.date("yyyy-MM"), str)
        case .date:
            let year = self.years[self.indexYear]
            let month = self.months[self.indexMonth]
            let day = self.days[self.indexDay]
            let str = year + "-" + month + "-" + day
            
            return (str.date("yyyy-MM-dd"), str)
        case .dateAndTime:
            let year = self.years[self.indexYear]
            let month = self.months[self.indexMonth]
            let day = self.days[self.indexDay]
            let hour = self.hours[self.indexHour]
            let minute = self.minutes[self.indexMinute]
            let str = year + "-" + month + "-" + day + " " + hour + ":" + minute
            
            return (str.date("yyyy-MM-dd HH:mm"), str)
        case .week:
            let year = self.years[self.indexYear]
            let month = self.months[self.indexMonth]
            let day = self.days[self.indexDay]
            let str = year + "-" + month + "-" + day
            let date = str.date("yyyy-MM-dd") ?? Date()
            let week = self.getWeekOfYear(date)
            
            return (date, week)
        case .time:
            let date = self.datePicker.date
            let time = date.string("HH:mm")
            return (date, time)
        case .countDownTimer:
            //倒计时
            let second = self.datePicker.countDownDuration
            return (nil, String(second))
        }
    }
    
}
