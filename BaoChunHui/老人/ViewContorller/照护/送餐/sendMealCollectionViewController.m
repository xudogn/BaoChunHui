//
//  sendMealCollectionViewController.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/10.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "sendMealCollectionViewController.h"
#import "ReusableView.h"
#import "CollectionViewCell.h"
#import "HWDatePicker.h"
#import "addressViewController.h"
#import "dingDanViewController.h"
#import "informationView.h"
#import "TRFactory.h"

@interface sendMealCollectionViewController ()<HWDatePickerDelegate,UITextFieldDelegate,informationViewDelegate>
@property (nonatomic) UIView *icShowView;
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIButton *phoneButton;
@property (nonatomic) UIButton *onlineButton;
@property (nonatomic) HWDatePicker *datePicker;
@property (nonatomic) informationView *infoView;
@property (nonatomic) UIView *grayView1;
@property (nonatomic) UIView *grayView2;
@property (nonatomic) UIView *grayView3;
@property (nonatomic) UIView *grayView4;
@property (nonatomic) UIView *lineView1;
@property (nonatomic) UIView *lineView2;
@property (nonatomic) UIView *lineView3;
@property (nonatomic) UIView *lineView4;
@property (nonatomic) UITextField *dateTextField;
@property (nonatomic) UIView *maskView;
@property (nonatomic) CollectionViewCell *myCell;
@end

@implementation sendMealCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


#pragma mark - viewDidLoad
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(252, 110, 39, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    self.navigationItem.title = @"送餐";
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[ReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellId"];
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self icShowView];
    [self onlineButton];
    [self phoneButton];
    [self infoView];
    [self grayView1];
    [self grayView2];
    [self grayView3];
    [self grayView4];
    [self lineView1];
    [self lineView2];
    [self lineView3];
    [self maskView];
    
    //[self datePicker];
    [self dateTextField];
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
#pragma mark - HWDatePickerDelegate
- (void)datePickerView:(HWDatePicker *)datePickerView didClickSureBtnWithSelectDate:(NSString *)date {
    _dateTextField.text = date;
    
}
- (void)datePickerView:(HWDatePicker *)datePickerView didClickedCancleBtnWithSelecDate:(NSString *)date {
    _dateTextField.text = date;
}

- (UITextField *)dateTextField {
    if (!_dateTextField) {
        _dateTextField = [[UITextField alloc] init];
        [_infoView addSubview:_dateTextField];
        [_dateTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_infoView.timeImage.mas_right).equalTo(10);
            make.top.equalTo(10);
            make.width.equalTo(250);
            make.height.equalTo(30);
        }];
        _dateTextField.placeholder = @"服务开始时间";
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
- (UIView *)grayView1 {
    if (!_grayView1) {
        _grayView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 112, kScreenW, 12)];
        [self.collectionView addSubview:_grayView1];
        _grayView1.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView1;
}
- (UIView *)grayView2 {
    if (!_grayView2) {
        _grayView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 274, kScreenW, 12)];
        [self.collectionView addSubview:_grayView2];
        _grayView2.backgroundColor = kRGBA(245, 245, 245, 1);
    }

    return _grayView2;
}
- (UIView *)grayView3 {
    if (!_grayView3) {
        _grayView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 436, kScreenW, 12)];
        [self.collectionView addSubview:_grayView3];
        _grayView3.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView3;
}
- (UIView *)grayView4 {
    if (!_grayView4) {
        _grayView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 656, kScreenW, 12)];
        [self.collectionView addSubview:_grayView4];
        _grayView4.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _grayView4;
}
- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 184, kScreenW, 1)];
        [self.collectionView addSubview:_lineView1];
        _lineView1.backgroundColor = kRGBA(224, 224, 224, 0.5);
    }
    return _lineView1;
}
- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 346, kScreenW, 0.5)];
        [self.collectionView addSubview:_lineView2];
        _lineView2.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView2;
}
- (UIView *)lineView3 {
    if (!_lineView3) {
        _lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 508, kScreenW, 1)];
        [self.collectionView addSubview:_lineView3];
        _lineView3.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView3;
}
- (UIView *)icShowView {
    if (!_icShowView) {
        _icShowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 112)];
        [self.collectionView addSubview:_icShowView];
        _icShowView.backgroundColor = kRGBA(252, 110, 39, 1);
