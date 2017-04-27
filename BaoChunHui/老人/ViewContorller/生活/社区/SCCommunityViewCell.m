//
//  SCCommunityViewCell.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SCCommunityViewCell.h"

@implementation SCCommunityViewCell

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(12);
            make.right.equalTo(-12);
            make.height.equalTo(163);
        }];
        _imageView.backgroundColor = kRGBA(200, 200, 200, 1);
    }
    return _imageView;
}
- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        [self.imageView addSubview:_maskView];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(50);
        }];
        _maskView.backgroundColor = kRGBA(60, 60, 60, 1);
    }
    return _maskView;
}
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.maskView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(12);
            make.right.bottom.equalTo(-12);
        }];
    }
    //    _titleLb.text = @"健康饮食从你我做起";
    _titleLb.font = [UIFont systemFontOfSize:28];
    _titleLb.textColor = [UIColor whiteColor];
    return _titleLb;
}
- (UILabel *)readLb {
    if (!_readLb) {
        _readLb = [UILabel new];
        [self.contentView addSubview:_readLb];
        [_readLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(18);
            make.width.equalTo(120);
            make.top.equalTo(_maskView.mas_bottom).equalTo(16);
            make.height.equalTo(25);
        }];
        _readLb.text = @"阅读全文";
        _readLb.font = [UIFont systemFontOfSize:25];
    }
    return _readLb;
}
- (UIButton *)toInfoBtn {
    if (!_toInfoBtn) {
        _toInfoBtn = [UIButton new];
        [self.contentView addSubview:_toInfoBtn];
        [_toInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-12);
            make.width.equalTo(12);
            make.height.equalTo(25);
            make.centerY.equalTo(_readLb);
        }];
        [_toInfoBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    }
    return _toInfoBtn;
}
- (void)push {
    [_delegate didClickedBtn:_toInfoBtn];
}

@end
