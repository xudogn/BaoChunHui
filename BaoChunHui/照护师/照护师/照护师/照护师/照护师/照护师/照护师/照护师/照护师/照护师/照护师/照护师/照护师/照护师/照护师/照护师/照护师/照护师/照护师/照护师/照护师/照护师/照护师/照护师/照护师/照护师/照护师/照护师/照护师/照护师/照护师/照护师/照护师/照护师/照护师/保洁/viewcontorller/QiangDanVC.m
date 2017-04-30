//
//  QiangDanVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/24.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "QiangDanVC.h"
#import "QiangDanCell.h"
#import "QiangDanDetailVC.h"

#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#define MapKey "bc5adfc3928d11f149e4d45a5061b481"


@interface QiangDanVC ()<MAMapViewDelegate, AMapLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MAMapView *mapView;

@property(nonatomic, strong) AMapLocationManager *locationManager;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) NSMutableArray *datalist;


@end

@implementation QiangDanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self configMapView];
    [self configQiangDanView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, kScreenW, kScreenH * .5 - 60) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"QiangDanCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UILabel *lb = [UILabel new];
    for (int i = 0; i<6; i++) {
        [self.datalist addObject:lb];
    }
}

#pragma mark mapView

- (void)configMapView{
    [AMapServices sharedServices].enableHTTPS = YES;
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, kScreenH *.5, kScreenW, kScreenH*.5)];
    [self.view addSubview:_mapView];
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.delegate = self;
    //设置定位精度
    _mapView.desiredAccuracy = kCLLocationAccuracyBest;
    //设置定位距离
    _mapView.distanceFilter = 10.0f;
    [_mapView setZoomLevel:18 animated:YES];
    _mapView.pausesLocationUpdatesAutomatically = NO;
    //_mapView.allowsBackgroundLocationUpdates = YES;
    
    [_mapView setMapType:MAMapTypeStandard];
    _mapView.logoCenter = CGPointMake(CGRectGetWidth(self.view.bounds)-55, [UIScreen mainScreen].bounds.size.height - 60);
    _mapView.showsCompass= YES; // 设置成NO表示关闭指南针；YES表示显示指南针
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22); //设置指南针位置
    _mapView.showsScale= YES;  //设置成NO表示不显示比例尺；YES表示显示比例尺
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);  //设置比例尺位置
    
    
    _mapView.rotateCameraEnabled= NO;
    _mapView.distanceFilter = 10;
}


#pragma mark 开始抢单view

- (void)configQiangDanView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-20);
        make.bottom.equalTo(-60);
        make.size.equalTo(CGSizeMake(80, 80));
    }];
    btn.layer.cornerRadius = 40;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开始抢单" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnclicked:(UIButton *)sender{
    NSString *str = sender.titleLabel.text;
    if ([str isEqualToString:@"开始抢单"]) {
        // 向服务器发送 接单请求
        
        [self.locationManager startUpdatingLocation];
        [sender setTitle:@"结束抢单" forState:UIControlStateNormal];
    } else {
        
        
        [self.locationManager stopUpdatingLocation];
        [sender setTitle:@"开始抢单" forState:UIControlStateNormal];
    }
}

// 添加自己为中心按钮



#pragma  mark MAP delegate

- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
    [self.mapView setCenterCoordinate:location.coordinate];
}

#pragma mark tableview datasourse

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datalist.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QiangDanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //[cell.imgV setImageWithURL:<#(nonnull NSURL *)#> placeholderImage:<#(nullable UIImage *)#>];
    //cell.distenceLb.text =
    //cell.timeLb.text =
    
    [cell.qiangDanBtn bk_addEventHandler:^(UIButton *sender) {
        [sender setTitle:@"处理中" forState:UIControlStateNormal];
        [self qiangDanBtnClicked:indexPath];
    } forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)qiangDanBtnClicked:(NSIndexPath *)indexPath{
    
    // 抢单动作执行
    
    
    NSLog(@"%ld, %ld", indexPath.row, indexPath.section);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}


#pragma mark tableview delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QiangDanDetailVC *vc = [[QiangDanDetailVC alloc] initWithNibName:@"QiangDanDetailVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}




- (NSMutableArray *)datalist{
    if (!_datalist) {
        _datalist = [[NSMutableArray alloc] init];
        
    }
    return _datalist;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
