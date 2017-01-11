//
//  Add_EditShouHuoDiZhiVCViewController.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/4.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "Add_EditShouHuoDiZhiVCViewController.h"
#import "AddNewAddressCell.h"
#import "UITextView+Placeholder.h"



@interface Add_EditShouHuoDiZhiVCViewController ()<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIButton *bottomBtn;

@property(nonatomic) BOOL isEdit;

@property(nonatomic, strong) addressModel *addressModel;

@property(nonatomic, strong) NSMutableArray *dataArr;

@property(nonatomic, strong) UIView  *pickerV;

@property(nonatomic, strong) UIPickerView *p;

@property(nonatomic, strong) NSMutableArray<NSDictionary *> *pickArr;

// 省市县标记
@property(nonatomic, assign) NSInteger flag;

@end

@implementation Add_EditShouHuoDiZhiVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UINib *nib = [UINib nibWithNibName:@"AddNewAddressCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    self.flag = 0;
    [TRFactory addBackItemForVC:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isEdit ? 6 : 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddNewAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textV.tag = 100 + indexPath.row;
    cell.textV.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textV.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *array = @[@"收货人   ",@"联系电话",@"地区街道",@"详细地址",@"设为默认",@"删除地址",@"",@"",];
    cell.titleLb.text = array[indexPath.row];
    [cell.titleLb sizeToFit];
    cell.textV.textAlignment = NSTextAlignmentRight;
    
    if (self.isEdit) {
        cell.textV.text = self.dataArr[indexPath.row];
    } else {
        NSArray *arr = @[@"名字",@"手机号",@"所在小区、街道",@"详细地址",@"",@"",@"",];
        cell.textV.placeholder = arr[indexPath.row];
        
    }
     if (indexPath.row == 2) {
        cell.moreImgV.hidden = NO;
        cell.textV.selectable = NO;
    }
    if (indexPath.row > 3) {
        cell.textV.hidden = YES;
    }
    if (indexPath.row == 4) {
        cell.setDefault.hidden = NO;
    }
    return cell;
}

#pragma tableViewDelegate



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        [BaseNetworking GET:@"/baochunhui/public/index.php/Index/index/getProvice" parameters:nil completionHandler:^(id responseObj, NSError *error) {
            if (!error) {
                for (NSDictionary *dict in responseObj) {
                    NSString *name = dict[@"provice_name"];
                    NSString *i_d = [NSString stringWithFormat:@"%@", dict[@"provice_id"]];
                    NSDictionary *d = @{@"name": name, @"id": i_d};
                    [self.pickArr addObject:d];
                }
                self.flag += 1;
                [self.p reloadComponent:0];
            }
        }];
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
            self.pickerV.frame = CGRectMake(0, kMainScreenHeight-350-49, kMainScreenWidth, 350);
        }];
    }
    if (indexPath.row == 5) {
        // 删除收货地址
        UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"提示" message:@"删除地址信息？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [BaseNetworking POST:@"/baochunhui/public/index.php/Index/User/delAddress" parameters:@{@"address_id": @(self.addressModel.address_id)} completionHandler:^(id responseObj, NSError *error) {
                if (!error) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }];
        }];
        UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            return;
        }];
        [alertV addAction:act];
        [alertV addAction:act1];
        [self presentViewController:alertV animated:YES completion:nil];
        
    }
}



#pragma UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView{
    //NSString *str = textView.text;
    CGRect bounds = textView.bounds;
    CGSize maxSize = CGSizeMake(bounds.size.width, CGFLOAT_MAX);
    CGSize newSize = [textView sizeThatFits:maxSize];
    bounds.size = newSize;
    textView.bounds =  bounds;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    switch (textView.tag) {
        case 100:
            self.addressModel.consignee = textView.text;
            break;
        case 101:
            self.addressModel.mobile = textView.text.integerValue;
            break;
        case 102:
            
            break;
        case 103:
            self.addressModel.address = textView.text;
            break;
            
        default:
            break;
    }
}


#pragma UIPickerViewDatasource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.pickArr.count;
}


#pragma UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"select row: %ld", row);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.pickArr[row][@"name"];
}

