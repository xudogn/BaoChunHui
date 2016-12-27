//
//  weiXiuDingDanController.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "weiXiuDingDanController.h"
#import "TFSheetView.h"
#import "SCQiangDanView.h"

@interface weiXiuDingDanController ()<TFSheetViewDelegate>
@property (nonatomic) UIButton *jiageButton;
@property (nonatomic) UIButton *payButton;
@property (nonatomic) TFSheetView *tfSheetView;
@property (nonatomic) SCQiangDanView *qiangDanView;
@property (nonatomic) NSTimer *timer;
@end

@implementation weiXiuDingDanController

- (UIView *)myView {
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 288)];
        [self.view addSubview:_myView];
        _myView.backgroundColor = [UIColor whiteColor];
    }
    return _myView;
}
- (UILabel *)nameLb {
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [_myView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(20);
            make.width.equalTo(150);
            make.height.equalTo(25);
        }];
        _nameLb.text = @"赵四";
        _nameLb.font = [UIFont systemFontOfSize:25];
        _nameLb.textColor = kRGBA(26, 26, 26, 1);
    }
    return _nameLb;
}
- (UILabel *)phoneLb {
    if (!_phoneLb) {
        _phoneLb = [UILabel new];
        [_myView addSubview:_phoneLb];
        [_phoneLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-20);
            make.top.equalTo(20);
            make.width.equalTo(250);
            make.height.equalTo(26);
        }];
        _phoneLb.text = @"13445456666";
        _phoneLb.font = [UIFont systemFontOfSize:25];
        _phoneLb.textColor = kRGBA(26, 26, 26, 1);
        _phoneLb.textAlignment = NSTextAlignmentRight;
    }
    return _phoneLb;
}
- (UILabel *)addressLb {
    if (!_addressLb) {
        _addressLb = [UILabel new];
        [_myView addSubview:_addressLb];
        [_addressLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.right.equalTo(-50);
            make.height.equalTo(60);
            make.top.equalTo(_nameLb.mas_bottom).equalTo(10);
        }];
        _addressLb.text = @"北京市海淀区翠湖敬老院16号567";
        _addressLb.font = [UIFont systemFontOfSize:25];
        _addressLb.textColor = kRGBA(26, 26, 26, 1);
        _addressLb.numberOfLines = 0;
    }
    return _addressLb;
}
- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [UIView new];
        [_myView addSubview:_lineView1];
        [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(_addressLb.mas_bottom).equalTo(20);
        }];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView1;
}
- (UILabel *)sendLb {
    if (!_sendLb) {
        _sendLb = [UILabel new];
        [_myView addSubview:_sendLb];
        [_sendLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(_lineView1.mas_bottom).equalTo(20);
            make.right.equalTo(-20);
            make.height.equalTo(25);
        }];
        _sendLb.text = @"服务:";
        _sendLb.font = [UIFont systemFontOfSize:25];
        _sendLb.textColor = kRGBA(26, 26, 26, 1);
    }
    return _sendLb;
}

