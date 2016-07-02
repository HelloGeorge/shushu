//
//  ZRBookAllInfo.h
//  shushu
//
//  Created by Apple on 16/7/2.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZRBookAllInfo : NSObject

//书籍摘要
@property (nonatomic,copy) NSString *summary;
//书籍照片
@property (nonatomic,copy) NSString *bookPhotoPath;
//书籍作者
@property (nonatomic,copy) NSString *author;
//书籍名称
@property (nonatomic,copy) NSString *title;
//书籍ISBN
@property (nonatomic,copy) NSString *ISBN;
//书籍原价
@property (nonatomic,copy) NSString *price;
//书籍出版社
@property (nonatomic,copy) NSString *press;
//出版日期
@property (nonatomic,copy) NSString *publicationDate;



+ (instancetype)initWithDic:(NSDictionary *)dic;

@end
