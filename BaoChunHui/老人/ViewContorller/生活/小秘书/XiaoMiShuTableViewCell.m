//
//  XiaoMiShuTableViewCell.m
//  BaoChunHui
//
//  Created by BCH on 2017/1/13.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "XiaoMiShuTableViewCell.h"

@implementation XiaoMiShuTableViewCell

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.height.equalTo(28);
            make.top.equalTo(16);
            make.width.mas_greaterThanOrEqualTo(110);
        }];
        //_titleLb.text = @"起床";
        _titleLb.font = [UIFont systemFontOfSize:28];
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if (!_timeLb) {
        _timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
           // make.top.equalTo(12);
            make.right.equalTo(-12);
            make.width.mas_greaterThanOrEqualTo(80);
            make.height.equalTo(25);
            make.centerY.equalTo(0);
        }];
        //_timeLb.text = @"08:00";
        _timeLb.font = [UIFont systemFontOfSize:25];
        _timeLb.textColor = kRGBA(228, 83, 138, 1);
        _timeLb.textAlignment = NSTextAlignmentCenter;
        
    }
    return _timeLb;
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
