//
//  DeliveryAddressViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/17.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "DeliveryAddressViewController.h"
#import "DeliveryAddressCell.h"


@interface DeliveryAddressViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray<addressModel *> *address_arr;



@end

@implementation DeliveryAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.address_arr = [userModel defaultsUserModel].address_arr;
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
    
    cell.naneL.text = self.address_arr[indexPath.row].name;
    cell.teltNumL.text = [NSString stringWithFormat:@"%ld",   self.address_arr[indexPath.row].teleNum];
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
        
    };
    return cell;
}




































- (UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc ] init];
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
