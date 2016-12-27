//
//  bannerAdView.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class bannerAdView;
@protocol bannerAdViewDataSource <NSObject>

- (NSInteger)numberOfItemsInBannerView:(UIView *)bannerView;
- (NSURL *)iconUrlForItemInBannerView:(UIView *)bannerView atIndex:(NSInteger)index;


@end

@protocol bannerAdViewDelegate <NSObject>

- (void)bannerView:(UIView *)bannerView didSelectedAtIndex:(NSInteger)index;

@end

@interface bannerAdView : UIView

@property(nonatomic, strong) iCarousel *ic;

@property(nonatomic, strong) UIPageControl *pageC;

@property(nonatomic, weak) id<bannerAdViewDelegate> delegate;

@property(nonatomic, weak) id<bannerAdViewDataSource> dataSource;

@property(nonatomic, strong) NSTimer *timer;

- (void)reloadData;


@end
