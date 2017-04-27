//
//  SCTanView.h
//  BaoChunHui
//
//  Created by BCH on 2017/1/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TianjiaAlertViewController.h"

@class SCTanView;
@protocol SCTanViewDelegate <NSObject>
@optional
- (void)didClickedBtnOfSCTanView:(SCTanView *)tanView tanViewBtn:(UIButton *)btn;

@end

@interface SCTanView : UIView
@property (nonatomic) UIView *contentView;

@property (nonatomic,weak) id<SCTanViewDelegate> delegate;
- (void)didClicked1:(UIButton *)sender;
- (void)showInView:(UIView *)view;
@property (nonatomic) NSString *titleString;
@property (nonatomic) TianjiaAlertViewController *tjVC;
- (UIButton *)danCiLb;
@end
