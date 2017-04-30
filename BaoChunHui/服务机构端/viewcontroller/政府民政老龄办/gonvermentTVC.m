//
//  gonvermentTVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "gonvermentTVC.h"
#import "SCCommunityViewController.h"
#import "adviceVC.h"
#import "ShiMingRenZhengVC.h"

@interface gonvermentTVC ()

@property(nonatomic, strong) NSArray *arr;

@end

@implementation gonvermentTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[@"注册", @"老龄政策", @"民政新闻" , @"老龄信息", @"投诉建议"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
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
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: // 注册
        {
            ShiMingRenZhengVC *vc = [[ShiMingRenZhengVC alloc] initWithNibName:NSStringFromClass([ShiMingRenZhengVC class]) bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 01:
        {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            SCCommunityViewController *vc = [[SCCommunityViewController alloc] initWithCollectionViewLayout:layout];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 02:
        {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            SCCommunityViewController *vc = [[SCCommunityViewController alloc] initWithCollectionViewLayout:layout];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 03:
        {
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            SCCommunityViewController *vc = [[SCCommunityViewController alloc] initWithCollectionViewLayout:layout];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 04:// 投诉建议
        {
            adviceVC *vc = [adviceVC new];
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
