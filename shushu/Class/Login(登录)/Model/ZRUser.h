//
//  ZRUser.h
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRUser : NSObject<NSCoding>

//所在学校
@property (nonatomic,copy) NSString *college;
//详细地址
@property (nonatomic,copy) NSString *detailAddress;
//电子邮件地址
@property (nonatomic,copy) NSString *email;
//用户唯一标识
@property (nonatomic,assign) int ID;
//专业
@property (nonatomic,copy) NSString *major;
//姓名
@property (nonatomic,copy) NSString *name;
//学院
@property (nonatomic,copy) NSString *school;
//店铺ID
@property (nonatomic,assign) int storeID;
//学生ID
@property (nonatomic,assign) int studentID;
//角色id
@property (nonatomic,assign) int roleId;
//电话号码
@property (nonatomic,copy) NSString *phoneNumber;
//头像
@property (nonatomic,copy) NSString *photo;

+ (instancetype)accountWithDic:(NSDictionary *)dic;

@end
