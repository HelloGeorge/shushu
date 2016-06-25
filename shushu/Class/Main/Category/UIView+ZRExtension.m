//
//  UIView+ZRExtension.m
//  shushu
//
//  Created by Apple on 16/6/24.
//  Copyright © 2016年 zhangrui. All rights reserved.
//

#import "UIView+ZRExtension.h"

@implementation UIView (ZRExtension)

- (void)setX:(CGFloat)x{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setHeight:(CGFloat)height{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX{
    //先将frame取出来
    CGPoint frame = self.center;
    frame.x = centerX;
    self.center = frame;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    //先将frame取出来
    CGPoint frame = self.center;
    frame.y = centerY;
    self.center = frame;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin{
    //先将frame取出来
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin{
    return self.frame.origin;
}

@end
