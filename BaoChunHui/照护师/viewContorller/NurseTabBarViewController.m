//
//  NurseTabBarViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "NurseTabBarViewController.h"
#import "MineTableVC.h"
#import "QiangDanVC.h"
#import "BCHnaviViewController.h"

@interface NurseTabBarViewController ()

@property(nonatomic, strong) MineTableVC *mineVC;

@property(nonatomic, strong) QiangDanVC *qiangDanVC;



@end

@implementation NurseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BCHnaviViewController *navi1 = [[BCHnaviViewController alloc] initWithRootViewController:self.qiangDanVC];
    navi1.navigationBar.barTintColor = [UIColor ShengHuoColor];
    BCHnaviViewController *navi2 = [[BCHnaviViewController alloc] initWithRootViewController:self.mineVC];
    navi2.navigationBar.barTintColor = [UIColor ShengHuoColor];
    self.viewControllers = @[navi1, navi2];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:PartOfService] forKey:@"obviousModule"];
}


- (MineTableVC *)mineVC {
    if (!_mineVC) {
        _mineVC = [UIStoryboard storyboardWithName:@"MineStoryboard" bundle:nil].instantiateInitialViewController;
        _mineVC.navigationItem.title = @"我的";
        
        _mineVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _mineVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _mineVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_mine_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _mineVC;
}

- (QiangDanVC *)qiangDanVC{
    if (!_qiangDanVC) {
        _qiangDanVC = [QiangDanVC new];
        _qiangDanVC.navigationItem.title = @"抢单";
        _qiangDanVC.tabBarItem.title = @"抢单";
        /*_qiangDanVC.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
        _qiangDanVC.tabBarItem.image = [[UIImage imageNamed:@"TabBar_life"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _qiangDanVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"TabBar_life_pre"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];*/
    }
    return _qiangDanVC;
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
