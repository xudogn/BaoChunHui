//
//  gouWuCheView.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "gouWuCheView.h"
#import "GouWuCheViewController.h"

@implementation gouWuCheView


- (UIButton *)shoppingCardBtn{
    if (!_shoppingCardBtn) {
        _shoppingCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_shoppingCardBtn];
        [_shoppingCardBtn bk_addEventHandler:^(id sender) {
            
            !self.goToGWC ?: self.goToGWC();
            
        } forControlEvents:UIControlEventTouchUpInside];
        [_shoppingCardBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_shoppingCardBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.bottom.equalTo(0);
            make.width.equalTo(60);
        }];
    }
    return _shoppingCardBtn;
}



- (UIButton *)addBtn{
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_addBtn];
        [_addBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        _addBtn.tag = 110;
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        _addBtn.titleLabel.textColor = [UIColor whiteColor];                       //  背景色
        _addBtn.backgroundColor = [UIColor orangeColor];
        [_addBtn bk_addEventHandler:^(id sender) {
            !self.add_buy ?: self.add_buy(sender);
        } forControlEvents:UIControlEventTouchUpInside];
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            // frame
            make.left.equalTo(self.shoppingCardBtn.mas_right).equalTo(0);
            make.top.bottom.equalTo(0);
            make.width.equalTo(self.payBtn);
        }];
    }
    return _addBtn;
}


- (UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_payBtn];
        _payBtn.tag = 111;
        [_payBtn setTitle:@"立即购买" forState:UIControlStateNormal];
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:25];
        _payBtn.backgroundColor = [UIColor ShengHuoColor];
        _payBtn.titleLabel.textColor = [UIColor whiteColor];
        [_payBtn bk_addEventHandler:^(id sender) {
            !self.add_buy ?: self.add_buy(sender);
        } forControlEvents:UIControlEventTouchUpInside];
        [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //
            make.top.right.bottom.equalTo(0);
            make.left.equalTo(self.addBtn.mas_right).equalTo(1);
            
        }];
    }
    return _payBtn;
}




- (instancetype)init{
    self = [super init];
    if (self) {
        [self shoppingCardBtn];
        [self payBtn];
        [self addBtn];
        self.backgroundColor = [UIColor whiteColor];
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
