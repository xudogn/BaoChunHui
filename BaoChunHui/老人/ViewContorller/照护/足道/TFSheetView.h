//
//  TFSheetView.h
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/9.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TFSheetView;
@protocol TFSheetViewDelegate <NSObject>
@optional
- (void)payOfPageBtnView:(TFSheetView *)btnView showBtnView:(UIButton *)btn;

@end

@interface TFSheetView : UIView
@property (nonatomic) id<TFSheetViewDelegate> delegate;
- (void)showInView:(UIView *)view;
@end
