//
//  ZRHomeViewCell.h
//  shushu
//
//  Created by Apple on 16/6/30.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRBookInfo.h"

@interface ZRHomeViewCell : UITableViewCell

@property (nonatomic,strong) ZRBookInfo *bookInfo;

//@property (nonatomic,strong) NSDictionary *dic;

+ (instancetype)homeViewCell;
@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookStore;
@property (weak, nonatomic) IBOutlet UILabel *oriPrice;
@property (weak, nonatomic) IBOutlet UILabel *nowPrice;

@end
