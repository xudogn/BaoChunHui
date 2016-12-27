//
//  shangChengNetWorking.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shangChengNetWorking.h"

@implementation shangChengNetWorking


+(id)getPage:(NSInteger)page parameters:(NSDictionary *)parameters completionHandler:(void (^)(ShopVCModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"%ld", page];
    return [BaseNetworking GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (error) {
            !completionHandler ?: completionHandler(nil, error);
        }else{
            !completionHandler ?: completionHandler([ShopVCModel parse:responseObj], nil);
        }
    }];
    
    
    
    
    
    
    return nil;
}

#warning url
+(id)getFenLeiPage:(NSInteger)page parameters:(NSDictionary *)parameters completionHandler:(void (^)(NSArray<goodsModel *> *, NSError *))completionHandler{
    
    NSString *path = [NSString stringWithFormat:@"%ld", page];
    return [BaseNetworking GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        if (error) {
            !completionHandler ?: completionHandler(nil, error);
        }else{
            !completionHandler ?: completionHandler([goodsModel parse:responseObj], nil);
        }
    }];
}






@end
