//
//  ZRBuyHeaderView.h
//  shushu
//
//  Created by Apple on 16/6/26.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZRBuyHeaderView : UITableViewHeaderFooterView

+ (instancetype)buyHeader:(UITableView *)tableView storeText:(NSString *)storeText section:(NSInteger)section;

@end
