//
//  ZHStationViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "ZHStationViewController.h"
#import "ZDzhaoHuViewController.h"
#import "StationLederViewController.h"
#import "BCHnaviViewController.h"
#import "ZDMineTableViewController.h"
#import "MineTableVC.h"//

@interface ZHStationViewController ()
@property (nonatomic) ZDzhaoHuViewController *liveVC;
@property (nonatomic) StationLederViewController *lederVC;
@property (nonatomic) ZDMineTableViewController *zdVC;
@property (nonatomic) MineTableVC *vc;
@end

@implementation ZHStationViewController
- (ZDzhaoHuViewController *)liveVC {
    if (!_liveVC) {
        _liveVC = [[ZDzhaoHuViewController alloc] init];
        _liveVC.navigationItem.title = @"生活";
        _liveVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _liveVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_life"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _liveVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_life_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _liveVC;
}
- (StationLederViewController *)lederVC {
    if (!_lederVC) {
        _lederVC = [[StationLederViewController alloc] init];
        _lederVC.navigationItem.title = @"站长";
        _lederVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _lederVC.tabBarItem.image = [[UIImage imageNamed:@"lederIcon1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _lederVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"lederIcon2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _lederVC;
}
- (ZDMineTableViewController *)zdVC {
    if (!_zdVC) {
        _zdVC = [UIStoryboard storyboardWithName:@"ZDMineVC" bundle:nil].instantiateInitialViewController;
        _zdVC.navigationItem.title = @"我的";
        _zdVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _zdVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _zdVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_mine_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _zdVC;
}
//- (MineTableVC *)vc {
//    if (!_vc) {
//        _vc = [MineTableVC alloc];
//    }
//    return _vc;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *navi0 = [[BCHnaviViewController alloc] initWithRootViewController:self.liveVC];
    navi0.navigationBar.barTintColor = [UIColor ZhaoHuColor];
    
    UINavigationController *navi1 = [[BCHnaviViewController alloc] initWithRootViewController:self.lederVC];
    navi1.navigationBar.barTintColor = [UIColor ZhaoHuColor];
    
    UINavigationController *navi2 = [[BCHnaviViewController alloc] initWithRootViewController:self.zdVC];
    navi2.navigationBar.barTintColor = [UIColor ZhaoHuColor];
    self.viewControllers = @[navi0,navi1,navi2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
