//
//  SearchViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SearchViewController.h"
#import "shangChengCell.h"
#import "SearchModel.h"
#import "goodsDetailViewController.h"



@interface SearchViewController ()<UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;

@property(nonatomic, strong) UIButton *searchBtn;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *dataList;

@property(nonatomic) BOOL has_more;

@property(nonatomic) NSInteger page;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configSearchBarAndBtn];
    
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        if (self.has_more) {
            self.page++;
            [self getDataFromNet];
        }
    }];
    
    
    [self.tableView registerClass:[shangChengCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (void)configSearchBarAndBtn{
    
    UIBarButtonItem *helpItem = [BCHTool configHelpBtnItemForVC:self];
    // searchBar宽度
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth-200 , 30)];
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    // search btn
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.searchBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    self.searchBtn.frame = CGRectMake(0, 0, 50, 30);   // frame
    self.searchBtn.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.searchBtn];
    self.navigationItem.rightBarButtonItems = @[helpItem, item];
    
    
    
    [self.searchBtn bk_addEventHandler:^(id sender) {
        //  上网获取  搜索结果
        self.page = 0;
        [self.dataList removeAllObjects];
        [self.tableView reloadData];
        [self.searchBar resignFirstResponder];
        [self getDataFromNet];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
}



- (void)getDataFromNet{
    
    NSString *path = nil;
    switch (self.type) {
        case ViewControllerType_dianCai:
            path = kSearchPathFromDianCai;              
            break;
        case ViewControllerType_bianLiDian:
            path = kSearchPathFromBianLiDian;
            break;
        case ViewControllerType_shangCheng:
            path = kSearchPathFromShangCheng;
            break;
        case ViewControllerType_Zudao:
            path = @"";
            break;
            
        default:
            break;
    }
    
    [self netManagerWith:path];
    
}

- (void)netManagerWith:(NSString *)path{
    NSLog(@"%@", self.searchBar.text);
    
    NSDictionary *dic = @{@"search_text":self.searchBar.text, @"page":[NSString stringWithFormat:@"%ld", self.page]};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:path parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        SearchModel *model = [SearchModel parse:responseObject];
        self.dataList = model.datalist;
        self.has_more = model.has_more;
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Search %@ fail", self.searchBar.text);
    }];
}







- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//self.dataList.count ? 1 : 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;//self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shangChengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.goods_name.text = @"namenamename";
    cell.goods_price.text = @"888";
    cell.imgV.image = [UIImage imageNamed:@""];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 跳转商品详情页
    
    goodsDetailViewController *vc = [goodsDetailViewController new];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style andViewControllerType:(ViewControllerType)type{
    self = [super initWithStyle:style];
    if (self) {
        self.type = type;
    }
    return self;
}

- (NSMutableArray<goodsModel *> *)dataList{
    if (!_dataList) {
        _dataList = [[NSMutableArray<goodsModel *> alloc] init];
    }
    return _dataList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
