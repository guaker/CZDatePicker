//
//  CZDatePicker.swift
//  doctor
//
//  Created by guaker on 2022/10/26.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

public class CZDatePicker: UIViewController, UIGestureRecognizerDelegate {
    
    //参数
    public var selectCallBack:((Date, String) -> Void)? //闭包
    public var model: CZDatePicker.Model = .date
    public var value: String? //值
    public var min: String? //最小值
    public var max: String? //最大值
    
    //私有属性
    var datePicker: UIDatePicker!
    var pickerView: UIPickerView!
    var indexYear: Int = 0
    var indexMonth: Int = 0
    var indexDay: Int = 0
    var indexHour: Int = 0
    var indexMinute: Int = 0
    
    var minDate: Date!
    var maxDate: Date!
    
    var years: [String]! //年数据
    var months: [String]! //月数据
    var days: [String]! //日数据
    var hours: [String]! //时数据
    var minutes: [String]! //分数据
    var dataArray: [[String]]! //展示数据
    
    /// 单位
    lazy var units: [String] = {
        return ["年", "月", "日", "时", "分"]
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        //回收键盘手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(didBack))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        //UI
        self.setupSubviews()
        
        //处理数据
        self.processData()
    }
    
    //MARK: UIGestureRecognizerDelegate
    private func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
    
    /// 点击返回
    @objc func didBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /// 点击确定
    @objc func didConfirm(_ sender: UIButton) {
        let (date, str) = self.getSelectDate()
        self.selectCallBack?(date ?? Date(), str)
        self.dismiss(animated: true, completion: nil)
    }
    
}
