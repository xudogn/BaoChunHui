//
//  CollectionViewCell.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/11.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (UILabel *)titleLb {
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.right.equalTo(0);
            make.height.equalTo(28);
        }];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:28];
    }
    return _titleLb;
}
//点击cell该变maskView得颜色
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
