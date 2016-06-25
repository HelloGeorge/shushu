//
//  ZRTableViewCell.m
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRTableViewCell.h"
#import "UIView+ZRExtension.h"

@interface ZRTableViewCell()
- (IBAction)mijiButton;
- (IBAction)yueshuButton:(id)sender;
- (IBAction)zuixinButton:(id)sender;
- (IBAction)fengyunButton:(id)sender;
- (IBAction)jiaoyiButton:(id)sender;
- (IBAction)fenxiangButton:(id)sender;
- (IBAction)chongzhiButton:(id)sender;
- (IBAction)kaidianButton:(id)sender;

@end

@implementation ZRTableViewCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//加载最新发布的cell
+ (instancetype)newOut{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRTableViewCell" owner:nil options:nil] lastObject];
}

//加载首页里的8个按钮的xib
+ (instancetype)functionButton{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRTableViewCell" owner:nil options:nil] firstObject];
}

- (IBAction)mijiButton {
    NSLog(@"攻略秘籍");
}

- (IBAction)yueshuButton:(id)sender {
    NSLog(@"约书");
}

- (IBAction)zuixinButton:(id)sender {
    NSLog(@"最新发布");
}

- (IBAction)fengyunButton:(id)sender {
    NSLog(@"风云榜");
}

- (IBAction)jiaoyiButton:(id)sender {
    NSLog(@"交易厅");
}

- (IBAction)fenxiangButton:(id)sender {
    NSLog(@"好书分享");
}

- (IBAction)chongzhiButton:(id)sender {
    NSLog(@"充值");
}

- (IBAction)kaidianButton:(id)sender {
    NSLog(@"开店");
}
@end
