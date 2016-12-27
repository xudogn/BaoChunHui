//
//  HWDatePicker.h
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/7.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HWDatePicker;

@protocol HWDatePickerDelegate <NSObject>

/**
 *  HWDatePicker确定按钮点击代理事件
 *
 *  @param datePickerView HWDatePicker
 *  @param date           选中的日期
 */
- (void)datePickerView:(HWDatePicker *)datePickerView didClickSureBtnWithSelectDate:(NSString *)date;
//“取消按钮”代理
- (void)datePickerView:(HWDatePicker *)datePickerView didClickedCancleBtnWithSelecDate:(NSString *)date;
@optional
- (void)datePickerView:(HWDatePicker *)datePickerView showCancleBtn:(UIButton *)btn;
- (void)datePickerView:(HWDatePicker *)datePickerView showSureBtn:(UIButton *)btn;
@end

@interface HWDatePicker : UIView

@property (nonatomic, weak) id<HWDatePickerDelegate> delegate;
- (void)show;
- (void)dismiss;
//添加属性
@property (nonatomic) UIView *backView;
@property (nonatomic) UIButton *cancleBtn;
@property (nonatomic) UIButton *sureBtn;
@property (nonatomic) UILabel *choiceLb;
@end








