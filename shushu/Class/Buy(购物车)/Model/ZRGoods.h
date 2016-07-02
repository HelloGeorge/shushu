//
//  ZRGoods.h
//  shushu
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRGoods : NSObject

@property (nonatomic,copy) NSString *bookPhotoPath;
@property (nonatomic,copy) NSString *shopName;
@property (nonatomic,assign) int productId;
@property (nonatomic,assign) int productCount;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) float sellingPrice;
@property (nonatomic,assign) int shopId;
@property (nonatomic,assign) int ID;
@property (nonatomic,assign) BOOL isSel;

+ (instancetype)goodsWithDic:(NSDictionary *)dic;

@end
