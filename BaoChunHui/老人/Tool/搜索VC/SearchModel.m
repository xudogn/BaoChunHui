//
//  SearchModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel


+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"datalist":[goodsModel class]
             };
}



@end
