//
//  ZRShowView.m
//  shushu
//
//  Created by Apple on 16/7/8.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRShowView.h"
#import "UIView+ZRExtension.h"

@interface ZRShowView ()

@property (nonatomic,weak) UILabel *label;


@end

@implementation ZRShowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //创建控件
        UILabel *lbl = [[UILabel alloc] init];
        self.label = lbl;
        lbl.textColor = [UIColor whiteColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lbl];
    }
    return self;
}

+ (instancetype)showViewWithText:(NSString *)text{
    ZRShowView *view = [[ZRShowView alloc] init];
    view.backgroundColor = [UIColor grayColor];
    view.label.text = text;
    view.x = 214 / 2;
    view.y = [UIApplication sharedApplication].keyWindow.height - 150;
    view.height = 40;
    view.width = 200;
    view.label.frame = view.bounds;
    return view;
}


@end
