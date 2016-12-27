//
//  scoreShopModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class scoreShopBannerModel, scoreShopGoodsModel;
@interface scoreShopModel : NSObject

@property(nonatomic, strong) scoreShopBannerModel *banner;

@property(nonatomic, strong) NSMutableArray<scoreShopGoodsModel *> *goods;

@property(nonatomic) BOOL more;

@end


@interface scoreShopBannerModel : NSObject

@property(nonatomic, strong) NSString *banner_url;

@property(nonatomic) NSInteger *totalscore;

@end


@interface scoreShopGoodsModel : NSObject

@property(nonatomic, strong) NSString *product_name;

@property(nonatomic) NSInteger product_score;

@property(nonatomic) NSInteger product_cash;

@property(nonatomic) NSInteger goods_id;

@property(nonatomic, strong) NSString *img_url;



@end




