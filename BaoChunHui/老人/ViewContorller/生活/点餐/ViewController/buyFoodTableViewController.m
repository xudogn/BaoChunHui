//
//  buyFoodTableViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "buyFoodTableViewController.h"
#import "bannerAdView.h"
#import "ShopTableViewCell.h"
#import "buyFoodViewModel.h"

#import "shopInfoViewController.h"


@interface buyFoodTableViewController ()<bannerAdViewDelegate , bannerAdViewDataSource>

@property (nonatomic, strong)buyFoodViewModel *buyFoodVM;




@end

@implementation buyFoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    bannerAdView *bannerV = [[bannerAdView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    bannerV.delegate = self;
    bannerV.dataSource = self;
    self.tableView.tableHeaderView = bannerV;
    [bannerV reloadData];
    
    __weak __typeof(self)weakSelf = self;
    // 下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.buyFoodVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView reloadData];
                [weakSelf.tableView.mj_header endRefreshing];
                [bannerV reloadData];
            }else{
                NSLog(@"%@", error);
            }
        }];
    }];
    //[self.tableView.mj_header beginRefreshing];
    // 上拉加载
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.buyFoodVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView reloadData];
                [weakSelf.tableView.mj_footer endRefreshing];
            }else{
                NSLog(@"%@", error);
            }
        }];
    }];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"ShopTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"tableCell"];
    
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
    ShopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 200;
}

#pragma mark - bannerAdView delegate
- (void)bannerView:(UIView *)bannerView didSelectedAtIndex:(NSInteger)index{
    NSLog(@"banner %ld has been selected", index);
}

#pragma mark - bannerAdView ddataSource

- (NSURL *)iconUrlForItemInBannerView:(UIView *)bannerView atIndex:(NSInteger)index{
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"IMG_0413" ofType:@".jpg"];
//    return [NSURL fileURLWithPath:path];
    return [NSURL URLWithString:@"http://4493bz.1985t.com/uploads/allimg/150127/4-15012G52133.jpg"];
}

- (NSInteger)numberOfItemsInBannerView:(UIView *)bannerView{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    shopInfoViewController *vc = [[shopInfoViewController alloc] initWithNibName:@"shopInfoViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



-(buyFoodViewModel *)buyFoodVM{
    if (!_buyFoodVM) {
        _buyFoodVM = [[buyFoodViewModel alloc] init];
    }
    return _buyFoodVM;
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
