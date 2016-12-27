//
//  scoreShopModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "scoreShopModel.h"

@implementation scoreShopModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return nil;
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"banner":[scoreShopBannerModel class], @"goods":[scoreShopGoodsModel class]};
}
@end

@implementation scoreShopBannerModel



@end

@implementation scoreShopGoodsModel



@end
