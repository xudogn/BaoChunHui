//
//  WenYiShiPinVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/9.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "WenYiShiPinVC.h"
#import "WenYiShiPinViewModel.h"
#import "ShiPinCell.h"
#import "AVViewController.h"


@interface WenYiShiPinVC ()

@property(nonatomic, strong) WenYiShiPinViewModel *viewModel;

@property(nonatomic, strong) UILabel *titleLb;

@property(nonatomic, strong) UIButton *moreBtn;


@property(nonatomic, strong) UIView *chooseView;

@property(nonatomic, strong) NSMutableArray *videoTypeArr;

@property(nonatomic, assign) BOOL more_flag;

@end

@implementation WenYiShiPinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNavigationBarTitle];
    [self.view showHUD];
    [self configRefreshview];
    UINib *nib = [UINib nibWithNibName:@"ShiPinCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    [TRFactory addBackItemForVC:self];
}

- (void)configRefreshview{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSInteger type =  [[[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"] intValue];
        [self.viewModel getNetRequestWithVideoType:type RequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                [self.view hideHUD];
            } else {
                [self.view showWarning:@"网络错误"];
            }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        NSInteger type =  [[[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"] intValue];
        [self.viewModel getNetRequestWithVideoType:type RequestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (!error) {
                [self.tableView reloadData];
                [self.view hideHUD];
            } else {
                [self.view showWarning:@"网络错误"];
            }
        }];
    }];
}

// 配置导航栏  titleView
- (void)configNavigationBarTitle{
    UIView *maskV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    self.titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 131, 44)];
    self.navigationItem.titleView = maskV;
    [maskV addSubview:self.titleLb];
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"]) {
        NSInteger type =  [[[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"] intValue];
        NSArray *array = @[@"烹饪指南", @"养花秘籍", @"琴棋书画", @"声乐戏曲"];
        self.titleLb.text = array[type];
    } else {
        [[NSUserDefaults standardUserDefaults] setValue:@(VideoType_PengRenZhiNan) forKey:@"videoType"];
    }
    self.titleLb.font = [UIFont systemFontOfSize:33];
    [self.titleLb sizeToFit];
    self.moreBtn = [self moreBtn];
    [maskV addSubview:self.moreBtn];
    self.moreBtn.frame = CGRectMake(160-24, 6, 32, 32);
}


- (UIButton *)moreBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"Icon_Classify"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(moreBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.more_flag = YES;
    return btn;
}
- (void)moreBtnClicked{
    if (self.more_flag) {
        [self.moreBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.chooseView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
        }];
    } else {
        [self.moreBtn setImage:[UIImage imageNamed:@"Icon_Classify"] forState:UIControlStateNormal];
        [self.chooseView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(-180);
        }];
    }
    self.more_flag = !self.more_flag;
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






// 选择分类view
- (UIView *)chooseView{
    if (!_chooseView) {
        _chooseView = [[UIView alloc] init];
        [self.view addSubview:_chooseView];
        [_chooseView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(-180);
            make.width.equalTo(160);
            make.height.equalTo(180);
        }];
        
        // 获取选择分类View的数据源
        self.videoTypeArr = [[NSMutableArray alloc] initWithObjects:@(VideoType_PengRenZhiNan), @(VideoType_YangHuaMiJi), @(VideoType_QinQiShuHUa), @(VideoType_ShengYueXiQu), nil];
        NSInteger type =  [[[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"] intValue];
        [self.videoTypeArr removeObjectAtIndex:type];
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"烹饪指南", @"养花秘籍", @"琴棋书画", @"声乐戏曲", nil];
        [array removeObjectAtIndex:type];
        
        // 循环添加3个分类button
        UIButton *lastBtn = nil;
        for (int i = 0; i<3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:array[i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:25];
            btn.tintColor = [UIColor blackColor];
            btn.tag = 100 + i;
            [btn addTarget:self  action:@selector(chooseTypeBtnclicked:) forControlEvents:UIControlEventTouchUpInside];
            [_chooseView addSubview:btn];
            if (i == 0) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                }];
            } else if(i == 1) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(0);
                    make.top.equalTo(lastBtn.mas_bottom).equalTo(0);
                }];
            } else if (i == 2) {
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.bottom.right.equalTo(0);
                }];
            }
            lastBtn = btn;
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(60);
            }];
        }
    }
    return _chooseView;
}

// 点击选择相应的分类btn 后执行逻辑
- (void)chooseTypeBtnclicked:(UIButton *)sender{
    NSInteger type =  [[[NSUserDefaults standardUserDefaults] valueForKey:@"VideoType"] intValue];
    [self.videoTypeArr removeObjectAtIndex:type];
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"烹饪指南", @"养花秘籍", @"琴棋书画", @"声乐戏曲", nil];
    [array removeObjectAtIndex:type];
    NSInteger index = sender.tag - 100;
    self.titleLb.text = array[index];
    VideoType videoType = [self.videoTypeArr[index] integerValue];
    
    //设置
    [[NSUserDefaults standardUserDefaults] setValue:@(videoType) forKey:@"videoType"];
    [self.view showHUD];
    [self.viewModel getNetRequestWithVideoType:videoType RequestMode:RequestModeRefresh completionHandler:^(NSError *error) {
        if (!error) {
            [self.tableView reloadData];
            [self.view hideHUD];
        } else {
            [self.view showWarning:@"网络错误"];
        }
    }];
}

- (WenYiShiPinViewModel *)viewModel{
    if (!_viewModel ) {
        _viewModel = [[WenYiShiPinViewModel alloc] init];
    }
    return _viewModel;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:255 g:207 b:74 alpha:1];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:52 g:213 b:198 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
