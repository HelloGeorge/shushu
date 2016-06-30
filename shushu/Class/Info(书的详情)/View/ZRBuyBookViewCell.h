//
//  ZRBuyBookViewCell.h
//  shushu
//
//  Created by Apple on 16/6/29.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRBuyBookViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *countLbl;
- (IBAction)plusCount:(id)sender;
- (IBAction)minusCount:(id)sender;
- (IBAction)buyThing:(id)sender;


+ (instancetype)buyBookCell;

@end
