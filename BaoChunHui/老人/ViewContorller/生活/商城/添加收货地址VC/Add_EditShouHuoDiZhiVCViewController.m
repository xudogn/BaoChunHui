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



@interface Add_EditShouHuoDiZhiVCViewController ()<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIButton *bottomBtn;

@property(nonatomic) BOOL isEdit;

@property(nonatomic, strong) addressModel *addressModel;

@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation Add_EditShouHuoDiZhiVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isEdit ? 6 : 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddNewAddressCell *cell = [[AddNewAddressCell alloc] init];
    cell.textV.tag = 100 + indexPath.row;
    cell.textV.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textV.delegate = self;
    
    NSArray *array = @[@"收货人",@"联系电话",@"地区街道",@"详细地址",@"设为默认",@"删除地址",@"",@"",];
    cell.titleLb.text = array[indexPath.row];
    if (self.isEdit) {
        cell.textV.text = self.dataArr[indexPath.row];
    } else {
        NSArray *arr = @[@"名字",@"手机号",@"所在小区、街道",@"详细地址",@"",@"",@"",];
        cell.textV.placeholder = arr[indexPath.row];
        
    }
    if (indexPath.row == 2) {
        cell.moreImgV.hidden = NO;
    }
    if (indexPath.row > 3) {
        cell.textV.hidden = YES;
    }
    if (indexPath.row == 4) {
        cell.setDefault.hidden = NO;
    }
    return cell;
}


#pragma UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
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


- (UIButton *)bottomBtn{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_bottomBtn setBackgroundColor:[UIColor ShengHuoColor]];
        [_bottomBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
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



- (void)bottomBtnClicked{
    NSLog(@"bottombtn clicked");
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
