//
//  ZRGroupHeaderView.m
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRGroupHeaderView.h"
#import "UIView+ZRExtension.h"

@interface ZRGroupHeaderView ()

@property (nonatomic,weak) UIImageView *imgView;
@property (nonatomic,weak) UILabel *label;

@end

@implementation ZRGroupHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    //调用父类的这个方法
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //初始化控件
        UIImageView *img = [[UIImageView alloc] init];
        
        img.x = 20;
        img.y = 10;
        img.width = 40;
        img.height = 40;
        self.imgView = img;
        UILabel *l = [[UILabel alloc] init];
        [self addSubview:img];
        
        l.x = 80;
        l.y = 15;
        l.width = 100;
        l.height = 30;
        self.label = l;
        [self addSubview:l];
    }
    return self;
}

+ (instancetype)groupHeader:(UITableView *)tableView image:(NSString *)image text:(NSString *)text{
    NSString *ID = @"header";
    ZRGroupHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (view == nil) {
        view = [[ZRGroupHeaderView alloc] initWithReuseIdentifier:ID];
    }
    view.imgView.image = [UIImage imageNamed:image];
    view.label.text = text;
    return view;
}

@end
