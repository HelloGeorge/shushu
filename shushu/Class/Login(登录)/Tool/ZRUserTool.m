//
//  ZRUserTool.m
//  shushu
//
//  Created by Apple on 16/7/5.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRUserTool.h"

#define ZRUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]


@implementation ZRUserTool

//将用户模型存储到沙盒中
+ (void)saveUser:(ZRUser *)user{
    
    //将获取到的用户信息保存到沙盒中
    //将其他数据类型存到沙盒中要用到这个类
    
    [NSKeyedArchiver archiveRootObject:user toFile:ZRUserPath];
}

//从沙盒获取用户模型
+ (ZRUser *)user{
    ZRUser *model = [NSKeyedUnarchiver unarchiveObjectWithFile:ZRUserPath];
    return model;
}

@end
