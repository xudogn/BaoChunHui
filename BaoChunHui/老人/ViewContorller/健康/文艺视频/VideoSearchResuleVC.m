//
//  VideoSearchResuleVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/12.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "VideoSearchResuleVC.h"
#import "WenYiShiPinViewModel.h"
#import "ShiPinCell.h"
#import "AVViewController.h"

@interface VideoSearchResuleVC ()

@property(nonatomic, strong) WenYiShiPinViewModel *viewModel;

@end

@implementation VideoSearchResuleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configRefreshview];
    
    [TRFactory addBackItemForVC:self];
    self.navigationItem.title = @"搜索";
    kSetNaviBarItemTitleFontAndColor
    self.tableView.tableFooterView = [UIView new];
}

- (void)configRefreshview{
    MJWeakSelf
    [self.viewModel getNetRequestWithSearchText:self.searchText RequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
        if (!error) {
            [weakSelf.tableView reloadData];
            [weakSelf.view hideHUD];
        } else {
            [weakSelf.view showWarning:@"网络错误"];
        }
    }];
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.viewModel getNetRequestWithSearchText:self.searchText RequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView reloadData];
                [weakSelf.view hideHUD];
                [weakSelf.tableView.mj_footer endRefreshing];
            } else {
                [self.view showWarning:@"网络错误"];
                [weakSelf.tableView.mj_footer endRefreshing];
            }
        }];
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.datalist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShiPinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.title.text = [self.viewModel titleAtIndex:indexPath.row];
    [cell.imageV sd_setImageWithURL:[self.viewModel imageURLAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@""]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 223;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AVViewController *vc = [[AVViewController alloc] initWithURL:[self.viewModel videoURLAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}



- (WenYiShiPinViewModel *)viewModel{
    if (!_viewModel ) {
        _viewModel = [[WenYiShiPinViewModel alloc] init];
    }
    return _viewModel;
}

- (instancetype)initWithSearchText:(NSString *)searchTest{
    self = [super init];
    if (self ) {
        self.searchText = searchTest;
    }
    return self;
}



@end
