//
//  BCHTool.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BCHTool.h"
#import "SearchViewController.h"





@implementation BCHTool

+(void)addBackBtnItemForVC:(UIViewController *)ViewController{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [btn bk_addEventHandler:^(id sender) {
        [ViewController.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    ViewController.navigationItem.leftBarButtonItem = item;
    
}

+(void)addHelpBtnItemForVC:(UIViewController *)ViewContorller{
    
    ViewContorller.navigationItem.rightBarButtonItem = [self configHelpBtnItemForVC:ViewContorller];
    
}

+ (UIBarButtonItem *)configHelpBtnItemForVC:(UIViewController *)ViewContorller{
    UIButton *HelpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    HelpBtn.frame = CGRectMake(0, 0, 80, 30);
    HelpBtn.backgroundColor = [UIColor orangeColor];
    [HelpBtn setTitle:@"呼救" forState:UIControlStateNormal];
    HelpBtn.titleLabel.font = [UIFont systemFontOfSize:30];
    HelpBtn.titleLabel.numberOfLines = 0;
    
    [HelpBtn bk_addEventHandler:^(id sender) {
        // 一键呼救
        // 1. 打电话
        //    NSString *tele = [[NSUserDefaults standardUserDefaults] objectForKey:@"teleNum"];
        //    NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];
#warning change telenumber
        NSURL *url = [NSURL URLWithString:@"tel://10086"];
        // zhijie bo da
        //[[UIApplication sharedApplication] openURL:url];
        
        // 打完电话可回来~~~~~~
        UIWebView *webView = [[UIWebView alloc] init];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        [ViewContorller.view addSubview:webView];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithCustomView:HelpBtn];
    return helpItem;
}

+ (void)addSearchBtnAndHelpBtnForVC:(UIViewController *)ViewContorller ViewControllerType:(ViewControllerType)type{
    
    UIBarButtonItem *helpItem = [self configHelpBtnItemForVC:ViewContorller];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 100, 30);
    btn.backgroundColor = [UIColor redColor];
    [btn bk_addEventHandler:^(id sender) {
        //  推出搜索ViewController
        SearchViewController *vc = [[SearchViewController alloc] initWithStyle:UITableViewStylePlain andViewControllerType:type];
        vc.hidesBottomBarWhenPushed = YES;
        [ViewContorller.navigationController pushViewController:vc animated:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    ViewContorller.navigationItem.rightBarButtonItems = @[helpItem, item];
    
}

































@end
