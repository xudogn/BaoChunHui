//
//  oldNetworking.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "oldNetworking.h"

@implementation oldNetworking



+ (id)getRoomInfo:(NSString *)roomId completionHandler:(void (^)(scoreShopModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"%@", roomId];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([scoreShopModel parse:responseObj], error);
    }];
}













@end
