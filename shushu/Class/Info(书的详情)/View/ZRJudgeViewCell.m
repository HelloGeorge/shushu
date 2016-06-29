//
//  ZRJudgeViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRJudgeViewCell.h"

@implementation ZRJudgeViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)judgeViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRJudgeViewCell" owner:nil options:nil] lastObject];
}

@end
