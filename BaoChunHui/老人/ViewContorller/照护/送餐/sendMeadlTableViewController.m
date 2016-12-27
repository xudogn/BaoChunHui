//
//  sendMeadlTableViewController.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/10.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "sendMeadlTableViewController.h"

@interface sendMeadlTableViewController ()

@end

@implementation sendMeadlTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableV = (UITableView *)self.view;
    UIView *containerV = [[UIView alloc] initWithFrame:self.view.frame];
    tableV.frame = tableV.bounds;
    self.view = containerV;
    [containerV addSubview:tableV];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH - 49, kScreenW, 49)];
    bottomView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:bottomView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 3;
    }
    return 2;
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = @"sdfsefs";
    
    
    return cell;
}

//- (UITableView *)tableView {
//    UIView *bottomView = [UIView ]
//}
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
