//
//  SCQiangDanView.h
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCQiangDanView;
@protocol SCQiangDanViewDelegate <NSObject>
- (void)qiangDanView:(SCQiangDanView *)qiangDanView clicked:(UIButton *)imageBtn;

@end
@interface SCQiangDanView : UIView
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIButton *imageView1;
@property (nonatomic) UILabel *nameLb1;
@property (nonatomic) UILabel *timeLb1;
@property (nonatomic) UILabel *phoneLb1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIButton *imageView2;
@property (nonatomic) UILabel *nameLb2;
@property (nonatomic) UILabel *timeLb2;
@property (nonatomic) UILabel *phoneLb2;
@property (nonatomic) UIView *lineView3;
@property (nonatomic) UIButton *imageView3;
@property (nonatomic) UILabel *nameLb3;
@property (nonatomic) UILabel *timeLb3;
@property (nonatomic) UILabel *phoneLb3;

@property (nonatomic) UIImageView *starImg1;
@property (nonatomic) UIImageView *starImg2;
@property (nonatomic) UIImageView *starImg3;

@property (nonatomic) UIButton *cancleBtn;
- (void)showView:(UIView *)view;
@property (nonatomic,weak) id<SCQiangDanViewDelegate> delegate;
@end
