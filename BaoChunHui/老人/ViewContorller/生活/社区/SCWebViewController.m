//
//  SCWebViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SCWebViewController.h"

@interface SCWebViewController ()<UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;

@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIButton *shareBtn;
@property (nonatomic) UIButton *collectBtn;
@property (nonatomic) UILabel *shareLb;
@property (nonatomic) UILabel *collectLb;
@end

@implementation SCWebViewController
- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        [self.view addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(50);
        }];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton new];
        [self.bottomView addSubview:_shareBtn];
        [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(50);
            make.centerY.equalTo(_bottomView);
            make.size.equalTo(24);
        }];
        [_shareBtn setImage:[UIImage imageNamed:@"con_share"] forState:UIControlStateNormal];
        [_shareBtn setImage:[UIImage imageNamed:@"list_share"] forState:UIControlStateHighlighted];
    }
    return _shareBtn;
}
- (UILabel *)shareLb {
    if (!_shareLb) {
        _shareLb = [UILabel new];
        [self.bottomView addSubview:_shareLb];
        [_shareLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_shareBtn.mas_right).equalTo(12);
            make.height.equalTo(28);
            make.width.equalTo(57);
            make.centerY.equalTo(_bottomView);
        }];
        _shareLb.text = @"分享";
        _shareLb.font = [UIFont systemFontOfSize:28];
    }
    return _shareLb;
}
- (UILabel *)collectLb {
    if (!_collectLb) {
        _collectLb = [UILabel new];
        [self.bottomView addSubview:_collectLb];
        [_collectLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-50);
            make.centerY.equalTo(_bottomView);
            make.width.equalTo(57);
            make.height.equalTo(28);
        }];
    }
    _collectLb.text = @"收藏";
    _collectLb.font = [UIFont systemFontOfSize:28];
    _collectLb.textAlignment = NSTextAlignmentRight;
    return _collectLb;
}
- (UIButton *)collectBtn {
    if (!_collectBtn) {
        _collectBtn = [UIButton new];
        [self.bottomView addSubview:_collectBtn];
        [_collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.collectLb.mas_left).equalTo(-12);
            make.size.equalTo(24);
            make.centerY.equalTo(_bottomView);
        }];
        [_collectBtn setImage:[UIImage imageNamed:@"con_collection"] forState:UIControlStateNormal];
        [_collectBtn setImage:[UIImage imageNamed:@"con_collection_pre"] forState:UIControlStateSelected];
        [_collectBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _collectBtn;
}
- (void)btnAction:(UIButton *)button {
    button.selected = !button.selected;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"社区信息";
    [TRFactory addBackItemForVC:self];
    [self.view showWarning:@"等待数据获取加载"];
    self.view.backgroundColor = kRGBA(245, 245, 245, 1);
    [self bottomView];
    [self shareBtn];
    [self shareLb];
    [self collectBtn];
    [self collectLb];
    [_collectBtn setImage:[UIImage imageNamed:@"con_collection_pre"] forState:UIControlStateSelected];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#feaale"];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
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
