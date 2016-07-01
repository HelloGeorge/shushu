//
//  ZRStoreViewCell.m
//  shushu
//
//  Created by Apple on 16/7/1.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRStoreViewCell.h"

@implementation ZRStoreViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//书籍上架
- (IBAction)upLoadBook:(id)sender {
    if ([self.delegate respondsToSelector:@selector(upLoadBookClick:)]) {
        [self.delegate upLoadBookClick:self];
    }
}

+ (instancetype)storeViewCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRStoreViewCell" owner:nil options:nil] firstObject];
}

+ (instancetype)bookStoreCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRStoreViewCell" owner:nil options:nil] lastObject];
}

@end
