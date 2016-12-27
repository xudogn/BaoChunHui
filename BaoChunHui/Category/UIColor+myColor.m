//
//  UIColor+myColor.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/12.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "UIColor+myColor.h"

@implementation UIColor (myColor)

+(UIColor *)ShengHuoColor{
    return [UIColor colorWithRed:251/255.0 green:78/255.0 blue:68/255.0 alpha:1];
}

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

+(UIColor *)blackColorNew{
    return [UIColor colorWithR:51 g:51 b:51 alpha:1];
}

+ (UIColor *)grayColorNew{
    return [UIColor colorWithR:245 g:245 b:245 alpha:1];
}

+ (UIColor *)ZhaoHuColor{
    return [UIColor colorWithR:48 g:206 b:185 alpha:1];
}


@end
