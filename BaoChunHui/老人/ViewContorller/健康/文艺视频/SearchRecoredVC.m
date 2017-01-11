//
//  SearchRecoredVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/10.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SearchRecoredVC.h"

@interface SearchRecoredVC ()<UISearchBarDelegate>

@property(nonatomic, strong)UISearchBar *searchBar;

@end

@implementation SearchRecoredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSearchBar];
    [TRFactory addBackItemForVC:self];
    self.view.backgroundColor = [UIColor colorWithR:245 g:245 b:245 alpha:1];
}

- (void)configSearchBar{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth - 90, 44)];
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入关键字";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
}

- (void)addsearchRecordView{
    UILabel *historyLb = [[UILabel alloc] initWithFrame:CGRectMake(12, 24, 110, 52)];
    historyLb.text = @"历史记录";
    historyLb.font = [UIFont systemFontOfSize:28];
    [historyLb sizeToFit];
    historyLb.textColor = [UIColor colorWithHexString:@"1a1a1a"];
    [self.view addSubview:historyLb];
    
    
    
    
    
    
    
    
    
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:255 g:207 b:74 alpha:1];
}

@end
