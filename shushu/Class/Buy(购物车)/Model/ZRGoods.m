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
    model.bookPhotoPath = dic[@"bookPhotoPath"];
    model.shopName = dic[@"shopName"];
    model.productId = [dic[@"productId"] intValue];
    model.productCount = [dic[@"productCount"] intValue];
    model.title = dic[@"title"];
    model.sellingPrice = [dic[@"sellingPrice"] floatValue];
    model.shopId = [dic[@"shopId"] intValue];
    model.ID = [dic[@"id"] intValue];
    //初始为未选中状态
    model.isSel = NO;
    return model;
}

@end
