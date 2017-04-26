//
//  QiangDanVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/24.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "QiangDanVC.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#define MapKey "bc5adfc3928d11f149e4d45a5061b481"


@interface QiangDanVC ()<MAMapViewDelegate, AMapLocationManagerDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@property(nonatomic, strong) AMapLocationManager *locationManager;


@end

@implementation QiangDanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self configMapView];
    [self configQiangDanView];
    
}

#pragma mark mapView

- (void)configMapView{
    [AMapServices sharedServices].enableHTTPS = YES;
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
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
        make.centerX.equalTo(0);
        make.bottom.equalTo(-100);
        make.size.equalTo(CGSizeMake(150, 150));
    }];
    btn.layer.cornerRadius = 75;
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
