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

@property (nonatomic) UIView *hudView;
@property (nonatomic, strong) NSTimer *timer;
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
        [self phoneLb1];
        [self starImg1];
        [self lineView2];
        [self imageView2];
        [self nameLb2];
        [self timeLb2];
        [self phoneLb2];
        [self starImg2];
        [self lineView3];
        [self imageView3];
        [self nameLb3];
        [self timeLb3];
        [self phoneLb3];
        [self starImg3];
        [self cancleBtn];
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
- (UIButton *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [[UIButton alloc] init];
        [_contentView addSubview:_imageView1];
        [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(90);
            make.left.equalTo(20);
            make.top.equalTo(_lineView1.mas_bottom).equalTo(20);
        }];
        _imageView1.backgroundColor = [UIColor cyanColor];
        [_imageView1 setImage:[UIImage imageNamed:@"waiter1"] forState:UIControlStateNormal];
        [_imageView1 addTarget:self action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
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
            make.width.mas_greaterThanOrEqualTo(50);
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
            make.right.equalTo(-5);
            make.left.equalTo( _nameLb1.mas_right).equalTo(35);
            make.top.equalTo(_nameLb1.mas_top);
            make.height.equalTo(28);
        }];
        _timeLb1.text = @"25小时";
        _timeLb1.font = [UIFont systemFontOfSize:28];
    }
    return _timeLb1;
}
- (UILabel *)phoneLb1 {
    if (!_phoneLb1) {
        _phoneLb1 = [UILabel new];
        [_contentView addSubview:_phoneLb1];
        [_phoneLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView1.mas_right).equalTo(10);
            make.right.equalTo(0);
            make.top.equalTo(_nameLb1.mas_bottom).equalTo(12);
            make.height.equalTo(28);
        }];
        _phoneLb1.text = @"15811228989";
        _phoneLb1.font = [UIFont systemFontOfSize:28];
    }
    return _phoneLb1;
}

- (UIImageView *)starImg1 {
    if (!_starImg1) {
        _starImg1 = [UIImageView new];
        [_contentView addSubview:_starImg1];
        [_starImg1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneLb1.mas_left);
            make.width.mas_greaterThanOrEqualTo(20);
            make.top.equalTo(_phoneLb1.mas_bottom).equalTo(12);
            make.height.equalTo(20);
        }];
        _starImg1.image = [UIImage imageNamed:@"starImg1"];
    }
    return _starImg1;
}

- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [UIView new];
        [_contentView addSubview:_lineView2];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView1.mas_bottom).equalTo(20);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView2.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView2;
}

