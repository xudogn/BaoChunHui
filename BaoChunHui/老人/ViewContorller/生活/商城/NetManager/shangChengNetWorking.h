//
//  shangChengNetWorking.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseNetworking.h"






@interface shangChengNetWorking : BaseNetworking

// 商城VC 数据

+ (id)getPage:(NSInteger)page parameters:(NSDictionary *)parameters completionHandler:(void(^)(ShopVCModel *model, NSError *error))completionHandler;

//  分类 VC数据
+ (id)getFenLeiPage:(NSInteger)page parameters:(NSDictionary *)parameters completionHandler:(void(^)(NSArray<goodsModel *> *model, NSError *error))completionHandler;



























@end
