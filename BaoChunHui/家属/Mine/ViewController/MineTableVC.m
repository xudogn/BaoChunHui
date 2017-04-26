//
//  MineTableVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/17.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "MineTableVC.h"
#import "settingTVC.h"
#import "certifyViewController.h"
#import "ShiMingRenZhengVC.h"

#import "CardTableViewController.h"
#import "scoreShopViewController.h"
#import "shangChengVC.h"
#import "aboutViewController.h"
#import "ViewController.h"
#import "GouWuCheViewController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>



@interface MineTableVC ()

@end

@implementation MineTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 | section == 1 ) {
        return 2;
    }else return 4;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    // 生活订单
                {
                    GouWuCheViewController *gwcVC = [[GouWuCheViewController alloc] initWithStyle:UITableViewStyleGrouped ViewContorllerType:0];
                    [self.navigationController pushViewController:gwcVC animated:YES];
                }
                    break;
                case 1:
                    // 照护订单
                {
                    GouWuCheViewController *gwcVC = [[GouWuCheViewController alloc] initWithStyle:UITableViewStyleGrouped ViewContorllerType:0];
                    [self.navigationController pushViewController:gwcVC animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                {
                    CardTableViewController *vc = [[CardTableViewController alloc] initWithNibName:@"CardTableViewController" bundle:nil];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                    
                default:
                    [self CallTeleNum];
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    // 分享
                    [self shareCellClicked];
                    break;
                case 1:
                    // 积分
                {
                    shangChengVC *vc = [[shangChengVC alloc] initWithViewContorllerType:ViewControllerType_shangCheng];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 2:
                    // 实名认证
                {
                    ShiMingRenZhengVC *vc = [[ShiMingRenZhengVC alloc] initWithNibName:NSStringFromClass([ShiMingRenZhengVC class]) bundle:nil];
                    //certifyViewController *vc = [[certifyViewController alloc] initWithNibName:@"certifyViewController" bundle:nil];
                    vc.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 3:
                {
                    // 设置
                    settingTVC *vc = [UIStoryboard storyboardWithName:@"settingTVC" bundle:nil].instantiateInitialViewController;
                    [self.navigationController pushViewController:vc animated:YES];
                    
                }
                    break;
                default:
                    break;
            }
            break;
        
            
        default:
            break;
    }
}



- (void)shareCellClicked{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"IMG_0412"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        NSString *str2 = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@",  @"954270"];// id = baochunhui
#warning change id
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"老有所依"
                                         images:imageArray
                                            url:[NSURL URLWithString:str2]
                                          title:@"报春晖"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}

// 打电话 Cell
- (void)CallTeleNum{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"电话" message:@"拨打电话" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *actFamily = [UIAlertAction actionWithTitle:@"家属" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打电话
        
        NSString *tele = [userModel defaultsUserModel].emergency_contact;
        if (!tele) {// 判断家属电话是否存在
            // 弹出提示框，不存在号码
            
            return ;
        }
        NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];
        
        NSURL *url = [NSURL URLWithString:teleNum];//@"tel://18513114121"
        // zhijie bo da
        //[[UIApplication sharedApplication] openURL:url];
        
        // 打完电话可回来~~~~~~
        UIWebView *webView = [[UIWebView alloc] init];
        
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [self.view addSubview:webView];
    }];
    UIAlertAction *actStationy = [UIAlertAction actionWithTitle:@"站点" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *tele = [userModel defaultsUserModel].teleNum_CareStation;
        if (!tele) {// 判断家属电话是否存在
            // 弹出提示框，不存在号码
            
            return ;
        }
        NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];
        
        NSURL *url = [NSURL URLWithString:teleNum];//@"tel://18513114121"
        // zhijie bo da
        //[[UIApplication sharedApplication] openURL:url];
        
        // 打完电话可回来~~~~~~
        UIWebView *webView = [[UIWebView alloc] init];
        
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [self.view addSubview:webView];
    }];
    UIAlertAction *actSystem = [UIAlertAction actionWithTitle:@"系统" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *tele = [userModel defaultsUserModel].teleNUm_System;
        if (!tele) {// 判断家属电话是否存在
            // 弹出提示框，不存在号码
            
            return ;
        }
        NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];
        
        NSURL *url = [NSURL URLWithString:teleNum];//@"tel://18513114121"
        // zhijie bo da
        //[[UIApplication sharedApplication] openURL:url];
        
        // 打完电话可回来~~~~~~
        UIWebView *webView = [[UIWebView alloc] init];
        
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [self.view addSubview:webView];
    }];
    UIAlertAction *actCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertC dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertC addAction:actFamily];
    [alertC addAction:actStationy];
    [alertC addAction:actSystem];
    [alertC addAction:actCancel];
    [self.navigationController presentViewController:alertC animated:YES completion:nil];
}






@end
