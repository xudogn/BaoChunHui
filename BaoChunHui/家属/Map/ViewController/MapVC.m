//
//  MapVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "MapVC.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#define MapKey "bc5adfc3928d11f149e4d45a5061b481"
#define kWindowWidth [UIScreen mainScreen].bounds.size.width
#define kWindowHeight [UIScreen mainScreen].bounds.size.height

@interface MapVC ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self configMapView];
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)) {
        
        //定位功能可用
        
    }else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        
        //定位不能用
        
    }
    
}

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