- (UIButton *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [UIButton new];
        [_contentView addSubview:_imageView2];
        [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(90);
            make.left.equalTo(20);
            make.top.equalTo(_lineView2.mas_bottom).equalTo(20);
        }];
        [_imageView2 setImage:[UIImage imageNamed:@"waiter1"] forState:UIControlStateNormal];
    }
    return _imageView2;
}
- (UILabel *)nameLb2 {
    if (!_nameLb2) {
        _nameLb2 = [UILabel new];
        [_contentView addSubview:_nameLb2];
        [_nameLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLb1.mas_left);
            make.top.equalTo(_imageView2.mas_top).equalTo(5);
            make.left.equalTo(_imageView2.mas_right).equalTo(10);
            make.width.mas_greaterThanOrEqualTo(50);
            make.height.equalTo(28);
        }];
        _nameLb2.text = @"张三";
        _nameLb2.font = [UIFont systemFontOfSize:28];
    }
    return _nameLb2;
}
- (UILabel *)timeLb2 {
    if (!_timeLb2) {
        _timeLb2 = [UILabel new];
        [_contentView addSubview:_timeLb2];
        [_timeLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.left.equalTo(_nameLb2.mas_right).equalTo(35);
            make.top.equalTo(_nameLb2.mas_top);
            make.height.equalTo(28);
        }];
        _timeLb2.text = @"35小时";
        _timeLb2.font = [UIFont systemFontOfSize:28];
    }
    return _timeLb2;
}
- (UILabel *)phoneLb2 {
    if (!_phoneLb2) {
        _phoneLb2 = [UILabel new];
        [_contentView addSubview:_phoneLb2];
        [_phoneLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView2.mas_right).equalTo(10);
            make.right.equalTo(0);
            make.top.equalTo(_nameLb2.mas_bottom).equalTo(12);
            make.height.equalTo(28);
        }];
        _phoneLb2.text = @"15236695420";
        _phoneLb2.font = [UIFont systemFontOfSize:28];
    }
    return _phoneLb2;
}
- (UIImageView *)starImg2 {
    if (!_starImg2) {
        _starImg2 = [UIImageView new];
        [_contentView addSubview:_starImg2];
        [_starImg2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneLb2.mas_left);
            make.width.mas_greaterThanOrEqualTo(20);
            make.top.equalTo(_phoneLb2.mas_bottom).equalTo(12);
            make.height.equalTo(20);
        }];
        _starImg2.image = [UIImage imageNamed:@"star2"];
    }
    return _starImg2;
}
- (UIView *)lineView3 {
    if (!_lineView3) {
        _lineView3 = [UIView new];
        [_contentView addSubview:_lineView3];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imageView2.mas_bottom).equalTo(20);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView3.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView3;
}
- (UIButton *)imageView3 {
    if (!_imageView3) {
        _imageView3 = [UIButton new];
        [_contentView addSubview:_imageView3];
        [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(90);
            make.left.equalTo(20);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(20);
        }];
        [_imageView3 setImage:[UIImage imageNamed:@"waiter1"] forState:UIControlStateNormal];
    }
    return _imageView3;
}
- (UILabel *)nameLb3 {
    if (!_nameLb3) {
        _nameLb3 = [UILabel new];
        [_contentView addSubview:_nameLb3];
        [_nameLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLb2.mas_left);
            make.top.equalTo(_imageView3.mas_top).equalTo(5);
            make.left.equalTo(_imageView3.mas_right).equalTo(10);
            make.width.mas_greaterThanOrEqualTo(50);
            make.height.equalTo(28);
        }];
        _nameLb3.text = @"李四";
        _nameLb3.font = [UIFont systemFontOfSize:28];
    }
    return _nameLb3;
}
- (UILabel *)timeLb3 {
    if (!_timeLb3) {
        _timeLb3 = [UILabel new];
        [_contentView addSubview:_timeLb3];
        [_timeLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.left.equalTo(_nameLb3.mas_right).equalTo(35);
            make.top.equalTo(_nameLb3.mas_top);
            make.height.equalTo(28);
        }];
        _timeLb3.text = @"55小时";
        _timeLb3.font = [UIFont systemFontOfSize:28];
    }
    return _timeLb2;
}
- (UILabel *)phoneLb3 {
    if (!_phoneLb3) {
        _phoneLb3 = [UILabel new];
        [_contentView addSubview:_phoneLb3];
        [_phoneLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView3.mas_right).equalTo(10);
            make.right.equalTo(0);
            make.top.equalTo(_nameLb3.mas_bottom).equalTo(12);
            make.height.equalTo(28);
        }];
        _phoneLb3.text = @"13829957260";
        _phoneLb3.font = [UIFont systemFontOfSize:28];
    }
    return _phoneLb3;
}
- (UIImageView *)starImg3 {
    if (!_starImg3) {
        _starImg3 = [UIImageView new];
        [_contentView addSubview:_starImg3];
        [_starImg3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_phoneLb3.mas_left);
            make.width.mas_greaterThanOrEqualTo(20);
            make.top.equalTo(_phoneLb3.mas_bottom).equalTo(12);
            make.height.equalTo(20);
        }];
        _starImg3.image = [UIImage imageNamed:@"starImg3"];
    }
    return _starImg3;
}
- (UIButton *)cancleBtn {
    if (!_cancleBtn) {
        _cancleBtn = [UIButton new];
        [_contentView addSubview:_cancleBtn];
        [_cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.right.equalTo(-5);
            make.size.equalTo(25);
        }];
        [_cancleBtn setImage:[UIImage imageNamed:@"cancle"] forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}
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
- (UIView *)hudView {
    if (!_hudView) {
        _hudView = [[UIView alloc] initWithFrame:CGRectMake(kScreenW*0.4, kScreenH*0.4, kScreenW * 0.2, kScreenH * 0.2)];
        _hudView.backgroundColor = kRGBA(235, 235, 235, 1);
    }
    return _hudView;
}
- (void)pushView:(UIButton *)sender {
    //[self dismiss:_contentView];
    [_delegate qiangDanView:self clicked:sender];

}
- (void)dismiss:(UIView *)view {

    [view addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
       _contentView.frame = CGRectMake(kScreenW, kScreenH, kScreenW * 0.84, kScreenH * 0.68);
    }];
//    [view addSubview:_hudView];
//    [UIView animateWithDuration:1 animations:^{
//        [_hudView showWarning:@"服务人已接单"];
//    }];
}

//- (void)alertView {
//    [self showWarning:@"服务人员已接单"];
//}



















@end
