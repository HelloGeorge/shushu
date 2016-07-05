//
//  ZRAddressViewCell.h
//  shushu
//
//  Created by Apple on 16/7/5.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRUser;

@interface ZRAddressViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userAddress;
@property (weak, nonatomic) IBOutlet UILabel *userPhone;

+ (instancetype)addressView;

@property (nonatomic,strong) ZRUser *model;
@end
