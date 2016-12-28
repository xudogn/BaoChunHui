//
//  Add_EditShouHuoDiZhiVC.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "Add_EditShouHuoDiZhiVC.h"

@interface Add_EditShouHuoDiZhiVC ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIButton *bottomBtn;

@property(nonatomic) BOOL isEdit;


@end

@implementation Add_EditShouHuoDiZhiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}











#pragma life cycle

- (instancetype)initWithVCtype:(VCtype)type{
    self = [super init];
    if (self) {
        if (type == Edit) {
            self.isEdit = YES;
        }else{
            self.isEdit = NO;
        }
    }
    return self;
}




#pragma lazy load




- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.bottom.equalTo(self.bottomBtn.mas_top).equalTo(0);
        }];
    }
    return _tableView;
}


- (UIButton *)bottomBtn{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_bottomBtn setBackgroundColor:[UIColor ShengHuoColor]];
        [_bottomBtn setTitle:@"添加新地址" forState:UIControlStateNormal];
        _bottomBtn.titleLabel.font = [UIFont systemFontOfSize:28];
        _bottomBtn.titleLabel.textColor = [UIColor whiteColor];
        [self.view addSubview:_bottomBtn];
        [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(49);
        }];
        [_bottomBtn addTarget:self action:@selector(bottomBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (void)bottomBtnClicked{
    NSLog(@"bottombtn clicked");
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"添加收货地址 内存警告");
}
@end


