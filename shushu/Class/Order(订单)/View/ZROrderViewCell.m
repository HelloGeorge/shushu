//
//  ZROrderViewCell.m
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZROrderViewCell.h"
#import "ZRGoodInfo.h"
#import "UIImageView+WebCache.h"


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


- (void)setModel:(ZRGoodInfo *)model{
    _model = model;
//    NSLog(@"%@",_model.bookPhotoPath);
    [self.bookImg sd_setImageWithURL:[NSURL URLWithString:_model.bookPhotoPath] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    self.bookName.text = _model.title;
    self.sellPrice.text = [NSString stringWithFormat:@"%.1f",_model.sellingPrice];
    self.shopName.text = _model.shopName;
    self.bookCount.text = [NSString stringWithFormat:@"×%d",_model.productCount];
}














@end
