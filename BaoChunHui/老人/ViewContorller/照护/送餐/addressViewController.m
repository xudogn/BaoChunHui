//
//  addressViewController.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/12.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "addressViewController.h"
#import "searchBarController.h"
#import "TRFactory.h"

@interface addressViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UIView *batteryView;
@property (nonatomic) UIView *topView;
@property (nonatomic) UIImageView *imageView1;
@property (nonatomic) UIImageView *imageView2;
@property (nonatomic) UIView *lineView;
@property (nonatomic) UITextField *textField1;
@property (nonatomic) UITextField *textField2;
@property (nonatomic) UIView *buttonView;
@property (nonatomic) UIButton *finishBtn;
@property (nonatomic) UITableView *tableView;
@end

@implementation addressViewController
- (UIView *)topView {
    if (_topView == nil) {
        _topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        [self.view addSubview:_topView];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}
- (UIImageView *)imageView1 {
    if (!_imageView1) {
        _imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_location"]];
        [_topView addSubview:_imageView1];
        [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(12);
            make.top.equalTo(12);
            make.width.equalTo(20);
            make.height.equalTo(26);
        }];
    }
    return _imageView1;
}
- (UITextField *)textField1 {
    if (!_textField1) {
        _textField1 = [[UITextField alloc] init];
        [_topView addSubview:_textField1];
        [_textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView1.mas_right).equalTo(12);
            make.right.equalTo(0);
            make.height.equalTo(30);
            make.centerY.equalTo(_imageView1);
        }];
        _textField1.font = [UIFont systemFontOfSize:25];
        _textField1.placeholder = @"所在小区、街道、大厦名";
        
        [_textField1 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchDown];
    }
    return _textField1;
}
- (void)push {
    searchBarController *vc = [[searchBarController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [_topView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.left.equalTo(12);
            make.right.equalTo(0);
            make.height.equalTo(1);
        }];
        _lineView.backgroundColor = kRGBA(224, 224, 224, 1);
    }
    return _lineView;
}
- (UIImageView *)imageView2 {
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"con_detail"]];
        [_topView addSubview:_imageView2];
        [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(20);
            make.left.equalTo(12);
            make.top.equalTo(_lineView.mas_bottom).equalTo(15);
        }];
    }
    return _imageView2;
}
- (UITextField *)textField2 {
    if (!_textField2) {
        _textField2 = [UITextField new];
        [_topView addSubview:_textField2];
        [_textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imageView2.mas_right).equalTo(12);
            make.centerY.equalTo(_imageView2);
            make.right.equalTo(0);
            make.height.equalTo(30);
        }];
        _textField2.font = [UIFont systemFontOfSize:25];
        _textField2.placeholder = @"详细楼栋门牌号";
        _textField2.textColor = kRGBA(26, 26, 26, 1);
    }
    return _textField2;
}
- (UIView *)buttonView {
    if (!_buttonView) {
//        _buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 192, kScreenW, 50)];
//        [self.view addSubview:_buttonView];
//        _buttonView.backgroundColor = [UIColor whiteColor];
        _buttonView = [UIView new];
        [self.view addSubview:_buttonView];
        [_buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_topView.mas_bottom).equalTo(22);
            make.left.right.equalTo(0);
            make.height.equalTo(50);
        }];
        _buttonView.backgroundColor = [UIColor whiteColor];
    }
    return _buttonView;
}
- (UIButton *)finishBtn {
    if (!_finishBtn) {
        _finishBtn = [UIButton new];
        [_buttonView addSubview:_finishBtn];
        [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.width.equalTo(80);
            make.height.equalTo(32);
            make.top.equalTo(14);
        }];
        [_finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_finishBtn setTitleColor:kRGBA(249, 110, 52, 1) forState:UIControlStateNormal];
        _finishBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        //_finishBtn.backgroundColor = [UIColor redColor];
    }
    return _finishBtn;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 228, kScreenW, kScreenH - 228) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return _tableView;
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(252, 110, 39, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    self.navigationItem.title = @"送餐地址";
    self.view.backgroundColor = kRGBA(245, 245, 245, 1);
    [self batteryView];
    [self topView];
    [self imageView1];
    [self textField1];
    [self lineView];
    [self imageView2];
    [self textField2];
    [self buttonView];
    [self finishBtn];
    [self tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}
- (void)viewDidAppear:(BOOL)animated {
//    self.navigationController.navigationBar.backgroundColor = kRGBA(249, 110, 52, 1);
}
- (void)viewDidDisappear:(BOOL)animated {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    label.text = @"从历史中选择";
    label.textColor = kRGBA(204, 204, 204, 1);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:24];
    return label;
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
//    view.backgroundColor = [UIColor redColor];
//    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"北京翠湖敬老院";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"翠湖别墅";
    }
    cell.textLabel.font = [UIFont systemFontOfSize:25];
    cell.textLabel.textColor = kRGBA(76, 76, 76, 1);
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
