//
//  ZRPersonalTableViewCell.h
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZRPersonalTableViewCell;
@protocol ZRPersonalTableViewCellDelegate <NSObject>

- (void)goStoreClick:(ZRPersonalTableViewCell *)cell;

@end

@interface ZRPersonalTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userRank;
@property (weak, nonatomic) IBOutlet UILabel *userShu;
@property (weak, nonatomic) IBOutlet UILabel *userExp;
- (IBAction)goStore:(id)sender;
- (IBAction)qianDao:(id)sender;

@property (nonatomic,strong) NSArray *person;

//代理是弱指针
@property (nonatomic,weak) id<ZRPersonalTableViewCellDelegate> delegate;


+ (instancetype)personalInfo;


@end
