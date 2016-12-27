//
//  bannerAdView.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "bannerAdView.h"


@interface bannerAdView ()<iCarouselDataSource, iCarouselDelegate>

@end


@implementation bannerAdView


#pragma mark - iC delegate

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInBannerView:)]) {
        return [_dataSource numberOfItemsInBannerView:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view == nil) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:view.frame];
        imgV.tag = 100;
        [view addSubview:imgV];
    }
    UIImageView *imgV = [view viewWithTag:100];
    if ([_dataSource respondsToSelector:@selector(iconUrlForItemInBannerView:atIndex:)]) {
        
        [imgV setImageWithURL:[_dataSource iconUrlForItemInBannerView:self atIndex:index] placeholder:[UIImage imageNamed:@"IMG_0415"]];// placeHolder  image;
        ((UIImageView *)view).contentMode = UIViewContentModeScaleAspectFill;
    }else {
        imgV.image = [UIImage imageNamed:@"IMG_0415"];
    }
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageC.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([_delegate respondsToSelector:@selector(bannerView:didSelectedAtIndex:)]) {
        [_delegate bannerView:self didSelectedAtIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}



#pragma mark - method

-(void)reloadData{
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInBannerView:)]) {
        _pageC.numberOfPages = [_dataSource numberOfItemsInBannerView:self];
    }
    
    
    [_ic reloadData];
    
    [_timer invalidate];
    _timer = nil;
    
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

#pragma mark - 生命周期


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self ) {
        [self ic];
        [self pageC];
    }
    return self;
}

#pragma mark - 懒加载
-(iCarousel *)ic{
    if (!_ic) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
    }
    return _ic;
}

-(UIPageControl *)pageC{
    if (!_pageC) {
        _pageC = [[UIPageControl alloc] init];
        [self addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-8);
            make.centerX.equalTo(0);
        }];
    }
    return _pageC;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
