//
//  ZRGroupHeaderView.h
//  shushu
//
//  Created by Apple on 16/6/25.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRGroupHeaderView : UITableViewHeaderFooterView

+ (instancetype)groupHeader:(UITableView *)tableview image:(NSString *)image text:(NSString *)text;
@end
