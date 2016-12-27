//
//  SubmitView.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/9.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SubmitView.h"

@implementation SubmitView


- (UILabel *)priceL{
    if (!_priceL) {
        _priceL = [[UILabel alloc] init];
        [self addSubview:_priceL];
        _priceL.textAlignment = NSTextAlignmentCenter;
        _priceL.textColor = [UIColor redColor];
        _priceL.backgroundColor = [UIColor whiteColor];
        
        _priceL.textColor = [UIColor ShengHuoColor];
        _priceL.font = [UIFont systemFontOfSize:28];
        [_priceL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.right.equalTo(self.payBtn.mas_left).equalTo(0);
        }];
        
    }
    
    return _priceL; 
}

- (UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_payBtn];
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        [_payBtn setTitle:@"立即支付" forState:UIControlStateNormal];
        _payBtn.backgroundColor = [UIColor ShengHuoColor];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(0);
            make.width.equalTo(180);
            
        }];
        [_payBtn bk_addEventHandler:^(id sender) {
            !self.payBtnClicked ?: self.payBtnClicked();
            //NSLog(@"支付按钮按下");
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        [self priceL];
        [self payBtn];
    }
    return self;
}













/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
