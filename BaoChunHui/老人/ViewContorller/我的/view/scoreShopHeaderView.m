//
//  scoreShopHeaderView.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "scoreShopHeaderView.h"

@implementation scoreShopHeaderView




- (UIImageView *)bannerV{
    if (!_bannerV) {
        _bannerV = [[UIImageView alloc] init];
        [self addSubview:_bannerV];
        _bannerV.contentMode = UIViewContentModeScaleAspectFill;
        [_bannerV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(8);
            make.right.equalTo(-8);
            
        }];
    }
    return _bannerV;
}

- (UIImageView *)scoreV{
    if (!_scoreV) {
        _scoreV = [[UIImageView alloc] init];
        [self addSubview:_scoreV];
        _scoreV.contentMode = UIViewContentModeScaleAspectFill;
        [_scoreV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(50);
            make.top.equalTo(10);
            make.size.equalTo(CGSizeMake(30, 30));
            make.bottom.equalTo(10);
        }];
    }
    return _scoreV;
}

- (UIImageView *)recoredV{
    if (!_recoredV) {
        _recoredV = [UIImageView new];
        [self addSubview:_recoredV];
        _recoredV.contentMode = UIViewContentModeScaleAspectFill;
        [_recoredV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineV.mas_right).equalTo(50);
            make.top.equalTo(10);
            make.size.equalTo(CGSizeMake(30, 30));
            make.bottom.equalTo(10);
        }];
    }
    return _recoredV;
}

- (UILabel *)scoreLb{
    if (!_scoreLb) {
        _scoreLb = [UILabel new];
        [self addSubview:_scoreLb];
        _scoreLb.font = [UIFont systemFontOfSize:25];
        [_scoreLb sizeToFit];
        [_scoreLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scoreV.mas_right).equalTo(10);
            make.centerX.equalTo(self.scoreV);
            
        }];
    }
    return _scoreLb;
}

-(UIButton *)recoredBtn{
    if (!_recoredBtn) {
        _recoredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_recoredBtn];
        
        [_recoredBtn setTitle:@"兑换记录" forState:UIControlStateNormal];
        [_recoredBtn sizeToFit];
        [_recoredBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recoredV.mas_right).equalTo(10);
            make.centerX.equalTo(self.scoreV);
            make.size.equalTo(CGSizeMake(100, 30));
        }];
        [_recoredBtn addTarget:self action:@selector(recordVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _recoredBtn;
}
- (void)recordVC{
    // 点击跳转 兑换记录详情页
    
}



- (UIView *)lineV{
    if (!_lineV) {
        _lineV = [UIView new];
        _lineV.backgroundColor = [UIColor grayColor];
        [self addSubview:_lineV];
        [_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(2, 30));
            make.centerY.equalTo(self.bannerV);
            make.centerX.equalTo(self.scoreV);
        }];
    }
    return _lineV;
}

@end
