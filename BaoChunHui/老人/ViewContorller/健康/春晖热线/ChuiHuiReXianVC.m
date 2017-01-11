//
//  ChuiHuiReXianVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/9.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "ChuiHuiReXianVC.h"
#import "makeCall.h"
@interface ChuiHuiReXianVC ()

@property(nonatomic, strong) NSArray *titleArr;
@property(nonatomic, strong) NSArray *telArr;

@end

@implementation ChuiHuiReXianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = @[@"健康咨询", @"心理咨询/自杀救助", @"法律援助", @"投诉建议", @"阿尔兹海默症爱心专线", @"彩虹春天志愿服务"];
    self.telArr = @[@"10086", @"10086", @"10086", @"10086", @"10086", @"10086"];
    self.navigationItem.title = @"春晖热线";
    kSetNaviBarItemTitleFontAndColor
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self configFooterView];
    [TRFactory addBackItemForVC:self];
}

- (void)configFooterView{
    CGFloat height = kMainScreenHeight - 64 - 60*self.titleArr.count;
    if (height < 100) {
        height = 100;
    }
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, height)];
    footV.backgroundColor = [UIColor colorWithR:245 g:245 b:245 alpha:1];
    UILabel *label = [[UILabel alloc] init];
    [footV addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(12);
    }];
    label.backgroundColor = [UIColor colorWithR:245 g:245 b:245 alpha:1];
    label.textColor = [UIColor colorWithHexString:@"cccccc"];
    label.font = [UIFont systemFontOfSize:25];
    [label sizeToFit];
    label.text = @"提醒：一键拨通电话";
    self.tableView.tableFooterView = footV;
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
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cekk"];
    cell.textLabel.text = self.titleArr[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:28];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"1a1a1a"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [makeCall callPhoneNumber:self.telArr[indexPath.row] toView:self.view];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:192 g:107 b:218 alpha:1];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:52 g:107 b:213 alpha:198];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
