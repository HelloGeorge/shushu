//
//  ZRUserTool.h
//  shushu
//
//  Created by Apple on 16/7/5.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZRUser;

@interface ZRUserTool : NSObject

//将传进来的模型写入到沙盒中
+ (void)saveUser:(ZRUser *)user;

+ (ZRUser *)user;

@end
