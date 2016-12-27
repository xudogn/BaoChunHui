//
//  MineTableViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "MineTableViewController.h"

#import "certifyViewController.h"
#import "CardTableViewController.h"
#import "scoreShopViewController.h"
#import "aboutViewController.h"
#import "ViewController.h"


#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>



@interface MineTableViewController ()

@end

@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [BCHTool addHelpBtnItemForVC:self];
    
    
    
    
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
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
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
        case 1:
            switch (indexPath.row) {
                case 0:
                    // 分享
                    [self shareCellClicked];
                    break;
                case 1:
                    // 积分
                {
                    scoreShopViewController *vc = [[scoreShopViewController alloc] init];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 2:
                    // 实名认证
                {
                    certifyViewController *vc = [[certifyViewController alloc] initWithNibName:@"certifyViewController" bundle:nil];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    // 切换
                {
                    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainModule"];
                    [self.navigationController presentViewController:vc animated:YES completion:nil];
                }
                    break;
                case 1:
                    // 关于
                {
                    aboutViewController *vc = [[aboutViewController alloc] initWithNibName:@"aboutViewController" bundle:nil];
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








/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:  forIndexPath:indexPath];
 
    // Configure the cell...
 
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
