//
//  ZRPersonalTableViewCell.m
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRPersonalTableViewCell.h"

@interface ZRPersonalTableViewCell ()

@end

@implementation ZRPersonalTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)personalInfo{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRPersonalTableViewCell" owner:nil options:nil] firstObject];
}



@end
