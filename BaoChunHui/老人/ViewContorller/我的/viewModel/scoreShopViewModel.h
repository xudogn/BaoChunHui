//
//  scoreShopViewModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "scoreShopModel.h"
@interface scoreShopViewModel : NSObject

@property(nonatomic, strong) NSMutableArray<scoreShopGoodsModel *> *datalist;
@property(nonatomic) NSInteger page;

@property(nonatomic, strong) scoreShopBannerModel *banner;





// headerView
- (NSURL *)urlForBanner;
- (NSString *)scoreForScoreLb;



// goods Cell
- (NSString *)productNameAtindexpath:(NSInteger)indexpath;
- (NSString *)priceLbAtindexpath:(NSInteger)indexpath;
- (NSString *)priceCashAtindexpath:(NSInteger)indexpath;
- (NSURL *)urlOfImgVAtindexpath:(NSInteger)indexpath;






- (void)getPage:(NSInteger)page completionHandler:(void(^)(scoreShopModel *model, NSError *error))completionHandler;







@end
