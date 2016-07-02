//
//  ZRGoodInfo.m
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRGoodInfo.h"

@implementation ZRGoodInfo


+ (instancetype)initWithDic:(NSDictionary *)dic{
    ZRGoodInfo *model = [[ZRGoodInfo alloc] init];
    model.bookPhotoPath = dic[@"bookPhotoPath"];
    model.ID = [dic[@"id"] intValue];
    model.productCount = [dic[@"productCount"] intValue];
    model.sellingPrice = [dic[@"sellingPrice"] floatValue];
    model.shopName = dic[@"shopName"];
    model.title = dic[@"title"];
    model.productId = [dic[@"productId"] intValue];
    return model;
}

@end
