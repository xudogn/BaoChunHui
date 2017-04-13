//
//  jianKangJiGouCell.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/13.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "jianKangJiGouCell.h"

@implementation jianKangJiGouCell



- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.right.equalTo(self.imgV.mas_left).equalTo(-8);
        }];
        [_name sizeToFit];
        _name.numberOfLines = 0;
        _name.font = [UIFont systemFontOfSize:24];
    }
    return _name;
}

- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(60, 60));
        }];
        _imgV.layer.cornerRadius = 30;
        _imgV.layer.masksToBounds = YES;
    }
    return _imgV;
}

@end
