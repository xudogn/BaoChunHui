//
//  SCBaoJieController.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SCBaoJieController.h"
#import "zuDaoCollectionViewCell.h"
#import "iCarousel.h"
#import "HWDatePicker.h"
#import "informationView.h"
#import "addressViewController.h"
#import "BaojieDingDanController.h"

@interface SCBaoJieController ()<HWDatePickerDelegate,UITextFieldDelegate,informationViewDelegate>
@property (nonatomic) zuDaoCollectionViewCell *cell;
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

@implementation SCBaoJieController

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
- (UIView *)grayView {
    if (!_grayView) {
        _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 390, kScreenW, 12)];
        [self.collectionView addSubview:_grayView];
        _grayView.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView;
}
- (void)didClickedBtn:(UIButton *)btn {
    self.hidesBottomBarWhenPushed = YES;
    addressViewController *vc = [[addressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(16, 166, 226, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    self.navigationItem.title = @"保洁";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[zuDaoCollectionViewCell class] forCellWithReuseIdentifier:@"otherCell"];
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
        _infoView = [[informationView alloc] initWithFrame:CGRectMake(0, 402, kScreenW, 373)];
        [self.collectionView addSubview:_infoView];
        _infoView.backgroundColor = [UIColor whiteColor];
        _infoView.delegate = self;
    }
    return _infoView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (kScreenW - 34) / 2;
    CGFloat height = 79;
    return CGSizeMake(width, height);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(204, 12, 401, 12);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 9;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    zuDaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"otherCell" forIndexPath:indexPath];
    cell.selectedBackgroundView = cell.maskView;
    //改变成网络获取数据
    cell.typeLb.text = @"2小时";
    cell.payLb.text = @"￥60.00";
    cell.payLb.textAlignment = NSTextAlignmentCenter;
    cell.typeLb.textAlignment = NSTextAlignmentCenter;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = kRGBA(200, 200, 200, 1).CGColor;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _infoView.priceLb.text = @"￥60.00";
}
- (UIView *)grayView1 {
    if (!_grayView1) {
        _grayView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 112, kScreenW, 12)];
        [self.collectionView addSubview:_grayView1];
        _grayView1.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView1;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 184, kScreenW, 1)];
        [self.collectionView addSubview:_lineView];
        _lineView.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView;
}
- (UIView *)icShowView {
    if (!_icShowView) {
        _icShowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 112)];
        [self.collectionView addSubview:_icShowView];
        _icShowView.backgroundColor = kRGBA(16, 166, 226, 1);
        
        UILabel *typeLb = [[UILabel alloc] init];
        [self.collectionView addSubview:typeLb];
        [typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_icShowView.mas_bottom).equalTo(27);
            make.left.equalTo(12);
            make.width.equalTo(150);
            make.height.equalTo(30);
        }];
        typeLb.text = @"服务类型";
        typeLb.font = [UIFont systemFontOfSize:30];
    }
    return _icShowView;
}
//- (UIButton *)phoneButton {
//    if (!_phoneButton) {
//        _phoneButton = [[UIButton alloc] init];
//        [self.infoView addSubview:_phoneButton];
//        [_phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.bottom.equalTo(0);
//            make.height.equalTo(49);
//            make.width.equalTo(kScreenW * 0.5);
//        }];
//        _phoneButton.backgroundColor = [UIColor whiteColor];
//        [_phoneButton setTitleColor:kRGBA(16, 166, 226, 1) forState:UIControlStateNormal];
//        [_phoneButton setTitle:@"电话预定" forState:UIControlStateNormal];
//        _phoneButton.titleLabel.font = [UIFont systemFontOfSize:30];
//    }
//    return _phoneButton;
//}
- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc] init];
        [self.infoView addSubview:_onlineButton];
        [_onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(49);
        }];
        [_onlineButton setTitle:@"立即下单" forState:UIControlStateNormal];
        [_onlineButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _onlineButton.backgroundColor = kRGBA(16, 166, 226, 1);
        _onlineButton.titleLabel.font = [UIFont systemFontOfSize:30];
        [_onlineButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlineButton;
}

- (void)btnClicked {
    self.hidesBottomBarWhenPushed = YES;
    BaojieDingDanController *vc = [[BaojieDingDanController alloc] init];
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
    [btn setTitleColor:kRGBA(16, 166, 226, 1) forState:UIControlStateNormal];
}
- (void)datePickerView:(HWDatePicker *)datePickerView showSureBtn:(UIButton *)btn {
    [btn setTitleColor:kRGBA(16, 166, 226, 1) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
