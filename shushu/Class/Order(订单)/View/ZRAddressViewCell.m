//
//  ZRAddressViewCell.m
//  shushu
//
//  Created by Apple on 16/7/5.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRAddressViewCell.h"
#import "ZRUser.h"

@implementation ZRAddressViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)addressView{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRAddressViewCell" owner:nil options:nil] lastObject];
}

- (void)setModel:(ZRUser *)model{
    _model = model;
    self.userName.text = _model.name;
    self.userPhone.text = _model.phoneNumber;
    self.userAddress.text = _model.detailAddress;
}


@end