- (UILabel *)timeLb {
    if (!_timeLb) {
        _timeLb = [UILabel new];
        [_myView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(_sendLb.mas_bottom).equalTo(10);
            make.right.equalTo(-50);
            make.height.equalTo(25);
        }];
        _timeLb.text = @"上门时间：";
        _timeLb.font = [UIFont systemFontOfSize:25];
        _timeLb.textColor = kRGBA(26, 26, 26, 1);
    }
    return _timeLb;
}
- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [UIView new];
        [_myView addSubview:_lineView2];
        [_lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(_timeLb.mas_bottom).equalTo(20);
        }];
        _lineView2.backgroundColor = kRGBA(244, 244, 244, 1);
    }
    return _lineView2;
}
- (UILabel *)allPrice {
    if (!_allPrice) {
        _allPrice = [UILabel new];
        [_myView addSubview:_allPrice];
        [_allPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.width.equalTo(116);
            make.height.equalTo(28);
            make.top.equalTo(_lineView2.mas_bottom).equalTo(10);
            
            UILabel *label = [UILabel new];
            [self.myView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(_allPrice.mas_left);
                make.bottom.equalTo(_allPrice.mas_bottom).equalTo(-2);
                make.height.equalTo(16);
                make.width.equalTo(14);
            }];
            label.font = [UIFont systemFontOfSize:20];
            label.textColor = kRGBA(252, 110, 39, 1);
            label.text = @"￥";
            
            UILabel *sumLb = [UILabel new];
            [self.myView addSubview:sumLb];
            [sumLb mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(label.mas_left).equalTo(0);
                make.bottom.equalTo(label.mas_bottom).equalTo(0);
                make.width.equalTo(50);
                make.height.equalTo(20);
            }];
            sumLb.font = [UIFont systemFontOfSize:20];
            sumLb.textColor = kRGBA(26, 26, 26, 1);
            sumLb.text = @"合计:";
            sumLb.textAlignment = NSTextAlignmentRight;
        }];
        
        _allPrice.text = @"50.00";
        _allPrice.textAlignment = NSTextAlignmentLeft;
        _allPrice.textColor = kRGBA(252, 110, 39, 1);
        _allPrice.font = [UIFont systemFontOfSize:28];
    }
    return _allPrice;
}
- (UIButton *)jiageButton {
    if (!_jiageButton) {
        _jiageButton = [UIButton new];
        [self.view addSubview:_jiageButton];
        [_jiageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(0);
            make.height.equalTo(49);
            make.width.equalTo(self.payButton.mas_width);
        }];
        [_jiageButton setTitleColor:kRGBA(252, 110, 39, 1) forState:UIControlStateNormal];
        [_jiageButton setTitle:@"￥50.00" forState:UIControlStateNormal];
        _jiageButton.titleLabel.font = [UIFont systemFontOfSize:25];
        _jiageButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _jiageButton.backgroundColor = [UIColor whiteColor];
    }
    return _jiageButton;
}
- (UIButton *)payButton {
    if (!_payButton) {
        _payButton = [[UIButton alloc] init];
        [self.view addSubview:_payButton];
        [_payButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(0);
            make.height.equalTo(49);
            make.left.equalTo(self.jiageButton.mas_right);
        }];
        [_payButton setTitle:@"提交订单" forState:UIControlStateNormal];
        _payButton.titleLabel.font = [UIFont systemFontOfSize:30];
        _payButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _payButton.backgroundColor = kRGBA(255, 206, 87, 1);
        _payButton.titleLabel.textColor = [UIColor whiteColor];
        
        [_payButton addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _payButton;
}
- (void)push {
//    _tfSheetView = [[TFSheetView alloc]init];
//    _tfSheetView.delegate = self;
//    [_tfSheetView showInView:self.view];
    
//    UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
//    maskView.backgroundColor = kRGBA(0, 0, 0, .3);
//    [self.view addSubview:maskView];
    
//    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] init];
//    [maskView addSubview:activityView];
//    [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(0);
//        make.centerY.equalTo(-66);
//        make.size.equalTo(80);
//    }];
//    [activityView startAnimating];
    
    //[self.view showHUD];
    
    _qiangDanView = [[SCQiangDanView alloc] init];
    [_qiangDanView showView:self.view];
//    [self.timer invalidate];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 block:^(NSTimer * _Nonnull timer) {
//        _qiangDanView = [[SCQiangDanView alloc] init];
//        [_qiangDanView showView:self.view];
//    } repeats:NO];
    
}
- (void)payOfPageBtnView:(TFSheetView *)btnView showBtnView:(UIButton *)btn {
    btn.backgroundColor = kRGBA(255, 206, 87, 1);
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(255, 206, 87, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    self.navigationItem.title = @"确认订单";
    self.view.backgroundColor = kRGBA(245, 245, 245, 1);
    [self daoHangView];
    [self myView];
    [self nameLb];
    [self phoneLb];
    [self addressLb];
    [self lineView1];
    [self sendLb];
    [self timeLb];
    [self lineView2];
    [self allPrice];
    [self jiageButton];
    [self payButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
