//
//  dingDanTableViewCell.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/7.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "dingDanTableViewCell.h"

@implementation dingDanTableViewCell
//确认订单页面
- (UILabel *)typeLb {
    if (!_typeLb) {
        _typeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_typeLb];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(10);
            make.height.equalTo(30);
            make.width.equalTo(120);
        }];
    }
    return _typeLb;
}
- (UILabel *)nameLb {
    if (!_nameLb) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeLb.mas_right);
            make.top.equalTo(10);
            make.height.equalTo(30);
            make.width.equalTo(150);
        }];
    }
    return _nameLb;
}
- (UILabel *)dateLb {
    if (!_dateLb) {
        _dateLb = [[UILabel alloc] init];
        [self.contentView addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.typeLb.mas_bottom);
            make.right.equalTo(0);
            make.height.equalTo(25);
        }];
    }
    return _dateLb;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.dateLb.mas_bottom).equalTo(10);
            make.left.equalTo(10);
            make.height.equalTo(2);
            make.right.equalTo(0);
        }];
        _lineView.backgroundColor = [UIColor grayColor];
    }
    return _lineView;
}
- (UILabel *)moneyLb {
    if (!_moneyLb) {
        _moneyLb = [[UILabel alloc] init];
        [self.contentView addSubview:_moneyLb];
        [_moneyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(self.lineView.mas_bottom).equalTo(5);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        _moneyLb.textAlignment = NSTextAlignmentRight;
        _moneyLb.font = [UIFont systemFontOfSize:28];
        _moneyLb.textColor = [UIColor redColor];
    }
    return _moneyLb;
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
