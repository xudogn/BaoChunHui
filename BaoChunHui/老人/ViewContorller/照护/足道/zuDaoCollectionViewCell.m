//
//  zuDaoCollectionViewCell.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/6.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "zuDaoCollectionViewCell.h"

@implementation zuDaoCollectionViewCell
- (UILabel *)typeLb {
    if (!_typeLb) {
        _typeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_typeLb];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(12);
            make.left.right.equalTo(0);
            
        }];
        _typeLb.font = [UIFont systemFontOfSize:28];
    }
    return _typeLb;
}
- (UILabel *)payLb {
    if (!_payLb) {
        _payLb = [[UILabel alloc] init];
        [self.contentView addSubview:_payLb];
        [_payLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(_typeLb.mas_bottom).equalTo(7);
            make.bottom.equalTo(-7);
        }];
        _payLb.font = [UIFont systemFontOfSize:25];
    }
    return _payLb;
}
- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [UIView new];
        [self addSubview:_maskView];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _maskView.backgroundColor = kRGBA(0, 0, 0, 0.3);
    }
    return _maskView;
}
@end
