//
//  ZRBookTip.m
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBookTip.h"

@implementation ZRBookTip


+ (instancetype)initWithDic:(NSDictionary *)dic{
    ZRBookTip *model = [[ZRBookTip alloc] init];
    model.area = dic[@"area"];
    model.fee = dic[@"fee"];
    model.count = [dic[@"count"] intValue];
    model.shopName = dic[@"shopName"];
    model.sellingPrice = dic[@"sellingPrice"];
    model.sendType = dic[@"sendType"];
    model.isCanMeet = dic[@"isCanMeet"];
    return model;
}

@end
