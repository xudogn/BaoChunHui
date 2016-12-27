//
//  shangChengVC.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shangChengVC.h"
#import "shangChengCell.h"
#import "bannerAdView.h"

#import "shangChengViewModel.h"
#import "SectionReusableView.h"
#import "goodsDetailViewController.h"
#import "FenLeiViewController.h"


@interface shangChengVC ()<bannerAdViewDelegate ,bannerAdViewDataSource>

@property (nonatomic, strong) shangChengViewModel *shangCVM;

@property(nonatomic, strong) bannerAdView *bannerAdV;

@end

@implementation shangChengVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [BCHTool addSearchBtnAndHelpBtnForVC:self ViewControllerType:ViewControllerType_shangCheng];
    
    
    
    bannerAdView *bannerV = [[bannerAdView alloc] initWithFrame:CGRectMake(0, 0, 0, 112)];
    bannerV.delegate = self;
    bannerV.dataSource = self;
    self.tableView.tableHeaderView = bannerV;
    //[self.tableView showHUD];
    __weak __typeof(self)weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.shangCVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView hideHUD];
        }];
    }];
    
    //[self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        [weakSelf.tableView.mj_footer endRefreshing];
        [weakSelf.tableView reloadData];
    }];
    
    
    [self.tableView registerClass:[shangChengCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView.backgroundColor = [UIColor colorWithRed:245/155.0 green:245/155.0 blue:245/155.0 alpha:1];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shangChengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.goods_name.text = @"名字名字名字名字名字";
    cell.goods_price.text = @"888.00";
    cell.imgV.image = [UIImage imageNamed:@"manhua"];
    return cell;
}


- (shangChengViewModel *)shangCVM{
    if (!_shangCVM) {
        _shangCVM = [[shangChengViewModel alloc] init];
    }
    return _shangCVM;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 144;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 跳转商品详情页
#warning change back
    //goodsModel *goods = self.shangCVM.sort_arr[indexPath.section].goods_arr[indexPath.row];
    goodsModel *goods = [goodsModel new];
    goods.goods_name = @"名字";
    goods.goods_price = 13;
    goods.goods_number = 1;
    goods.goods_id = 1000003;
    goods.goods_sort = 2000001;
    StandardDetailModel *deM = [StandardDetailModel new];
    deM.standard_detail_name = @"白色";
    deM.standard_detail_price = 1;
    StandardDetailModel *deM1 = [StandardDetailModel new];
    deM1.standard_detail_name = @"蓝色";
    deM1.standard_detail_price = -1;
    StandardModel *sM = [[StandardModel alloc]init];
    sM.standard_name = @"颜色";
    sM.standard_detail_arr = @[deM, deM1];
    
    goods.standard_arr = @[sM];
    goodsDetailViewController *vc = [[goodsDetailViewController alloc] initWithGoodsModel:goods ViewControllerType:self.type];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionReusableView *view = [[SectionReusableView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 52)];
    view.backgroundColor = [UIColor whiteColor]; 
    view.section = section;
    view.sectionTitle.text = @"分类分类";
    view.moreBtnClicked = ^(NSInteger section){
        // 跳转到 相应分类里
        
        FenLeiViewController *vc = [[FenLeiViewController alloc] initWithSortID:[self.shangCVM sort_idOfSectionAtIndexpath:section] ViewControllerType:self.type];
        vc.view.backgroundColor = [UIColor orangeColor];
        [self.navigationController pushViewController:vc animated:YES];
    };
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 12;
}

#pragma bannerAdView  datasourse  /  delegate

- (NSInteger)numberOfItemsInBannerView:(UIView *)bannerView{
    return [self.shangCVM numberOfBannerAdView];
}
- (NSURL *)iconUrlForItemInBannerView:(UIView *)bannerView atIndex:(NSInteger)index{
    return [self.shangCVM urlOfBannerAdViewAtIndex:index];
}

- (void)bannerView:(UIView *)bannerView didSelectedAtIndex:(NSInteger)index{
#warning 添加 点击跳转方向  add
    NSLog(@"点击了banner%ld", index);
}


#pragma 懒加载

- (instancetype)initWithViewContorllerType:(ViewControllerType)type{
    self = [super init];
    if (self) {
        self.type = type;
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
