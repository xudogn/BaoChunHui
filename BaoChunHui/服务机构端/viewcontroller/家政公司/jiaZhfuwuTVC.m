//
//  jiaZhfuwuTVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/29.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "jiaZhfuwuTVC.h"
#import "jaizhengVC.h"

@interface jiaZhfuwuTVC ()

@end

@implementation jiaZhfuwuTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 01;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"家政公司%ld", indexPath.row +1];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    jaizhengVC *vc = [[jaizhengVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
