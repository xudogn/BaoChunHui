//
//  oldNetManager.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "oldNetManager.h"

@implementation oldNetManager


//  生活， 点单
+(id)getPage:(NSInteger)page completionHandler:(void (^)(FoodModel *, NSError *))completionHandler{
    
    NSString *path = [NSString stringWithFormat:@"%ld", (long)page];
    return [BaseNetworking GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([FoodModel parse:responseObj], error);
    }];
}

@end
