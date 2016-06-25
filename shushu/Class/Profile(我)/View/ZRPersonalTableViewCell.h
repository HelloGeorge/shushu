//
//  ZRPersonalTableViewCell.h
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRPersonalTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (nonatomic,assign) NSString *text;


+ (instancetype)personalInfo;

+ (instancetype)groupCell;

@end
