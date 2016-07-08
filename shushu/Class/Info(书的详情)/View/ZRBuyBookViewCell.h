//
//  ZRBuyBookViewCell.h
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZRBookAllInfo;
@class ZRBookTip;
@class ZRBuyBookViewCell;

@protocol ZRBuyBookViewCellDelegate <NSObject>

- (void)plusBuyBtnClick:(ZRBuyBookViewCell *)cell;
- (void)showView;

@end

@interface ZRBuyBookViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UIImageView *bookImg;
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *sellerName;
@property (weak, nonatomic) IBOutlet UILabel *area;
@property (weak, nonatomic) IBOutlet UILabel *sendType;
@property (weak, nonatomic) IBOutlet UILabel *fee;
@property (weak, nonatomic) IBOutlet UILabel *isYue;
@property (weak, nonatomic) IBOutlet UILabel *cageCount;
@property (weak, nonatomic) IBOutlet UILabel *sellingPrice;

@property (weak, nonatomic) IBOutlet UILabel *countLbl;
- (IBAction)plusCount:(id)sender;
- (IBAction)minusCount:(id)sender;
- (IBAction)buyThing:(id)sender;

@property (nonatomic,strong) ZRBookAllInfo *model1;
@property (nonatomic,strong) ZRBookTip *model2;
@property (nonatomic,assign) int bookId;
+ (instancetype)buyBookCell;

@property (nonatomic,weak) id<ZRBuyBookViewCellDelegate> delegate;


@end
