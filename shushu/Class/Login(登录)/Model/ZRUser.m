//
//  ZRUser.m
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "ZRUser.h"

@implementation ZRUser

+ (instancetype)accountWithDic:(NSDictionary *)dic{
    ZRUser *model = [[ZRUser alloc] init];
    model.college = dic[@"college"];
    model.detailAddress = dic[@"detailAddress"];
    model.email = dic[@"email"];
    model.ID = [dic[@"id"] intValue];
    model.major = dic[@"major"];
    model.name = dic[@"name"];
    model.school = dic[@"school"];
    model.storeID = [dic[@"storeID"] intValue];
    model.studentID = [dic[@"studentID"] intValue];
    model.roleId = [dic[@"roleId"] intValue];
    model.phoneNumber = dic[@"phoneNumber"];
    model.photo = dic[@"photo"];
    return model;
}

//当一个对象要归档进沙盒中时就会调用这个方法
//目的：在这个方法中说明这个对象的那些属性要写进沙盒中
- (void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.college forKey:@"college"];
    [encoder encodeObject:self.detailAddress forKey:@"detailAddress"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d",self.ID] forKey:@"ID"];
    [encoder encodeObject:self.major forKey:@"major"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.school forKey:@"school"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d",self.storeID] forKey:@"storeID"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d",self.studentID] forKey:@"studentID"];
    [encoder encodeObject:[NSString stringWithFormat:@"%d",self.roleId] forKey:@"roleId"];
    [encoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [encoder encodeObject:self.photo forKey:@"photo"];
}

- (instancetype)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.college = [decoder decodeObjectForKey:@"college"];
        self.detailAddress = [decoder decodeObjectForKey:@"detailAddress"];
        self.email = [decoder decodeObjectForKey:@"email"];
        self.ID = [[decoder decodeObjectForKey:@"ID"] intValue];
        self.major = [decoder decodeObjectForKey:@"major"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.school = [decoder decodeObjectForKey:@"school"];
        self.storeID = [[decoder decodeObjectForKey:@"storeID"] intValue];
        self.studentID = [[decoder decodeObjectForKey:@"studentID"] intValue];
        self.roleId = [[decoder decodeObjectForKey:@"roleId"] intValue];
        self.phoneNumber = [decoder decodeObjectForKey:@"phoneNumber"];
        self.photo = [decoder decodeObjectForKey:@"photo"];
    }
    return self;
}





@end
