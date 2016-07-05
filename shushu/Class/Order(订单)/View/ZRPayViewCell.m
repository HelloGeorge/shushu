//
//  ZRPayViewCell.m
//  shushu
//
//  Created by Apple on 16/7/3.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRPayViewCell.h"

@implementation ZRPayViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.getByme.selected = YES;
    self.sellFee.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)payViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRPayViewCell" owner:nil options:nil] lastObject];
}
//卖家配送
- (IBAction)sell:(id)sender {
    //卖家配送按钮取反
    self.sendBySeller.selected = !self.sendBySeller.isSelected;
    //买家配送按钮取反
    self.getByme.selected = !self.getByme.isSelected;
    self.sellFee.hidden = NO;
    self.sellFee.text = @"配送费用: ¥0.8";
}

//自行取货
- (IBAction)bring:(id)sender {
    //卖家配送按钮取反
    self.sendBySeller.selected = !self.sendBySeller.isSelected;
    //买家配送按钮取反
    self.getByme.selected = !self.getByme.isSelected;
    self.sellFee.hidden = YES;
}
@end
