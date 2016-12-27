//
//  oldNetworking.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseNetworking.h"

#import "scoreShopModel.h"







@interface oldNetworking : BaseNetworking

+ (id)getRoomInfo:(NSString *)roomId completionHandler:(void(^)(scoreShopModel *model, NSError *error))completionHandler;
















@end
