//
//  ZRGoodInfo.h
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRGoodInfo : NSObject

@property (nonatomic,assign) int ID;
@property (nonatomic,assign) int productId;
@property (nonatomic,copy) NSString *bookPhotoPath;
@property (nonatomic,assign) int productCount;
@property (nonatomic,assign) float sellingPrice;
@property (nonatomic,copy) NSString *shopName;
@property (nonatomic,copy) NSString *title;

+ (instancetype)initWithDic:(NSDictionary *)dic;
@end
