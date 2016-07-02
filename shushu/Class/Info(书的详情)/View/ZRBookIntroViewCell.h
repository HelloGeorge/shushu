//
//  ZRBookIntroViewCell.h
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRBookAllInfo;

@interface ZRBookIntroViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *isbnLbl;
@property (weak, nonatomic) IBOutlet UILabel *press;
@property (weak, nonatomic) IBOutlet UILabel *publicationDate;
@property (weak, nonatomic) IBOutlet UILabel *bookGena;

@property (weak, nonatomic) IBOutlet UILabel *author;
+ (instancetype)bookIntroCell;

@property (nonatomic,strong) ZRBookAllInfo *model;

@end
