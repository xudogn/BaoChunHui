//
//  SCWeixiuViewController.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SCWeixiuViewController.h"
#import "iCarousel.h"
#import "HWDatePicker.h"
#import "informationView.h"
#import "addressViewController.h"
#import "weiXiuDingDanController.h"

@interface SCWeixiuViewController ()<HWDatePickerDelegate,UITextFieldDelegate,informationViewDelegate>
@property (nonatomic) UIView *icShowView;
//@property (nonatomic) iCarousel *ic;
//@property (nonatomic) UIButton *phoneButton;
@property (nonatomic) UIButton *onlineButton;
@property (nonatomic) HWDatePicker *datePicker;
@property (nonatomic) UITextField *dateTextField;
@property (nonatomic) UIView *grayView1;
@property (nonatomic) UIView *grayView2;
@property (nonatomic) UIView *lineView;
@property (nonatomic) UIView *lineViewb1;
@property (nonatomic) UIView *lineViewb2;
@property (nonatomic) informationView *infoView;
@property (nonatomic) UIView *grayView;
@end

@implementation SCWeixiuViewController
- (UITextField *)dateTextField {
    if (!_dateTextField) {
        _dateTextField = [[UITextField alloc] init];
        [self.infoView addSubview:_dateTextField];
        [_dateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_infoView.timeImage.mas_right).equalTo(10);
            make.top.equalTo(10);
            make.width.equalTo(250);
            make.height.equalTo(30);
        }];
        _dateTextField.placeholder = @"上门时间";
        _dateTextField.font = [UIFont systemFontOfSize:25];
        _dateTextField.delegate = self;
        //选择器
        HWDatePicker *areaPicker = [[HWDatePicker alloc] initWithFrame:CGRectMake(kScreenW * 0.05, kScreenH, kScreenW * 0.9, kScreenW * 0.5)];
        areaPicker.backgroundColor = [UIColor whiteColor];
        areaPicker.delegate = self;
        [self.view addSubview:areaPicker];
        self.datePicker = areaPicker;
    }
    return _dateTextField;
}

- (void)didClickedBtn:(UIButton *)btn {
    self.hidesBottomBarWhenPushed = YES;
    addressViewController *vc = [[addressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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
    self.navigationItem.title = @"维修";
    
    [self grayView1];
    [self grayView2];
    [self lineView];
    [self icShowView];
    [self onlineButton];
    [self dateTextField];
    [self lineViewb1];
    [self infoView];
    [self grayView];
    
    
}
- (informationView *)infoView {
    if (!_infoView) {
        _infoView = [[informationView alloc] initWithFrame:CGRectMake(0, 124, kScreenW, kScreenH - 112)];
        [self.view addSubview:_infoView];
        _infoView.backgroundColor = [UIColor whiteColor];
        _infoView.delegate = self;
    }
    return _infoView;
}

- (UIView *)grayView1 {
    if (!_grayView1) {
        _grayView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 112, kScreenW, 12)];
        [self.view addSubview:_grayView1];
        _grayView1.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView1;
}
- (UIView *)icShowView {
    if (!_icShowView) {
        _icShowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 112)];
        [self.view addSubview:_icShowView];
        _icShowView.backgroundColor = kRGBA(255, 206, 87, 1);
        
    }
    return _icShowView;
}

- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc] init];
        [self.infoView addSubview:_onlineButton];
        [_onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(49);
            make.bottom.equalTo(-75);
        }];
        [_onlineButton setTitle:@"立即下单" forState:UIControlStateNormal];
        [_onlineButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _onlineButton.backgroundColor = [UIColor whiteColor];
        _onlineButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [_onlineButton setTitleColor:kRGBA(255, 206, 87, 1) forState:UIControlStateNormal];
        [_onlineButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlineButton;
}

- (void)btnClicked {
    self.hidesBottomBarWhenPushed = YES;
    weiXiuDingDanController *vc = [[weiXiuDingDanController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (_datePicker.frame.origin.y != kScreenH && _datePicker != nil) {
        [_datePicker dismiss];
        return NO;
        
    }else if (textField == _dateTextField) {
        [_datePicker show];
        return NO;
    }
    
    return YES;
}
- (void)datePickerView:(HWDatePicker *)datePickerView didClickSureBtnWithSelectDate:(NSString *)date {
    _dateTextField.text = date;
}
- (void)datePickerView:(HWDatePicker *)datePickerView didClickedCancleBtnWithSelecDate:(NSString *)date {
    _dateTextField.text = date;
}
- (void)datePickerView:(HWDatePicker *)datePickerView showCancleBtn:(UIButton *)btn {
    [btn setTitleColor:kRGBA(255, 206, 87, 1) forState:UIControlStateNormal];
}
- (void)datePickerView:(HWDatePicker *)datePickerView showSureBtn:(UIButton *)btn {
    [btn setTitleColor:kRGBA(255, 206, 87, 1) forState:UIControlStateNormal];
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
