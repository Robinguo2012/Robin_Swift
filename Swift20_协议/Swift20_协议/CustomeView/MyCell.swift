//
//  MyCell.swift
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let lab = UILabel()
        lab.text = "从叶"
        self.contentView.addSubview(lab)

        lab.mas_makeConstraints( { (make) in
            make.centerY.mas_equalTo()(self.contentView).offset()(0)
            make.left.mas_equalTo()(self.contentView).offset()(10)
            make.height.mas_equalTo()(30)
            make.width.mas_equalTo()(100)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}