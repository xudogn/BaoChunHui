//
//  searchTableViewCell.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/13.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "searchTableViewCell.h"

@implementation searchTableViewCell
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(16);
            make.right.equalTo(-12);
            make.height.equalTo(21);
        }];
        _titleLb.font = [UIFont systemFontOfSize:25];
        _titleLb.textColor = kRGBA(26, 26, 26, 1);
        
    }
    return _titleLb;
}
- (UILabel *)subLb {
    if (!_subLb) {
        _subLb = [UILabel new];
        [self.contentView addSubview:_subLb];
        [_subLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(_titleLb.mas_bottom).equalTo(9);
            make.right.equalTo(0);
            make.bottom.equalTo(-16);
        }];
        //_subLb.text = @"北京市海淀区";
        _subLb.font = [UIFont systemFontOfSize:20];
        _subLb.textColor = kRGBA(204, 204, 204, 1);
    }
    return _subLb;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