- (void)cancelBtnClicked{
    [UIView animateWithDuration:0.5 animations:^{
        [self.pickerV layoutIfNeeded];
        self.pickerV.frame = CGRectMake(0, kMainScreenHeight, kMainScreenWidth, 350);
    }];
    self.flag = 0;
    
}
- (void)quedBtnClicked{
    
    NSArray *array = @[@"/baochunhui/public/index.php/Index/index/getProvice", @"/baochunhui/public/index.php/Index/index/getCity", @"/baochunhui/public/index.php/Index/index/getCounty", @"/baochunhui/public/index.php/Index/index/getTown"];
    NSArray *array_id = @[@"provice_id", @"city_id", @"county_id", @"town_id"];
    NSArray *array_name = @[@"provice_name", @"city_name", @"county_name", @"town_name"];
    NSInteger row = [self.p selectedRowInComponent:0];
    switch (self.flag-1) {
        case 0:{
            self.addressModel.provice_name = self.pickArr[row][@"name"];
            NSLog(@"%@", self.pickArr[row][@"id"]);
            NSString *str = [[NSString stringWithFormat:@"%@", self.pickArr[row][@"id"]] copy];
            self.addressModel.province = [str integerValue];
            break;
        }
        case 1:{
            self.addressModel.city_name = self.pickArr[row][@"name"];
            NSLog(@"%@", self.pickArr[row][@"id"]);
            NSString *str = [NSString stringWithFormat:@"%@", self.pickArr[row][@"id"]];
            NSString *string = [str copy];
            self.addressModel.city = [string integerValue];
            NSLog(@"%ld", self.addressModel.city);
            break;
        }
        case 2:{
            self.addressModel.county_name = self.pickArr[row][@"name"];
            NSLog(@"%@", self.pickArr[row][@"id"]);
            NSString *str = [[NSString stringWithFormat:@"%@", self.pickArr[row][@"id"]] copy];
            self.addressModel.county = [str integerValue];
            break;
        }
        case 3:{
            self.addressModel.town_name = self.pickArr[row][@"name"];
            NSLog(@"%@", self.pickArr[row][@"id"]);
            NSString *str = [[NSString stringWithFormat:@"%@", self.pickArr[row][@"id"]] copy];
            self.addressModel.town = [str integerValue];
            break;
        }
        default:
            break;
    }
    NSDictionary *dic = nil;
    if (self.flag) {
        dic = @{array_id[self.flag-1]: self.pickArr[row][@"id"]};
    }
    if (self.flag<4) {
        [BaseNetworking GET:array[self.flag] parameters:dic completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            [self.pickArr removeAllObjects];
            for (NSDictionary *dict in responseObj) {
                NSString *name = dict[array_name[self.flag]];
                NSString *i_d = [NSString stringWithFormat:@"%@", dict[array_id[self.flag]]];
                NSDictionary *d = @{@"name": name, @"id": i_d};
                [self.pickArr addObject:d];
            }
            self.flag += 1;
            [self.p reloadComponent:0];
        }
    }];
    } else {
        // textView显示省市县地址
        AddNewAddressCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
        cell.textV.text = [NSString stringWithFormat:@"%@%@%@%@", self.addressModel.provice_name, self.addressModel.city_name, self.addressModel.county_name, self.addressModel.town_name];
        [UIView animateWithDuration:0.5 animations:^{
            [self.pickerV layoutIfNeeded];
            self.pickerV.frame = CGRectMake(0, kMainScreenHeight, kMainScreenWidth, 350);
        }];
        
        [self textViewDidChange:cell.textV];
    }
    
}

- (void)textViewResignFirstResponder{
    for (int i = 0; i < 4; i++) {
        AddNewAddressCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [cell.textV resignFirstResponder];
    }
}









#pragma life cycle

- (instancetype)initWithAddNewAddress{
    self = [super init];
    if (self) {
        self.isEdit = NO;
        self.addressModel = [[addressModel alloc] init];
    }
    return self;
}
- (instancetype)initWithAddressModel:(addressModel *)addressModel{
    self = [super init];
    if (self) {
        self.addressModel = addressModel;
        self.isEdit = YES;
        [self.dataArr addObject:self.addressModel.consignee];
        [self.dataArr addObject:@(self.addressModel.mobile)];
        [self.dataArr addObject:self.addressModel.detailAddress];
        [self.dataArr addObject:self.addressModel.address];
        
    }
    return self;
}



#pragma lazy load


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(self.bottomBtn.mas_top).equalTo(0);
        }];
    }
    return _tableView;
}

- (void)bottomBtnClicked{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [self textViewResignFirstResponder];
    BOOL isdefault = YES;
    for (int row = 0; row<4; row++) {
        AddNewAddressCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
        if ([cell.textV.text isEqualToString:@""]) {
            // 请完善地址信息
            UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"提示" message:@"请完善地址信息" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertV addAction:act];
            [self presentViewController:alertV animated:YES completion:nil];
            return;
        }
    }
    AddNewAddressCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    isdefault = cell.setDefault.on;
    [dic setObject:@(self.addressModel.province) forKey:@"province_id"];
    [dic setObject:@(self.addressModel.city) forKey:@"city_id"];
    [dic setObject:@(self.addressModel.county) forKey:@"county_id"];
    [dic setObject:@(self.addressModel.town) forKey:@"town_id"];
    [dic setObject:self.addressModel.consignee forKey:@"name"];
    [dic setObject:@(self.addressModel.mobile) forKey:@"phone_number"];
    [dic setObject:self.addressModel.address forKey:@"detail_address"];
    NSInteger isdef = isdefault ? 1 : 0;
    [dic setObject:@(isdef) forKey:@"is_default"];
    [BaseNetworking POST:@"/baochunhui/public/index.php/Index/User/addAddress" parameters:dic completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (UIButton *)bottomBtn{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_bottomBtn setBackgroundColor:[UIColor ShengHuoColor]];
        [_bottomBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        [_bottomBtn setTintColor:[UIColor whiteColor]];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:28];
        _bottomBtn.titleLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_bottomBtn];
        [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(49);
        }];
        [_bottomBtn addTarget:self action:@selector(bottomBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (UIView *)pickerV{
    if (!_pickerV) {
        _pickerV = [[UIView alloc] initWithFrame:CGRectMake(0, kMainScreenHeight, kMainScreenWidth, 350)];
        _p = [[UIPickerView alloc] init];
        [self.view addSubview:_pickerV];
        [_pickerV addSubview:_p];
        _p.delegate = self;
        _p.dataSource = self;
        [_p mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(50);
        }];
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_pickerV addSubview:cancelBtn];
        [cancelBtn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.size.equalTo(CGSizeMake(90, 40));
        }];
        UIButton *quedBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [quedBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_pickerV addSubview:quedBtn];
        quedBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        [quedBtn addTarget:self action:@selector(quedBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [quedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.right.equalTo(-10);
            make.size.equalTo(CGSizeMake(90, 40));
        }];
    }
    return _pickerV;
}


- (NSMutableArray<NSDictionary *> *)pickArr{
    if (!_pickArr) {
        _pickArr = [[NSMutableArray<NSDictionary *> alloc] init];
    }
    return _pickArr;
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
