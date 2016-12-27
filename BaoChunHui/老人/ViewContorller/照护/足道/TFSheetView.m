//
//  TFSheetView.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/9.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "TFSheetView.h"

@interface TFSheetView()
{
    UIView *_contentView;
}
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIImageView *imageView2;
@property (nonatomic) UILabel *weixinLb;
@property (nonatomic) UILabel *zhifubaoLb;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIView *lineView3;
@property (nonatomic) UIButton *sureBtn1;
@property (nonatomic) UIButton *sureBtn2;
@property (nonatomic) UIButton *bottomBtn;
@property (nonatomic) UILabel *needLb;
@property (nonatomic) UILabel *priceLbb;
@end

@implementation TFSheetView

- (id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        [self initContent];
        [self lineView1];
        [self imageView1];
        [self weixinLb];
        [self lineView2];
        [self imageView2];
        [self zhifubaoLb];
        [self lineView3];
        [self sureBtn1];
        [self sureBtn2];
        [self bottomBtn];
        [self titleLb];
        [self needLb];
        [self priceLbb];
        
    }
    
    return self;
}

- (void)initContent
{
    self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil)
    {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenH * 0.3, kScreenW, kScreenH * 0.7)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
    }
}
#pragma mark - 弹出界面布局
- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [_contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.right.equalTo(0);
            make.height.equalTo(30);
        }];
        _titleLb.font = [UIFont systemFontOfSize:28];
        _titleLb.textColor = kRGBA(26, 26, 26, 1);
        _titleLb.text = @"付款详情";
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}
- (UILabel *)needLb {
    if (!_needLb) {
        _needLb = [UILabel new];
        [_contentView addSubview:_needLb];
        [_needLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(18);
            make.width.equalTo(100);
            make.height.equalTo(30);
        }];
        _needLb.font = [UIFont systemFontOfSize:28];
        _needLb.text = @"需付款";
        _needLb.textColor = kRGBA(26, 26, 26, 1);
    }
    return _needLb;
}
- (UILabel *)priceLbb {
    if (!_priceLbb) {
        _priceLbb = [UILabel new];
        [_contentView addSubview:_priceLbb];
        [_priceLbb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(18);
            make.width.equalTo(150);
            make.height.equalTo(30);
        }];
        _priceLbb.font = [UIFont systemFontOfSize:25];
        _priceLbb.text = @"25.00元";
        _priceLbb.textAlignment = NSTextAlignmentRight;
    }
    return _priceLbb;
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        [_contentView addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(50);
            make.height.equalTo(1);
        }];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView1;
}
- (UIImageView *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] init];
        [_contentView addSubview:_imageView1];
        [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(self.lineView1.mas_bottom).equalTo(12);
            make.size.equalTo(30);
        }];
        _imageView1.backgroundColor = [UIColor cyanColor];
    }
    return _imageView1;
}
- (UILabel *)weixinLb {
    if (!_weixinLb) {
        _weixinLb = [[UILabel alloc] init];
        [_contentView addSubview:_weixinLb];
        [_weixinLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView1.mas_right).equalTo(10);
            make.height.equalTo(_imageView1.mas_height);
            make.width.equalTo(200);
            make.top.equalTo(_lineView1.mas_bottom).equalTo(12);
        }];
        _weixinLb.text = @"微信支付";
        _weixinLb.font = [UIFont systemFontOfSize:28];
    }
    return _weixinLb;
}
- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] init];
        [_contentView addSubview:_lineView2];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.weixinLb.mas_bottom).equalTo(5);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView2.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView2;
}
- (UIImageView *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] init];
        [_contentView addSubview:_imageView2];
        [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(self.lineView2.mas_bottom).equalTo(12);
            make.size.equalTo(30);
        }];
        _imageView2.backgroundColor = [UIColor cyanColor];
    }
    return _imageView2;
}
- (UILabel *)zhifubaoLb {
    if (!_zhifubaoLb) {
        _zhifubaoLb = [[UILabel alloc] init];
        [_contentView addSubview:_zhifubaoLb];
        [_zhifubaoLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView2.mas_right).equalTo(10);
            make.height.equalTo(_imageView2.mas_height);
            make.width.equalTo(200);
            make.top.equalTo(_lineView2.mas_bottom).equalTo(12);
        }];
        _zhifubaoLb.text = @"支付宝";
        _zhifubaoLb.font = [UIFont systemFontOfSize:28];
    }
    return _zhifubaoLb;
}
- (UIView *)lineView3 {
    if (!_lineView3) {
        _lineView3 = [[UIView alloc] init];
        [_contentView addSubview:_lineView3];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.zhifubaoLb.mas_bottom).equalTo(5);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView3.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView3;
}
- (UIButton *)sureBtn1 {
    if (!_sureBtn1) {
        _sureBtn1 = [[UIButton alloc] init];
        [_contentView addSubview:_sureBtn1];
        [_sureBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imageView1);
            make.right.equalTo(-10);
            make.size.equalTo(20);
        }];
        _sureBtn1.layer.cornerRadius = 10;
        _sureBtn1.layer.masksToBounds = YES;
        _sureBtn1.layer.borderWidth = 2;
        _sureBtn1.layer.borderColor = [UIColor grayColor].CGColor;
        
        
        [_sureBtn1 addTarget:self action:@selector(backGroundColorChange:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn1;
}
- (UIButton *)sureBtn2 {
    if (!_sureBtn2) {
        _sureBtn2 = [[UIButton alloc] init];
        [_contentView addSubview:_sureBtn2];
        [_sureBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imageView2);
            make.right.equalTo(-10);
            make.size.equalTo(20);
        }];
        _sureBtn2.layer.cornerRadius = 10;
        _sureBtn2.layer.masksToBounds = YES;
        _sureBtn2.layer.borderWidth = 2;
        _sureBtn2.layer.borderColor = [UIColor grayColor].CGColor;
        [_sureBtn2 addTarget:self action:@selector(sureBtnChange:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn2;
}
- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_contentView addSubview:_bottomBtn];
        [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(-64);
            make.height.equalTo(49);
        }];
        [_bottomBtn setTitle:@"确认支付" forState:UIControlStateNormal];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:28];
        _bottomBtn.backgroundColor = kRGBA(249, 110, 52, 1);
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }
    return _bottomBtn;
}
- (void)changeBackGroundView {
    if (_delegate && [_delegate respondsToSelector:@selector(payOfPageBtnView:showBtnView:)]) {
        [_delegate payOfPageBtnView:self showBtnView:[self bottomBtn]];
    }
}
- (void)backGroundColorChange:(UIButton *)sender {

    sender.backgroundColor = [UIColor magentaColor];
    _sureBtn2.backgroundColor = [UIColor whiteColor];
   
}
- (void)sureBtnChange:(UIButton *)sender {
    sender.backgroundColor = [UIColor magentaColor];
    _sureBtn1.backgroundColor = [UIColor whiteColor];
    
    
}

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    [self changeBackGroundView];
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, kScreenH, kScreenW, kScreenH * 0.7)];
    //NSLog(@"%s dsfrg %@",__PRETTY_FUNCTION__,NSStringFromCGRect(_contentView.frame));
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(0, kScreenH * 0.3, kScreenW, kScreenH * 0.7)];
        //NSLog(@"%s ==dsfrg %@",__PRETTY_FUNCTION__,NSStringFromCGRect(_contentView.frame));
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView
{
    [_contentView setFrame:CGRectMake(0, kScreenH * 0.3, kScreenW, kScreenH * 0.7)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(0, kScreenH, kScreenW, 216)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}

@end
