//
//  ZRMainNavigation.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRMainNavigation.h"

@interface ZRMainNavigation ()

@end

@implementation ZRMainNavigation

//只执行一次，创建的时候执行
+ (void)initialize{
    //设置整个项目所有item的样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //创建一个可变数组，存放字体的样式
    NSMutableDictionary *textAttri = [NSMutableDictionary dictionary];
    textAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttri[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    
    //设置item不可用时候的样式
    NSMutableDictionary *disableTextAttri = [NSMutableDictionary dictionary];
    disableTextAttri[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
    disableTextAttri[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:disableTextAttri forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
