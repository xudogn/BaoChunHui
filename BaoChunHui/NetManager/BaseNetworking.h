//
//  BaseNetworking.h
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetworking : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;


+ (id)GETHUanCun:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POSTHuanCun:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;



+ (id)GETToken:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POSTToken:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;




@end













