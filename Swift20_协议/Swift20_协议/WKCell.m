//
//  WKCell.m
//  Swift20_协议
//
//  Created by sks on 16/7/27.
//  Copyright © 2016年 sks. All rights reserved.
//

#import "WKCell.h"
#import "Masonry.h"


@implementation WKCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *lab = [UILabel new];
        lab.text = @"郭华斌";
        lab.textColor = [UIColor blackColor];
        [self.contentView addSubview:lab];
        
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        
            make.centerY.mas_offset(0);
            make.size.mas_offset(CGSizeMake(100, 30));
            make.left.mas_offset(10);
            
        }];
    }
    return self;
}
@end
