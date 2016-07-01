//
//  ZRStoreViewCell.h
//  shushu
//
//  Created by Apple on 16/7/1.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZRStoreViewCell;

@protocol ZRStoreViewCellDelegate <NSObject>

- (void)upLoadBookClick:(ZRStoreViewCell *)cell;

@end

@interface ZRStoreViewCell : UITableViewCell

@property (nonatomic,weak) id<ZRStoreViewCellDelegate> delegate;

//书籍上架
- (IBAction)upLoadBook:(id)sender;


+ (instancetype)storeViewCell;

+ (instancetype)bookStoreCell;

@end
