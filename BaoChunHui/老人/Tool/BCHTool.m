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



+ (void)addSearchBtnAndHelpBtnForVC:(UIViewController *)ViewContorller ViewControllerType:(ViewControllerType)type{
    
    
    
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
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item1.width = 60;
    ViewContorller.navigationItem.rightBarButtonItems = @[item1, item];
    
    
}

































@end
