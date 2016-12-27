//
//  informationView.h
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/14.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWDatePicker.h"

@protocol informationViewDelegate <NSObject>

- (void)didClickedBtn:(UIButton *)btn;

@end

@interface informationView : UIView;
@property (nonatomic,weak) id<informationViewDelegate> delegate;
@property (nonatomic) UIImageView *timeImage;
@property (nonatomic) UIImageView *addressImage;
@property (nonatomic) UIImageView *icon;
@property (nonatomic) UIImageView *phoneImage;
@property (nonatomic) UILabel *timeLb;
@property (nonatomic) UILabel *addressLb;
@property (nonatomic) UILabel *nameLb;
@property (nonatomic) UILabel *phoneLb;
@property (nonatomic) UIButton *btn1;
@property (nonatomic) UIButton *btn2;
@property (nonatomic) UIButton *btn3;
@property (nonatomic) UIButton *btn4;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIView *lineView3;
@property (nonatomic) UIView *lineView4;
@property (nonatomic) UILabel *tishiLb;
@property (nonatomic) UILabel *priceLb;
@property (nonatomic) UIView *maskView;
@end
