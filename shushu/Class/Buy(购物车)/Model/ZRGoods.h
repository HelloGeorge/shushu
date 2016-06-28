//
//  ZRGoods.h
//  shushu
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRGoods : NSObject

@property (nonatomic,assign) NSString *goodsDesc;
@property (nonatomic,assign) NSString *goodsKind;
@property (nonatomic,assign) float goodsPrice;
@property (nonatomic,assign) int goodsCount;
@property (nonatomic,assign) NSString *goodsImg;
@property (nonatomic,assign) NSString *store;
@property (nonatomic,assign) BOOL isSel;

+ (instancetype)goodsWithDic:(NSDictionary *)dic;

@end
