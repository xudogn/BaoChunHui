//
//  shangChengViewModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shangChengViewModel.h"
#import "shangChengNetWorking.h"


@implementation shangChengViewModel


- (NSURL *)urlOfIconAtIndexpath:(NSIndexPath *)indexpath{
    return self.sort_arr[indexpath.section].goods_arr[indexpath.row].goods_url.myURL;
}

- (NSString *)nameOfGoodsAtIndexpath:(NSIndexPath *)indexpath{
    return self.sort_arr[indexpath.section].goods_arr[indexpath.row].goods_name;
}

- (float)priceOfItemAtIndexpath:(NSIndexPath *)indexpath{
    return self.sort_arr[indexpath.section].goods_arr[indexpath.row].goods_price;
}

- (NSInteger)sort_idOfSectionAtIndexpath:( NSInteger)indexpath{
    return self.sort_arr[indexpath].sort_id;
}

- (NSInteger)numberOfBannerAdView{
    return self.bannerArr.count;
}

-(NSURL *)urlOfBannerAdViewAtIndex:(NSInteger)index{
    return self.bannerArr[index].icon_url.myURL;
}
- (NSURL *)urlOfBannerAdViewSlectedAtIndex:(NSInteger)index{
    return self.bannerArr[index].banner_url.myURL;
}
























- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    
    if (requestMode == RequestModeRefresh) {
        self.page = 0;
    }
    
    self.dataTask = [shangChengNetWorking getPage:self.page parameters:nil completionHandler:^(ShopVCModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.bannerArr removeAllObjects];
                [self.sort_arr removeAllObjects];
            }
            [self.bannerArr addObjectsFromArray:model.banner_arr];
            [self.sort_arr addObjectsFromArray:model.sort_arr];
            
        }else{
            completionHandler ?: completionHandler(error);
        }
    }];
    
}



- (NSMutableArray<SortModel *> *)sort_arr{
    if (!_sort_arr) {
        _sort_arr = [[NSMutableArray<SortModel *> alloc] init];
    }
    return _sort_arr;
}
- (NSMutableArray<BannerModel *> *)bannerArr{
    if (!_bannerArr) {
        _bannerArr = [[NSMutableArray<BannerModel *> alloc] init];
    }
    return _bannerArr;
}






@end
