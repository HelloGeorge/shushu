//
//  ZRPersonalTableViewCell.m
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRPersonalTableViewCell.h"
#import "ZRUser.h"
#import "UIImageView+WebCache.h"

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

- (void)setUser:(ZRUser *)user{
    _user = user;
    if (_user.name) {
        [self.userIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.91shushu.com/resource/h5/upload/head/%@",_user.photo]] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }else{
        [self.userIcon sd_setImageWithURL:[NSURL URLWithString:@"http://www.91shushu.com/resource/h5/upload/head/u_img.jpg"] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    }
    self.userName.text = _user.name;
    self.userRank.text = @"铜牌会员";
    self.userExp.text = @"110";
    self.userShu.text = @"80";
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
