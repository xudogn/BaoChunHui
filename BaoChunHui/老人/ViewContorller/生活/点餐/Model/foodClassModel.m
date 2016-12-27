//
//  foodClassModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/30.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "foodClassModel.h"

@implementation foodClassModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"goods":[foodListModel class]
             };
}



@end

@implementation foodListModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"standard":[foodStandardModel class]};
}

@end

@implementation foodStandardModel



@end



