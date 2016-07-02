//
//  ZROrderViewCell.h
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRGoodInfo;

@interface ZROrderViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *sellPrice;
@property (weak, nonatomic) IBOutlet UILabel *bookCount;
@property (weak, nonatomic) IBOutlet UILabel *shopName;


@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
+ (instancetype)orderViewCell;

+ (instancetype)addressViewCell;

@property (nonatomic,strong) ZRGoodInfo *model;

@end
