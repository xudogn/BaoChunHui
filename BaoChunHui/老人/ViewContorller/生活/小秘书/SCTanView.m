//
//  SCTanView.m
//  BaoChunHui
//
//  Created by BCH on 2017/1/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SCTanView.h"

@interface SCTanView ()

@property (nonatomic) UIButton *danCiLb;
@property (nonatomic) UIButton *anRiLb;
@property (nonatomic) UIButton *anZhouLb;
@property (nonatomic) UIButton *anYueLb;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIView *lineView3;

@property (nonatomic) NSString *titleText;
@end

@implementation SCTanView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initContent];
        [self danCiLb];
        [self lineView1];
        [self anRiLb];
        [self lineView2];
        [self anZhouLb];
        [self lineView3];
        [self anYueLb];
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
        _contentView = [[UIView alloc]initWithFrame:CGRectMake((kScreenW - 181) / 2, 0, 181, 253)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
    }
}
- (void)showInView:(UIView *)view
{
    if (!view)
    {
        return;
    }
    //[self changeBackGroundView];
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake((kScreenW - 181) / 2, -253, 181, 253)];
    //NSLog(@"%s dsfrg %@",__PRETTY_FUNCTION__,NSStringFromCGRect(_contentView.frame));
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake((kScreenW - 181) / 2, 0, 181, 253)];
        //NSLog(@"%s ==dsfrg %@",__PRETTY_FUNCTION__,NSStringFromCGRect(_contentView.frame));
    } completion:nil];
   //[self didClicked1:self.danCiLb];
}
- (void)disMissView
{
    [_contentView setFrame:CGRectMake((kScreenW - 181) / 2, 0, 181, 253)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake((kScreenW - 181) / 2, -253, 181, 253)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
    
}
- (UIButton *)danCiLb {
    if (!_danCiLb) {
        _danCiLb = [UIButton new];
        [_contentView addSubview:_danCiLb];
        [_danCiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(63);
        }];
        [_danCiLb setTitle:@"单次提醒" forState:UIControlStateNormal];
        [_danCiLb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _danCiLb.titleLabel.font = [UIFont systemFontOfSize:25];
        _danCiLb.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [_danCiLb addTarget:self action:@selector(didClicked1:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _danCiLb;
}
- (void)didClicked1:(UIButton *)sender {
//    if (_delegate && [_delegate respondsToSelector:@selector(didClickedBtnOfSCTanView:tanViewBtn:)]) {
//        [_delegate didClickedBtnOfSCTanView:self tanViewBtn:[self danCiLb]];
//    }
    _titleString = sender.titleLabel.text;
    NSLog(@"+++--%@",_titleString);
//    self.tjVC.titleString1 = _titleString;
//    NSLog(@"%@",self.tjVC.titleString1);

}
- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [UIView new];
        [_contentView addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(63);
        }];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView1;
}
- (UIButton *)anRiLb {
    if (!_anRiLb) {
        _anRiLb = [UIButton new];
        [_contentView addSubview:_anRiLb];
        [_anRiLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(_lineView1.mas_bottom).equalTo(0);
            make.height.equalTo(63);
        }];
        [_anRiLb setTitle:@"按日提醒" forState:UIControlStateNormal];
        [_anRiLb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _anRiLb.titleLabel.font = [UIFont systemFontOfSize:25];
        _anRiLb.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _anRiLb;
}
- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [UIView new];
        [_contentView addSubview:_lineView2];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(126);
            make.height.equalTo(1);
        }];
        _lineView2.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView2;
}
- (UIButton *)anZhouLb {
    if (!_anZhouLb) {
        _anZhouLb = [UIButton new];
        [_contentView addSubview:_anZhouLb];
        [_anZhouLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(_lineView2.mas_bottom).equalTo(0);
            make.height.equalTo(63);
        }];
        [_anZhouLb setTitle:@"按周提醒" forState:UIControlStateNormal];
        [_anZhouLb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _anZhouLb.titleLabel.font = [UIFont systemFontOfSize:25];
        _anZhouLb.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _anZhouLb;
}
- (UIView *)lineView3 {
    if (!_lineView3) {
        _lineView3 = [UIView new];
        [_contentView addSubview:_lineView3];
        [_lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(189);
            make.height.equalTo(1);
        }];
        _lineView3.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView3;
}
- (UIButton *)anYueLb {
    if (!_anYueLb) {
        _anYueLb = [UIButton new];
        [_contentView addSubview:_anYueLb];
        [_anYueLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(_lineView3.mas_bottom).equalTo(0);
        }];
        [_anYueLb setTitle:@"按月提醒" forState:UIControlStateNormal];
        [_anYueLb setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _anYueLb.titleLabel.font = [UIFont systemFontOfSize:25];
        _anYueLb.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _anYueLb;
}





@end
