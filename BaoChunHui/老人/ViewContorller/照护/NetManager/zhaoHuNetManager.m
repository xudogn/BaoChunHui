//
//  zhaoHuNetManager.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "zhaoHuNetManager.h"

@implementation zhaoHuNetManager
+ (id)getProviceInformation:(NSString *)infoString completionHandler:(void (^)(NSArray<proviceModel *> *, NSError *))completionHandler {
    return [self GET:kChooseProvicePath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([proviceModel parse:responseObj], error);
    }];
}

+ (id)getCityInformation:(NSString *)infoString completionHandler:(void (^)(NSArray<cityModel *> *, NSError *))completionHandler {
    return [self GET:kChooseCityPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([proviceModel parse:responseObj], error);
    }];
}

+ (id)getCountyInformation:(NSString *)inforString completionHandler:(void (^)(NSArray<townModel *> *, NSError *))completionHandler {
    return [self GET:kChooseCountyPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([proviceModel parse:responseObj], error);
    }];
}
@end
