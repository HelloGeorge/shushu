//
//  ZRBookTip.h
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRBookTip : NSObject

//经营范围
@property (nonatomic,copy) NSString *area;
//费用
@property (nonatomic,copy) NSString *fee;
//库存
@property (nonatomic,assign) int count;
//卖家名称
@property (nonatomic,copy) NSString *shopName;
//售价
@property (nonatomic,copy) NSString *sellingPrice;
//送货类型
@property (nonatomic,copy) NSString *sendType;
//是否可约书
@property (nonatomic,copy) NSString *isCanMeet;

+ (instancetype)initWithDic:(NSDictionary *)dic;

@end
