//
//  ZRBuyHeaderView.m
//  shushu
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBuyHeaderView.h"
#import "ZRBuyViewCell.h"
#import "UIView+ZRExtension.h"

@interface ZRBuyHeaderView ()

//显示商店的按钮
@property (nonatomic,weak) UIButton *storeBtn;
//编辑删除的按钮
@property (nonatomic,weak) UIButton *editBtn;
@property (nonatomic,assign) NSInteger section;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,assign) BOOL isSel;

@end

@implementation ZRBuyHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //初始化商店按钮控件
        UIButton *btn1 = [[UIButton alloc] init];
        btn1.frame = CGRectMake(10, 5, 120, 30);
        self.storeBtn = btn1;
        //添加进入店铺的事件
        [btn1 addTarget:self action:@selector(goStore) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"store"] forState:UIControlStateNormal];
        btn1.titleLabel.font = [UIFont systemFontOfSize:13];
        btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:btn1];
        
        //初始化编辑删除的按钮控件
        UIButton *btn2 = [[UIButton alloc] init];
        btn2.frame = CGRectMake(350, 5, 50, 30);
        self.editBtn = btn2;
        [btn2 setTitle:@"编辑" forState:UIControlStateNormal];
        [btn2 setTitle:@"完成" forState:UIControlStateSelected];
        [btn2 addTarget:self action:@selector(edit) forControlEvents:UIControlEventTouchUpInside];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn2.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:btn2];
    }
    return self;
}

+ (instancetype)buyHeader:(UITableView *)tableView storeText:(NSString *)storeText section:(NSInteger)section{
    NSString *ID = @"buy";
    ZRBuyHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (view == nil) {
        view = [[ZRBuyHeaderView alloc] init];
    }
    [view.storeBtn setTitle:storeText forState:UIControlStateNormal];
    view.section = section;
    view.tableView = tableView;
    return view;
}

//进入店铺
- (void)goStore{
    NSLog(@"进入店铺"); 
}

//编辑
- (void)edit{
    NSIndexPath *idx = [NSIndexPath indexPathForRow:0 inSection:self.section];
    ZRBuyViewCell *cell = [self.tableView cellForRowAtIndexPath:idx];
    if (self.isSel) {
        cell.goodsView.x = 0;
        self.isSel = false;
    }else{
        cell.goodsView.x = -40;
        self.isSel = true;
    }
    cell.section = self.section;
    
}

@end
