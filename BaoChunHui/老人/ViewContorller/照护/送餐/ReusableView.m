//
//  ReusableView.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/10.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "ReusableView.h"

@implementation ReusableView
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.centerY.equalTo(0);
            make.width.equalTo(150);
            make.height.equalTo(35);
        }];
        _titleLb.font = [UIFont systemFontOfSize:30];
        _titleLb.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1.0];
    }
    return _titleLb;
}
@end
