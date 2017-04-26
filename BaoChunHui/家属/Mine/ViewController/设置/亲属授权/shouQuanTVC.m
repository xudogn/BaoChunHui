//
//  shouQuanTVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/19.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "shouQuanTVC.h"
#import "shouQuanCell.h"
#import "shouQuanModel.h"


@interface shouQuanTVC ()

@property (nonatomic, strong) NSMutableArray<shouQuanModel *> *datalist;

@end

@implementation shouQuanTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.datalist = [NSMutableArray<shouQuanModel *> new];
    shouQuanModel *model = [shouQuanModel new];
    model.name = @"张三";
    model.phoneNum = @"15100001111";
    model.isAccepted = NO;
    shouQuanModel *model1 = [shouQuanModel new];
    model1.name = @"李四";
    model1.phoneNum = @"15100001111";
    model1.isAccepted = NO;
    shouQuanModel *model2 = [shouQuanModel new];
    model2.name = @"王五";
    model2.phoneNum = @"15100001111";
    model2.isAccepted = NO;
    [self.datalist addObject:model];
    [self.datalist addObject:model1];
    [self.datalist addObject:model2];
    // 网络获取 授权亲属列表
    
    UINib *nib = [UINib nibWithNibName:@"shouQuanCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datalist.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datalist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shouQuanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.name.text = self.datalist[indexPath.row].name;
    cell.phonenum.text = self.datalist[indexPath.row].phoneNum;
    cell.acceptBtn.hidden = self.datalist[indexPath.row].isAccepted;
    cell.imgV.image = [UIImage imageNamed:@"list_change"];
    MJWeakSelf
    cell.btnClicked = ^(UIButton *sender){
        sender.hidden = YES;
        weakSelf.datalist[indexPath.row].isAccepted = YES;
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 87;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型
    [self.datalist removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
    // 刷新
    //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    //[tableView deleteRowAtIndexPath:indexPath withRowAnimation:UITableViewRowAnimationLeft];
}

/**
 *  修改Delete按钮文字为“删除”
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
