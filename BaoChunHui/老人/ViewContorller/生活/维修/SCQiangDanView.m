//
//  SCQiangDanView.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SCQiangDanView.h"

@interface SCQiangDanView ()
@property (nonatomic) UIView *contentView;

@end

@implementation SCQiangDanView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
        self.backgroundColor = kRGBA(0, 0, 0, 0.4);
        [self contentView];
        //[self initView];
        [self titleLb];
        [self lineView1];
        [self imageView1];
        [self nameLb1];
        [self timeLb1];
//        [self phoneLb1];
    }
    return self;
}
- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(300, 300, kScreenW * 0.84, kScreenH * 0.68)];
        [self addSubview:_contentView];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}
//- (void)initView {
//    self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
//    self.backgroundColor = kRGBA(0, 0, 0, 0.4);
//    self.userInteractionEnabled = YES;
//    if (_contentView == nil) {
//        _contentView.frame = CGRectMake(kScreenW * 0.08, kScreenH * 0.16, kScreenW * 0.84, kScreenH * 0.68);
//        _contentView.backgroundColor = [UIColor whiteColor];
//        [self addSubview:_contentView];
//    }
//}

#pragma mark - contentView布局
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [_contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(200);
            make.height.equalTo(30);
            make.top.equalTo(19);
            make.centerX.equalTo(_contentView).equalTo(0);
        }];
        _titleLb.text = @"抢单服务员";
        _titleLb.font = [UIFont systemFontOfSize:30];
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}
- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [UIView new];
        [_contentView addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(68);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView1;
}
- (UIImageView *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        [_contentView addSubview:_imageView1];
        [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(90);
            make.left.equalTo(20);
            make.top.equalTo(_lineView1.mas_bottom).equalTo(20);
        }];
        _imageView1.backgroundColor = [UIColor cyanColor];
    }
    return _imageView1;
}
- (UILabel *)nameLb1 {
    if (!_nameLb1) {
        _nameLb1 = [UILabel new];
        [_contentView addSubview:_nameLb1];
        [_nameLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imageView1.mas_top).equalTo(5);
            make.left.equalTo(_imageView1.mas_right).equalTo(10);
            make.width.mas_greaterThanOrEqualTo(90);
            make.height.equalTo(28);
        }];
        _nameLb1.text = @"王小强";
        _nameLb1.font = [UIFont systemFontOfSize:28];
        
    }
    return _nameLb1;
}
- (UILabel *)timeLb1 {
    if (!_timeLb1) {
        _timeLb1 = [UILabel new];
        [_contentView addSubview:_timeLb1];
        [_timeLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.left.equalTo(_nameLb1.mas_right).equalTo(35);
            make.top.equalTo(_nameLb1.mas_top);
            make.height.equalTo(28);
        }];
        _titleLb.text = @"25小时";
        _titleLb.font = [UIFont systemFontOfSize:28];
    }
    return _timeLb1;
}
//- (UILabel *)phoneLb1 {
//    if (!_phoneLb1) {
//        _phoneLb1 = [UILabel new];
//        [_contentView addSubview:_phoneLb1];
//        [_phoneLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_imageView1.mas_right).equalTo(10);
//            make.right.equalTo(0);
//            make.top.equalTo(_nameLb1.mas_bottom).equalTo(12);
//            make.height.equalTo(28);
//        }];
//        _phoneLb1.text = @"15811228989";
//        _phoneLb1.font = [UIFont systemFontOfSize:28];
//    }
//    return _phoneLb1;
//}

- (void)showView:(UIView *)view {
    if (!view) {
        return;
    }
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
        _contentView.frame = CGRectMake(kScreenW * 0.08, kScreenH * 0.16 - 66, kScreenW * 0.84, kScreenH * 0.68);
        
    }];
}






















@end
