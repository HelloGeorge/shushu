//
//  ZRBookAllInfo.m
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRBookAllInfo.h"
#import "ZRBookTip.h"

@implementation ZRBookAllInfo

+ (instancetype)initWithDic:(NSDictionary *)dic{
    ZRBookAllInfo *model = [[ZRBookAllInfo alloc] init];
    model.summary = dic[@"summary"];
    model.bookPhotoPath = dic[@"bookPhotoPath"];
    model.author = dic[@"author"];
    model.title = dic[@"title"];
    model.ISBN = dic[@"ISBN"];
    model.price = dic[@"price"];
    model.press = dic[@"press"];
    model.publicationDate = dic[@"publicationDate"];
    
    return model;
    
}

@end
