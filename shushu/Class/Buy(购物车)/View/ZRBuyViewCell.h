//
//  ZRBuyViewCell.h
//  shushu
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRBuyViewCell : UITableViewCell

- (IBAction)chooseBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *goodsImg;
@property (weak, nonatomic) IBOutlet UILabel *goodsDesc;
@property (weak, nonatomic) IBOutlet UILabel *goodsKind;
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodsCount;
@property (weak, nonatomic) IBOutlet UIView *goodsView;

@property (weak, nonatomic) IBOutlet UIButton *choose;

@property (nonatomic,strong) NSArray *goods;


+ (instancetype)buyViewCell;

@end
