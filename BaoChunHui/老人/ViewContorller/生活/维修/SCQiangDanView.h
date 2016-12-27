//
//  SCQiangDanView.h
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCQiangDanView : UIView
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UILabel *nameLb1;
@property (nonatomic) UILabel *timeLb1;
@property (nonatomic) UILabel *phoneLb1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIImageView *imageView2;
@property (nonatomic) UILabel *nameLb2;
@property (nonatomic) UILabel *timeLb2;
@property (nonatomic) UILabel *phoneLb2;
@property (nonatomic) UIView *lineView3;
@property (nonatomic) UIImageView *imageView3;
@property (nonatomic) UILabel *nameLb3;
@property (nonatomic) UILabel *timeLb3;
@property (nonatomic) UILabel *phoneLb3;

- (void)showView:(UIView *)view;

@end
