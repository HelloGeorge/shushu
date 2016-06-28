//
//  ZRBuyViewCell.h
//  shushu
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZRGoods.h"
@class ZRBuyViewCell;

@protocol ZRBuyViewCellDelegate <NSObject>

- (void)deleteBtnClick:(ZRBuyViewCell *)cell;
- (void)chooseBtnClick:(ZRBuyViewCell *)cell;

@end

@interface ZRBuyViewCell : UITableViewCell

@property (nonatomic,weak) id<ZRBuyViewCellDelegate> delegate;


- (IBAction)chooseBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsDesc;
@property (weak, nonatomic) IBOutlet UILabel *goodsKind;
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodsCount;
@property (weak, nonatomic) IBOutlet UIView *goodsView;

@property (weak, nonatomic) IBOutlet UIButton *choose;
- (IBAction)deleteBtn:(id)sender;

@property (nonatomic,strong) ZRGoods *goods;

@property (nonatomic,assign) NSInteger section;


+ (instancetype)buyViewCell;

@end
