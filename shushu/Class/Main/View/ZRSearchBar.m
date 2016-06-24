//
//  ZRSearchBar.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRSearchBar.h"
#import "UIView+ZRExtension.h"

@implementation ZRSearchBar

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"书名，作者，ISBN";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        //通过init来创建初始化绝大部分控件，控件都是没有尺寸的
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}

@end
