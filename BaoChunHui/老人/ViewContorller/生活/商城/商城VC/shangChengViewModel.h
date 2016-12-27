//
//  shangChengViewModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseViewModel.h"



@interface shangChengViewModel : BaseViewModel

@property(nonatomic) NSInteger page;

@property(nonatomic, strong) NSMutableArray<SortModel *> *sort_arr;
@property(nonatomic, strong) NSMutableArray<BannerModel *> *bannerArr;


- (NSURL *)urlOfIconAtIndexpath:(NSIndexPath *)indexpath;

- (NSString *)nameOfGoodsAtIndexpath:(NSIndexPath *)indexpath;

- (float)priceOfItemAtIndexpath:(NSIndexPath *)indexpath;

- (NSInteger)sort_idOfSectionAtIndexpath:(NSInteger )indexpath;


- (NSInteger)numberOfBannerAdView;

- (NSURL *)urlOfBannerAdViewAtIndex:(NSInteger)index;

- (NSURL *)urlOfBannerAdViewSlectedAtIndex:(NSInteger)index;
















@end
