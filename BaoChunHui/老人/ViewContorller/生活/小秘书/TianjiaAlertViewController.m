//
//  TianjiaAlertViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/1/16.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "TianjiaAlertViewController.h"
#import "SCTanView.h"
#import "TFSheetView.h"
#import "HWDatePicker.h"

@interface TianjiaAlertViewController ()<SCTanViewDelegate,HWDatePickerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleContent;
@property (weak, nonatomic) IBOutlet UITextField *dateContent;
@property (weak, nonatomic) IBOutlet UITextField *zhouQi;
@property (weak, nonatomic) IBOutlet UITextField *timeContent;
@property (weak, nonatomic) IBOutlet UIButton *addContent;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@property (weak, nonatomic) IBOutlet UILabel *beganDate;
@property (nonatomic) UITextField *dateText;
//时间选择器
@property (nonatomic) HWDatePicker *datePicker;


@property (nonatomic) SCTanView *scView;

@end

@implementation TianjiaAlertViewController
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(228, 83, 138, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}

- (UITextField *)dateText {
    if (!_dateText) {
        _dateText = [UITextField new];
        [self.view addSubview:_dateText];
        [_dateText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_titleContent.mas_right);
            make.width.equalTo(210);
            make.centerY.equalTo(_beganDate);
        }];
        _dateText.placeholder = @"请输入日期";
        _dateText.font = [UIFont systemFontOfSize:25];
        _dateText.textAlignment = NSTextAlignmentRight;
        _dateText.delegate = self;
        
        //选择器
        HWDatePicker *areaPicker = [[HWDatePicker alloc] initWithFrame:CGRectMake(kScreenW * 0.05, kScreenH, kScreenW * 0.9, kScreenW * 0.5)];
        areaPicker.backgroundColor = [UIColor whiteColor];
        areaPicker.delegate = self;
        [self.view addSubview:areaPicker];
        self.datePicker = areaPicker;
    }
    return _dateText;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (_datePicker.frame.origin.y != kScreenH && _datePicker != nil) {
        [_datePicker dismiss];
        return NO;
        
    }else if (textField == _dateText) {
        [_datePicker show];
        return NO;
    }
    
    return YES;
}
- (void)datePickerView:(HWDatePicker *)datePickerView didClickSureBtnWithSelectDate:(NSString *)date {
    _dateText.text = date;
}
- (void)datePickerView:(HWDatePicker *)datePickerView didClickedCancleBtnWithSelecDate:(NSString *)date {
    _dateText.text = date;
}
- (void)datePickerView:(HWDatePicker *)datePickerView showSureBtn:(UIButton *)btn {
    [btn setTitleColor:kRGBA(228, 83, 138, 1) forState:UIControlStateNormal];
}
- (void)datePickerView:(HWDatePicker *)datePickerView showCancleBtn:(UIButton *)btn {
    [btn setTitleColor:kRGBA(228, 83, 138, 1) forState:UIControlStateNormal];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_titleContent resignFirstResponder];
    [_dateContent resignFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"小秘书";
    
    [self dateText];
    
    [TRFactory addBackItemForVC:self];
    [TRFactory addAlertViewForVC:self clickedHandler:^{
        SCTanView *tanView = [[SCTanView alloc] init];
        [tanView showInView:self.view];
//        self.navigationItem.title = _scView.titleString;
//        NSLog(@"___%@",_scView.titleString);
        
    }];
    _titleContent.layer.borderColor = kRGBA(245, 245, 245, 1).CGColor;
    _titleContent.layer.borderWidth = 1;
    
    _dateContent.layer.borderColor = kRGBA(245, 245, 245, 1).CGColor;
    _dateContent.layer.borderWidth = 1;
    
    _zhouQi.layer.borderColor = kRGBA(245, 245, 245, 1).CGColor;
    _zhouQi.layer.borderWidth = 1;
    
    _timeContent.layer.borderColor = kRGBA(245, 245, 245, 1).CGColor;
    _timeContent.layer.borderWidth = 1;
    
}
- (IBAction)didClickedBtn:(id)sender {
    //TianjiaAlertViewController *vc = [[TianjiaAlertViewController alloc] init];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)dateBtnClicked {
//    [_dateContent addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchDown];
//}
//- (void)push {
//    HWDatePicker *picker = [[HWDatePicker alloc] initWithFrame:CGRectMake(kScreenW * 0.05, kScreenH, kScreenW * 0.9, kScreenW * 0.5)];
//    picker.backgroundColor = [UIColor whiteColor];
//    picker.delegate = self;
//    [self.view addSubview:picker];
//    self.datePicker = picker;
//    
//    
//    [picker show];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
