//
//  HWDatePicker.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/7.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "HWDatePicker.h"


@interface HWDatePicker ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation HWDatePicker

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self backView];
        [self cancleBtn];
        [self choiceLb];
        [self sureBtn];
        //日期选择器
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.frame = CGRectMake(0, 116, kScreenW, 50);
        _datePicker.backgroundColor = [UIColor whiteColor];
        [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
        NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        _datePicker.locale = locale;
        NSDateFormatter *formatter_minDate = [[NSDateFormatter alloc] init];
        //formatter_minDate.dateStyle = kCFDateFormatterShortStyle;
        [formatter_minDate setDateFormat:@"yyyy-MM-dd"];
       // NSDate *minDate = [formatter_minDate dateFromString:@"2008-01-01"];
        formatter_minDate = nil;
        [_datePicker setMinimumDate:[NSDate date]];
        [self addSubview:_datePicker];
    }
    return self;
}
- (UIView *)backView {
    if (!_backView) {
        _backView = [UIView new];
        [self addSubview:_backView];
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(50);
        }];
        _backView.backgroundColor = kRGBA(245, 245, 245, 1);
        
    }
    return _backView;
}
- (UIButton *)cancleBtn {
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_cancleBtn];
        [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(10);
            make.width.equalTo(60);
            make.height.equalTo(30);
        }];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:kRGBA(249, 110, 52, 1) forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        [_cancleBtn addTarget:self action:@selector(dismissBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}
- (UILabel *)choiceLb {
    if (!_choiceLb) {
        _choiceLb = [UILabel new];
        [self addSubview:_choiceLb];
        [_choiceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(14);
            make.centerX.equalTo(0);
            make.width.equalTo(140);
            make.height.equalTo(22);
        }];
        _choiceLb.text = @"选择服务时间";
        _choiceLb.textColor = kRGBA(89, 89, 89, 1);
        _choiceLb.font = [UIFont systemFontOfSize:22];
    }
    return _choiceLb;
}
- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_sureBtn];
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-12);
            make.top.equalTo(10);
            make.width.equalTo(60);
            make.height.equalTo(30);
        }];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:kRGBA(249, 110, 52, 1) forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        [_sureBtn addTarget:self action:@selector(sureBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (void)dismissBtn {
    [self dismiss];
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerView:didClickedCancleBtnWithSelecDate:)]) {
        [_delegate datePickerView:self didClickSureBtnWithSelectDate:[self getNotString]];
    }
    
}
- (void)sureBtnOnClick
{
    [self dismiss];
    
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerView:didClickSureBtnWithSelectDate:)]) {
        [_delegate datePickerView:self didClickSureBtnWithSelectDate:[self getDateString]];
    }
}
- (NSString *)getNotString {
    return nil;
}
- (NSString *)getDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *date = [dateFormatter stringFromDate:[self.datePicker date]];
    
    return date;
}

- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenH - 300, kScreenW, 300);
    }];
    [self changColor];
}
- (void)changColor {
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerView:showCancleBtn:)]) {
        [_delegate datePickerView:self showCancleBtn:[self cancleBtn]];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(datePickerView:showSureBtn:)]) {
        [_delegate datePickerView:self showSureBtn:[self sureBtn]];
    }
}

- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, kScreenH, kScreenW, 236);
    }];
}

@end
