//
//  sheQuZhuLaoVCT.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "sheQuZhuLaoVCT.h"
#import "SCCommunityViewController.h"
#import "jiaMengVC.h"
#import "VideoTVC.h"

@interface sheQuZhuLaoVCT ()
@property(nonatomic, strong) NSArray *arr;
@end

@implementation sheQuZhuLaoVCT

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arr = @[@"爱心加盟", @"社区助老工程省级管委会", @"市级管理中心" , @"区县服务中心", @"社区照护站", @"省级培训学院", @"市县培训中心", @"生活服务+网络课程"];
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
    return self.arr.count;
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
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 01:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 02:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 03:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 04:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 05:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 06:
        {
            jiaMengVC *vc = [[jiaMengVC alloc] initWithNibName:@"jiaMengVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 07:
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
