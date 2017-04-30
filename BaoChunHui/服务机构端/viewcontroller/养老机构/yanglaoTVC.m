//
//  yanglaoTVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "yanglaoTVC.h"
#import "jigouxinxiTVC.h"
#import "VideoTVC.h"
#import "ShiMingRenZhengVC.h"

@interface yanglaoTVC ()
@property (nonatomic, strong) NSArray *arr;
@end

@implementation yanglaoTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.arr = @[@"注册", @"机构信息", @"促销广告", @"曝光台", ];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            ShiMingRenZhengVC *vc = [[ShiMingRenZhengVC alloc] initWithNibName:NSStringFromClass([ShiMingRenZhengVC class]) bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 01:
        {
            jigouxinxiTVC *vc = [[jigouxinxiTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 02:
        {
            VideoTVC *vc = [[VideoTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 03:
        {
            VideoTVC *vc = [[VideoTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
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
