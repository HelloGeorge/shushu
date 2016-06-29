//
//  ZROrderViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZROrderViewCell.h"

@implementation ZROrderViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)orderViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZROrderViewCell" owner:nil options:nil] firstObject];
}

+ (instancetype)addressViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZROrderViewCell" owner:nil options:nil] lastObject];
}

@end
