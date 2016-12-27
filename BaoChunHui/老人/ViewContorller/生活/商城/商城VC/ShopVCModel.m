//
//  ShopVCModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "ShopVCModel.h"

@implementation ShopVCModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"banner_arr":[BannerModel class],
             @"sort_arr":[SortModel class]
             };
}

@end

@implementation SortModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"goods_arr":[goodsModel class]
             };
}

@end

@implementation goodsModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"standard_arr":[StandardModel class]
             };
}

//  获取商品最后价格
- (float)getPirceOfGoodsModel{
    float price = self.goods_price;
    for (int i = 0; i < self.standard_arr.count; i++) {
        float selctedPrice = self.standard_arr[i].selected_standard ? self.standard_arr[i].selected_standard.standard_detail_price : 0 ;//  如果 为空  则 = 0
         price = price + selctedPrice;
    }
    return price;
}

@end

@implementation BannerModel



@end

@implementation StandardModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"standard_detail_arr":[StandardDetailModel class]
             
             };
}


@end

@implementation StandardDetailModel



@end






