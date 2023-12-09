//
//  TableViewCell.swift
//  doctor
//
//  Created by guaker on 2020/8/3.
//  Copyright © 2023 guaker. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var detailLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //标题
        self.titleLabel = UILabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.titleLabel)
        
        //详情
        self.detailLabel = UILabel()
        self.detailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.detailLabel)
        
        //设置autoLayout
        let viewsDictionary: [String: UIView] = ["titleLabel": self.titleLabel,
                                                 "detailLabel": self.detailLabel]
        
        //横向约束 Horizontal
        self.contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-15-[titleLabel]->=0-[detailLabel]-15-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        //纵向约束 Vertical
        self.contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-15-[titleLabel]-15-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
        
        self.contentView.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-15-[detailLabel]-15-|",
                options: [],
                metrics: nil,
                views: viewsDictionary))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
