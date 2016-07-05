//
//  ZRPayViewCell.h
//  shushu
//
//  Created by Apple on 16/7/3.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRPayViewCell : UITableViewCell
- (IBAction)sell:(id)sender;
- (IBAction)bring:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *sellFee;
//卖家配送
@property (weak, nonatomic) IBOutlet UIButton *sendBySeller;
//自行取货
@property (weak, nonatomic) IBOutlet UIButton *getByme;





+ (instancetype)payViewCell;

@end
