//
//  ZRHomeViewCell.m
//  shushu
//
//  Created by Apple on 16/6/30.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRHomeViewCell.h"
#import "UIImageView+WebCache.h"

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

- (void)setBookInfo:(ZRBookInfo *)bookInfo{
    _bookInfo = bookInfo;
//    NSLog(@"%@",_bookInfo.title);
    [_bookImg sd_setImageWithURL:[NSURL URLWithString:_bookInfo.bookPhotoPath] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    _bookName.text = _bookInfo.title;
    _bookStore.text = _bookInfo.shopName;
    _oriPrice.text = [NSString stringWithFormat:@"¥%@",_bookInfo.price];
    _nowPrice.text = [NSString stringWithFormat:@"¥%@",_bookInfo.sellingPrice];
}

//- (void)setDic:(NSDictionary *)dic{
//    [_bookImg sd_setImageWithURL:[NSURL URLWithString:dic[@"bookPhotoPath"]] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
//    _bookName.text = dic[@"title"];
//    _bookStore.text = dic[@"shopName"];
//    _oriPrice.text = [NSString stringWithFormat:@"¥%@",dic[@"price"]];
//    _nowPrice.text = [NSString stringWithFormat:@"¥%@",dic[@"sellingPrice"]];
//}
@end
