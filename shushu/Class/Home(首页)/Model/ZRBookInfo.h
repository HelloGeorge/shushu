//
//  ZRBookInfo.h
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRBookInfo : NSObject

@property (nonatomic,assign) int productId;
@property (nonatomic,copy) NSString *bookPhotoPath;
@property (nonatomic,copy) NSString *sellingPrice;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *shopName;
@property (nonatomic,copy) NSString *title;

//+ (instancetype)initWithDic:(NSDictionary *)dic;

@end
