//
//  ZRPersonalTableViewCell.m
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRPersonalTableViewCell.h"

@interface ZRPersonalTableViewCell ()

@end

@implementation ZRPersonalTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPerson:(NSArray *)person{
    _person = person;
    NSDictionary *p = _person[0];
    _userIcon.image = [UIImage imageNamed:p[@"userImg"]];
    _userName.text = p[@"userName"];
    _userRank.text = p[@"userRank"];
    _userShu.text = p[@"userShu"];
    _userExp.text = p[@"userExp"];
}

//进入店铺
- (IBAction)goStore:(id)sender {
    //只有当代理实现了这个方式时才调用
    if ([self.delegate respondsToSelector:@selector(goStoreClick:)]) {
        //代理调用这个方法
        [self.delegate goStoreClick:self];
    }
}

- (IBAction)qianDao:(id)sender {
}

+ (instancetype)personalInfo{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZRPersonalTableViewCell" owner:nil options:nil] firstObject];
}



@end
