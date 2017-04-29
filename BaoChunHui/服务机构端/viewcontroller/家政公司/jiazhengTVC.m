//
//  jiazhengTVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/29.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "jiazhengTVC.h"
#import "jiaZhfuwuTVC.h"
#import "ShiMingRenZhengVC.h"

@interface jiazhengTVC ()

@end

@implementation jiazhengTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.row == 0) {
        cell.textLabel.text = @"注册";
    }else{
        cell.textLabel.text = @"家政服务";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ShiMingRenZhengVC *vc = [[ShiMingRenZhengVC alloc] initWithNibName:NSStringFromClass([ShiMingRenZhengVC class]) bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        jiaZhfuwuTVC *vc = [[jiaZhfuwuTVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
