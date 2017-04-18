//
//  FamilyTabBarViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "FamilyTabBarViewController.h"
#import "BCHnaviViewController.h"
#import "MineTableVC.h"
#import "LiveViewController.h"
#import "zhaoHuViewController.h"
#import "MapVC.h"

@interface FamilyTabBarViewController ()

@property(nonatomic, strong) LiveViewController *liveVC;

@property(nonatomic, strong) zhaoHuViewController *zhaohuVC;

@property(nonatomic, strong) MapVC *mapVC;

@property(nonatomic, strong) MineTableVC *mineVC;




@end

@implementation FamilyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:PartOfFamily] forKey:@"obviousModule"];
    
    UINavigationController *navi0 = [[BCHnaviViewController alloc] initWithRootViewController:self.liveVC];
    
    navi0.navigationBar.barTintColor = [UIColor ShengHuoColor];
    UINavigationController *navi1 = [[BCHnaviViewController alloc] initWithRootViewController:self.zhaohuVC];
    navi1.navigationBar.barTintColor = [UIColor ZhaoHuColor];
    
    UINavigationController *navi2 = [[BCHnaviViewController alloc] initWithRootViewController:self.mapVC];
    navi2.navigationBar.barTintColor = [UIColor ShengHuoColor];
    
    UINavigationController *navi3 = [[BCHnaviViewController alloc] initWithRootViewController:self.mineVC];
    navi3.navigationBar.barTintColor = [UIColor ShengHuoColor];
    self.viewControllers = @[navi0, navi1, navi2, navi3];
    
    
    
    
    
    
}



#pragma mark -- lazyLoading

- (LiveViewController *)liveVC{
    if (!_liveVC) {
        _liveVC = [[LiveViewController alloc] init];
        _liveVC.navigationItem.title = @"生活";
        _liveVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _liveVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_life"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _liveVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_life_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _liveVC;
}

- (zhaoHuViewController *)zhaohuVC{
    if (!_zhaohuVC) {
        _zhaohuVC = [[zhaoHuViewController alloc] init];
        _zhaohuVC.navigationItem.title = @"照护";
        _zhaohuVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _zhaohuVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_care"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _zhaohuVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_care_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _zhaohuVC;
}

- (MapVC *)mapVC{
    if (!_mapVC) {
        _mapVC = [MapVC new];
        _mapVC.navigationItem.title = @"监控";
        _mapVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _mapVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_care"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mapVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_care_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mapVC;
}

- (MineTableVC *)mineVC{
    if (!_mineVC) {
        _mineVC = [UIStoryboard storyboardWithName:@"MineTVC" bundle:nil].instantiateInitialViewController;
        _mineVC.navigationItem.title = @"我的";
        _mineVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _mineVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_mine_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineVC;
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
