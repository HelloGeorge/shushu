//
//  ZRHomeViewCell.m
//  shushu
//
//  Created by Apple on 16/6/30.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRHomeViewCell.h"

@implementation ZRHomeViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)homeViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRHomeViewCell" owner:nil options:nil] lastObject];
}

@end
