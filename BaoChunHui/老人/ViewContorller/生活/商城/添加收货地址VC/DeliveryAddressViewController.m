//
//  DeliveryAddressViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/17.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "DeliveryAddressViewController.h"
#import "DeliveryAddressCell.h"
#import "Add_EditShouHuoDiZhiVCViewController.h"

@interface DeliveryAddressViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray<addressModel *> *address_arr;

@property(nonatomic, strong) UIButton *addAddress;


@end
//  管理收货地址页面
@implementation DeliveryAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //网络请求收货地址， 默认收货地址
    NSDictionary *dic = @{@"user_id": [[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"]};
    [BaseNetworking GET:@"/baochunhui/public/index.php/Index/User/getUserAdderss" parameters:dic completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            NSMutableArray<addressModel *> *array = [addressModel parse:responseObj];
            self.address_arr = array;
        } else {
            NSLog(@"网络获取收货地址失败");
        }
    }];
    
    
    UINib *nib = [UINib nibWithNibName:@"DeliveryAddressCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.address_arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DeliveryAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.naneL.text = self.address_arr[indexPath.row].consignee;
    cell.teltNumL.text = [NSString stringWithFormat:@"%ld",   self.address_arr[indexPath.row].mobile];
    cell.addressL.text = self.address_arr[indexPath.row].address;
    // 是默认地址
    [cell.flagBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [cell.flagBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateDisabled];
    if (indexPath.row == 0) {//
        cell.flagBtn.enabled = NO;
    }
    cell.flagBtnClicked = ^(){
        //点击了设置为默认
        [self.address_arr exchangeObjectAtIndex:indexPath.row withObjectAtIndex:0];
        [self.tableView reloadData];
    };
    cell.deleteBtnClicked = ^(){
        [self.address_arr removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    };
    cell.editBtnClicked = ^(){
        // 跳转编辑 收货地址Vc
        Add_EditShouHuoDiZhiVCViewController *vc = [[Add_EditShouHuoDiZhiVCViewController alloc] initWithAddressModel:self.address_arr[indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}































- (void)addNewAddress{
    // 跳转到添加新地址页面
    Add_EditShouHuoDiZhiVCViewController *vc = [[Add_EditShouHuoDiZhiVCViewController alloc] initWithAddNewAddress];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIButton *)addAddress{
    if (!_addAddress) {
        _addAddress = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.view addSubview:_addAddress];
        [_addAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.tableView.mas_bottom);
            make.height.equalTo(49);
        }];
        [_addAddress setTitle:@"添加新地址" forState:UIControlStateNormal];
        [_addAddress setBackgroundColor:[UIColor ShengHuoColor]];
        _addAddress.titleLabel.font = [UIFont systemFontOfSize:25];
        [_addAddress addTarget:self action:@selector(addNewAddress) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addAddress;
}


- (UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc ] init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
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
