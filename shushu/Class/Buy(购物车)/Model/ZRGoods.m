//
//  ZRGoods.m
//  shushu
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRGoods.h"

@implementation ZRGoods

+ (instancetype)goodsWithDic:(NSDictionary *)dic{
    ZRGoods *model = [[ZRGoods alloc] init];
    model.goodsImg = dic[@"goodsImg"];
    model.goodsDesc = dic[@"goodsDesc"];
    model.goodsKind = dic[@"goodsKind"];
    model.goodsPrice = [dic[@"goodsSell"] floatValue];
    model.goodsCount = [dic[@"goodsCount"] intValue];
    model.store = dic[@"store"];
    //初始为未选中状态
    model.isSel = NO;
    return model;
}

@end
