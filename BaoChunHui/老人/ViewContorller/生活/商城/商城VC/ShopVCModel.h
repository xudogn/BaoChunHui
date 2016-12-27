//
//  ShopVCModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShopVCModel, BannerModel, SortModel, goodsModel, StandardModel, StandardDetailModel;

@interface ShopVCModel : NSObject

@property(nonatomic, strong) NSMutableArray<BannerModel *> *banner_arr;

@property(nonatomic, strong)  NSMutableArray<SortModel *> *sort_arr;

@property(nonatomic) BOOL has_more;


@end

@interface BannerModel : NSObject

@property(nonatomic, strong) NSString *banner_url;

@property(nonatomic, strong) NSString *icon_url;

@end


@interface SortModel : NSObject

@property(nonatomic, strong) NSString *sort_name;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *goods_arr;

@property(nonatomic) NSInteger sort_id;


@end

@interface goodsModel : NSObject

@property(nonatomic, strong) NSString *goods_name;

@property(nonatomic) NSInteger sort_id;

@property(nonatomic) NSInteger  goods_id;

@property(nonatomic) float goods_price;

@property(nonatomic, strong) NSString *shop_name;

@property(nonatomic) NSInteger shop_id;


@property(nonatomic) float goods_sold_count; // 月售额

@property(nonatomic) float goods_praise_rate;// 好评率

@property(nonatomic, strong) NSString *goods_url;


@property(nonatomic) NSInteger goods_sort;

@property(nonatomic, strong) NSArray<StandardModel *> *standard_arr;



@property(nonatomic) NSInteger goods_number;

- (float)getPirceOfGoodsModel;

@end

@interface StandardModel : NSObject

@property(nonatomic, strong) NSString *standard_name;


@property(nonatomic, strong) NSArray<StandardDetailModel *> *standard_detail_arr;

@property(nonatomic) NSInteger standard_id;

@property(nonatomic) NSInteger goods_id;

@property(nonatomic, strong) StandardDetailModel *selected_standard;



@end

@interface StandardDetailModel : NSObject

@property(nonatomic) NSInteger standard_detail_id;

@property(nonatomic, strong) NSString *standard_detail_name;

@property(nonatomic) float standard_detail_price;


@end












