//
//  FenLeiViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/14.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "FenLeiViewController.h"
#import "shangChengCell.h"
#import "goodsDetailViewController.h"
#import "FenLeiViewModel.h"


@interface FenLeiViewController ()

@property(nonatomic,strong) FenLeiViewModel *fenleiVM;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *datalist;

@end

@implementation FenLeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJWeakSelf
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.fenleiVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            self.datalist = weakSelf.fenleiVM.datalist;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    }];
    
    self.tableView.mj_footer  = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.fenleiVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    [self.tableView registerClass:[shangChengCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Receive memory warning");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shangChengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.imgV sd_setImageWithURL:[NSURL URLWithString:self.datalist[indexPath.row].goods_url] placeholderImage:[UIImage imageNamed:@""]];
    cell.goods_name.text = self.datalist[indexPath.row].goods_name;
    cell.goods_price.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row].goods_price];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 144;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    goodsDetailViewController *vc = [[goodsDetailViewController alloc] initWithGoodsModel:self.datalist[indexPath.row] ViewControllerType:self.type];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


- (FenLeiViewModel *)fenleiVM{
    if (!_fenleiVM) {
        _fenleiVM = [[FenLeiViewModel alloc] init];
    }
    return _fenleiVM;
}

- (NSMutableArray<goodsModel *> *)datalist{
    if (!_datalist) {
        _datalist = [[NSMutableArray<goodsModel *>  alloc]init];
    }
    return _datalist;
}

- (instancetype)initWithSortID:(NSInteger)sort_id ViewControllerType:(ViewControllerType)type{
    self = [super init];
    if (self) {
        self.type = type;
        self.sort_id = sort_id;
    }
    return self;
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
