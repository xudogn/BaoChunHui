//
//  oldNetManager.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseNetworking.h"
#import "FoodModel.h"

@interface oldNetManager : BaseNetworking

// 生活  点单网络请求
+ (id)getPage:(NSInteger)page completionHandler:(void(^)(FoodModel *model, NSError *error))completionHandler;






@end
