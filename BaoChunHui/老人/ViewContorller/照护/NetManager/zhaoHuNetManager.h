//
//  zhaoHuNetManager.h
//  BaoChunHui
//
//  Created by BCH on 2016/12/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseNetworking.h"
#import "proviceModel.h"

@interface zhaoHuNetManager : BaseNetworking
//获取地址信息
+ (id)getProviceInformation:(NSString *)infoString completionHandler:(void(^)(NSArray<proviceModel *> *model, NSError *error))completionHandler;

+ (id)getCityInformation:(NSString *)infoString completionHandler:(void(^)(NSArray<cityModel *> *model, NSError *error))completionHandler;

+ (id)getCountyInformation:(NSString *)inforString completionHandler:(void(^)(NSArray<townModel *> *model, NSError *error))completionHandler;
@end
