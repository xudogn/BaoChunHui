//
//  pickerViewController.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SCpickerViewController.h"
#import "SCAreaPickerView.h"
#import "zhaoHuNetManager.h"

@interface SCpickerViewController ()///<UITextFieldDelegate, SCAreaPickerViewDelegate, SCAreaPickerViewDataSource>
@property (nonatomic) UITextField *addressTextField;
@property (nonatomic) NSArray *dataList;
@end

@implementation SCpickerViewController

- (UITextField *)addressTextField {
    if (!_addressTextField) {
        _addressTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 250, 50)];
        [self.view addSubview:_addressTextField];
        _addressTextField.placeholder = @"请选择地址";
    }
    return _addressTextField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addressTextField];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [zhaoHuNetManager getProviceInformation:nil completionHandler:^(NSArray<proviceModel *> *model, NSError *error) {
        self.dataList = model;
    }];
    NSLog(@"%@",_dataList);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
