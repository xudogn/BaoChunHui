//
//  informationView.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/14.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "informationView.h"

@interface informationView ()

@end
@implementation informationView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self timeImage];
        [self lineView1];
        [self addressImage];
        [self addressLb];
        [self lineView2];
        [self icon];
        [self nameLb];
        [self lineView3];
        [self phoneImage];
        [self phoneLb];
        [self lineView4];
        [self btn1];
        [self btn2];
        [self tishiLb];
        [self priceLb];
        [self maskView];
    }
    return self;
}
- (UIImageView *)timeImage {
    if (!_timeImage) {
        _timeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_time"]];
        [self addSubview:_timeImage];
        [_timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
           // make.centerY.equalTo(self.dateTextField);
            make.top.equalTo(13);
            make.size.equalTo(24);
        }];
    }
    return _timeImage;
}
- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        [self addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.left.equalTo(12);
            make.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView1;
}
- (UIImageView *)addressImage {
    if (_addressLb == nil) {
        _addressImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_location"]];
        [self addSubview:_addressImage];
        [_addressImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView1.mas_top).equalTo(13);
            make.left.equalTo(12);
            make.size.equalTo(24);
        }];
    }
    return _addressImage;
}
- (UILabel *)addressLb {
    if (_addressLb == nil) {
        _addressLb = [[UILabel alloc] init];
        [self addSubview:_addressLb];
        [_addressLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_addressImage.mas_right).equalTo(10);
            make.width.equalTo(200);
            make.height.equalTo(30);
            make.centerY.equalTo(self.addressImage);
        }];
        _addressLb.text = @"地址";
        _addressLb.textColor = kRGBA(204, 204, 204, 1);
        _addressLb.font = [UIFont systemFontOfSize:25];
    }
    return _addressLb;
}
- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] init];
        [self addSubview:_lineView2];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(100);
            make.left.equalTo(12);
            make.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView2.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView2;
}
- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_mine"]];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView2.mas_bottom).equalTo(13);
            make.left.equalTo(12);
            make.size.equalTo(24);
        }];
    }
    return _icon;
}
- (UILabel *)nameLb {
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [self addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icon.mas_right).equalTo(10);
            make.width.equalTo(200);
            make.height.equalTo(30);
            make.centerY.equalTo(_icon);
        }];
        _nameLb.text = @"盖伦";
        _nameLb.textColor = kRGBA(26, 26, 26, 1);
        _nameLb.font = [UIFont systemFontOfSize:25];
    }
    return _nameLb;
}
- (UIView *)lineView3 {
    if (!_lineView3) {
        _lineView3 = [[UIView alloc] init];
        [self addSubview:_lineView3];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(150);
            make.left.equalTo(12);
            make.height.equalTo(1);
            make.right.equalTo(0);
        }];
        _lineView3.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView3;
}
- (UIImageView *)phoneImage {
    if (!_phoneImage) {
        _phoneImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_phone"]];
        [self addSubview:_phoneImage];
        [_phoneImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(13);
            make.size.equalTo(24);
        }];
    }
    return _phoneImage;
}
- (UILabel *)phoneLb {
    if (!_phoneLb) {
        _phoneLb = [UILabel new];
        [self addSubview:_phoneLb];
        [_phoneLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneImage.mas_right).equalTo(10);
            make.centerY.equalTo(_phoneImage);
            make.width.equalTo(200);
            make.height.equalTo(30);
        }];
        _phoneLb.font = [UIFont systemFontOfSize:25];
        _phoneLb.textColor = kRGBA(26, 26, 26, 1);
        _phoneLb.text = @"15201152903";
    }
    return _phoneLb;
}
- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [UIButton new];
        [self addSubview:_btn1];
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-12);
            make.centerY.equalTo(_timeImage);
            make.height.equalTo(25);
            make.width.equalTo(12);
        }];
        [_btn1 setImage:[UIImage imageNamed:@"con_more"] forState:UIControlStateNormal];
    }
    return _btn1;
}
- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [UIButton new];
        [self addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-12);
            make.centerY.equalTo(_addressLb);
            make.height.equalTo(25);
            make.width.equalTo(12);
        }];
        [_btn2 setImage:[UIImage imageNamed:@"con_more"] forState:UIControlStateNormal];
        [_btn2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}
//代理
- (void)push:(UIButton *)btn1 {
    [_delegate didClickedBtn:btn1];
}

- (UILabel *)tishiLb {
    if (!_tishiLb) {
        _tishiLb = [UILabel new];
        [self.maskView addSubview:_tishiLb];
        [_tishiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(62);
            make.height.equalTo(16);
        }];
        _tishiLb.font = [UIFont systemFontOfSize:20];
        _tishiLb.textColor = kRGBA(76, 76, 76, 1);
        _tishiLb.textAlignment = NSTextAlignmentCenter;
        _tishiLb.text = @"温馨提示：按月订购";
    }
    return _tishiLb;
}
- (UILabel *)priceLb {
    if (!_priceLb) {
        _priceLb = [UILabel new];
        [self.maskView addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_tishiLb.mas_bottom).equalTo(24);
            make.left.right.equalTo(0);
            make.height.equalTo(36);
        }];
        _priceLb.text = @"￥00.00";
        _priceLb.font = [UIFont systemFontOfSize:36];
        _priceLb.textColor = kRGBA(249, 110, 52, 1);
        _priceLb.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLb;
}
- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [UIView new];
        [self addSubview:_maskView];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lineView3.mas_bottom).equalTo(50);
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
        }];
        _maskView.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _maskView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
