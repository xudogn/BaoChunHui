//
//  Data.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/13.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "Data.h"
#import "Clock.h"

@implementation Data
+ (NSArray *)clockData {
    Clock *a1 = [[Clock alloc] init];
    a1.titleStr = @"起床";
    a1.subStr = @"06:00";
    
    Clock *a2 = [[Clock alloc] init];
    a2.titleStr = @"吃饭";
    a2.subStr = @"06:30";
    
    Clock *a3 = [[Clock alloc] init];
    a3.titleStr = @"吃药";
    a3.subStr = @"07:30";
    return @[a1,a2,a3];
}
@end