//        _ic = [iCarousel new];
//        [_icShowView addSubview:_ic];
//        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.equalTo(0);
//        }];
//        _ic.delegate = self;
//        _ic.dataSource = self;
//        _ic.scrollSpeed = 0.2;
        
//        UILabel *typeLb = [[UILabel alloc] init];
//        [self.collectionView addSubview:typeLb];
//        [typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(_icShowView.mas_bottom).equalTo(8);
//            make.left.equalTo(15);
//            make.width.equalTo(150);
//            make.height.equalTo(32);
//        }];
//        typeLb.text = @"服务类型";
//        typeLb.font = [UIFont systemFontOfSize:30];
    }
    return _icShowView;
}
- (informationView *)infoView {
    if (!_infoView) {
        _infoView = [[informationView alloc] initWithFrame:CGRectMake(0, 666, kScreenW, 373)];
        [self.collectionView addSubview:_infoView];
        _infoView.backgroundColor = [UIColor whiteColor];
        _infoView.delegate = self;
    }
    return _infoView;
}
#pragma mark - toAddressView代理
- (void)didClickedBtn:(UIButton *)btn {
    self.hidesBottomBarWhenPushed = YES;
    addressViewController *vc = [[addressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 2) {
        return 3;
    }
    return 2;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (kScreenW - 34) / 2;
    CGFloat height = 50;
    return CGSizeMake(width, height);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section > 2) {
        return CGSizeZero;
    }
    return CGSizeMake(0, 60);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 2) {
        return UIEdgeInsetsMake(20, 12, 401, 12);
    }
    if (section == 0) {
        return UIEdgeInsetsMake(144, 12, 32, 12);
    }
    return UIEdgeInsetsMake(20, 12, 32, 12);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"cellId" forIndexPath:indexPath];
        //view.backgroundColor = [UIColor redColor];
        if (indexPath.section == 0) {
            view.titleLb.text = @"送餐频率";
            view.frame = CGRectMake(0, 124, kScreenW, 60);
        }
        if (indexPath.section == 1) {
            view.titleLb.text = @"套餐搭配";
        }
        if (indexPath.section == 2) {
            view.titleLb.text = @"个性套餐";
        }
        return view;
    }
    return [UICollectionReusableView new];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 8;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectedBackgroundView = cell.maskView;
    if (indexPath.section == 0) {
        cell.titleLb.text = @"三餐";
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = kRGBA(200, 200, 200, 1.0).CGColor;
    }
    if (indexPath.section == 1) {
        cell.titleLb.text = @"一荤一素";
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = kRGBA(200, 200, 200, 1.0).CGColor;
    }
    if (indexPath.section == 2) {
        cell.titleLb.text = @"高血压";
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = kRGBA(200, 200, 200, 1.0).CGColor;
    }
    
    return cell;
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
//- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
//    CollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor redColor]];
//}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _infoView.priceLb.text = @"1200.00";
    
}

//- (void)push {
//    addressViewController *vc = [[addressViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}


- (UIButton *)phoneButton {
    if (!_phoneButton) {
        _phoneButton = [[UIButton alloc] init];
        [self.infoView addSubview:_phoneButton];
        [_phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.equalTo(0);
            make.height.equalTo(49);
            make.width.equalTo(kScreenW * 0.5);
        }];
        _phoneButton.backgroundColor = [UIColor whiteColor];
        [_phoneButton setTitleColor:kRGBA(252, 110, 39, 1) forState:UIControlStateNormal];
        [_phoneButton setTitle:@"电话预定" forState:UIControlStateNormal];
        _phoneButton.titleLabel.font = [UIFont systemFontOfSize:30];
    }
    return _phoneButton;
}
- (UIButton *)onlineButton {
    if (!_onlineButton) {
        _onlineButton = [[UIButton alloc] init];
        [self.infoView addSubview:_onlineButton];
        [_onlineButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(0);
            make.height.equalTo(49);
            make.width.equalTo(kScreenW * 0.5);
        }];
        [_onlineButton setTitle:@"立即下单" forState:UIControlStateNormal];
        [_onlineButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _onlineButton.backgroundColor = kRGBA(252, 110, 39, 1);
        _onlineButton.titleLabel.font = [UIFont systemFontOfSize:30];
    [_onlineButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _onlineButton;
}
- (void)btnClicked {
    self.hidesBottomBarWhenPushed = YES;
    dingDanViewController *vc = [[dingDanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}






























@end
