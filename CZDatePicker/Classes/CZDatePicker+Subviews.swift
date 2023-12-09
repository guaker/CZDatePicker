//
//  CZDatePicker+Subviews.swift
//  doctor
//
//  Created by guaker on 2022/10/26.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension CZDatePicker {
    
    /// 加载子视图
    func setupSubviews() {
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = VIEW_CORNER_RADIUS
        backgroundView.layer.masksToBounds = true
        backgroundView.backgroundColor = .white
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backgroundView)
        
        //判断类型
        switch self.model {
        case .time, .countDownTimer:
            //datePicker
            self.datePicker = UIDatePicker()
            if #available(iOS 13.4, *) {
                self.datePicker.preferredDatePickerStyle = .wheels
            }
            self.datePicker.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.addSubview(self.datePicker)
            
            //适配暗黑模式
            self.datePicker.setValue(colorTitle, forKeyPath: "textColor")
            self.datePicker.setValue(false, forKey: "highlightsToday")
        default:
            //pickerView
            self.pickerView = UIPickerView()
            self.pickerView.showsSelectionIndicator = true
            self.pickerView.delegate = self
            self.pickerView.dataSource = self
            self.pickerView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.addSubview(self.pickerView)
        }
        
        //分割线
        let line1View = UIView()
        line1View.backgroundColor = colorLine
        line1View.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(line1View)
        
        //取消
        let cancelButton = UIButton(type: .custom)
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(colorDetail, for: .normal)
        cancelButton.setBackgroundImage(UIImage.imageWithColor(color: .white), for: .normal)
        cancelButton.setBackgroundImage(UIImage.imageWithColor(color: colorCellSelected), for: .highlighted)
        cancelButton.addTarget(self, action: #selector(didBack), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(cancelButton)
        
        //分割线
        let line2View = UIView()
        line2View.backgroundColor = colorLine
        line2View.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(line2View)
        
        //确定按钮
        let confirmButton = UIButton(type: .custom)
        confirmButton.setTitle("确定", for: .normal)
        confirmButton.setTitleColor(colorTheme, for: .normal)
        confirmButton.setBackgroundImage(UIImage.imageWithColor(color: .white), for: .normal)
        confirmButton.setBackgroundImage(UIImage.imageWithColor(color: colorCellSelected), for: .highlighted)
        confirmButton.addTarget(self, action: #selector(didConfirm(_:)), for: .touchUpInside)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(confirmButton)
        
        //设置autoLayout
        let viewsDictionary: [String: UIView] = ["backgroundView": backgroundView,
                                                 "pickerView": self.pickerView ?? self.datePicker,
                                                 "line1View": line1View,
                                                 "cancelButton": cancelButton,
                                                 "line2View": line2View,
                                                 "confirmButton": confirmButton]
        
        let metrics = ["viewHeight": 400,
                       "buttonHeight": 44,
                       "lineSize": LINE_SIZE]
        
        //1横向 Horizontal
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-20-[backgroundView]-20-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        //1纵向 Vertical
        self.view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[backgroundView(viewHeight)]",
                options: [],
                metrics: metrics,
                views: viewsDictionary))
        
        self.view.addConstraint(
            NSLayoutConstraint(
                item: backgroundView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: self.view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0))
        
        //2横向 Horizontal
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[pickerView]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[line1View]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[cancelButton][line2View(lineSize)][confirmButton(cancelButton)]|",
                options: [],
                metrics: metrics,
                views: viewsDictionary))
        
        //2纵向 Vertical
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[pickerView][line1View(lineSize)][cancelButton(buttonHeight)]|",
                options: [],
                metrics: metrics,
                views: viewsDictionary))
        
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[line1View][line2View]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        backgroundView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[line1View][confirmButton]|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
    }
    
}
