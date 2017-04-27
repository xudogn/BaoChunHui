//
//  TRFactory.m
//  GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRFactory.h"

@implementation TRFactory
+ (void)addAlertViewForVC:(UIViewController *)vc clickedHandler:(void (^)())handler {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"Icon_Classify"] forState:UIControlStateNormal];
    //[backBtn setBackgroundImage:[UIImage imageNamed:@"con_collection_pr"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    //    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(vc.navigationItem.titleView.mas_right);
    //        make.size.equalTo(44);
    //        make.centerY.equalTo(vc.navigationController.navigationBar);
    //    }];
    
    [backBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    //配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 50;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, backItem];
    
}

+ (void)addCollectInfoForVC:(UIViewController *)vc clickedHandler:(void (^)())handler {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"NavBar_collection"] forState:UIControlStateNormal];
    //[backBtn setBackgroundImage:[UIImage imageNamed:@"con_collection_pr"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    //配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 30;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, backItem];
}

+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void (^)())handler{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"搜索_按下"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"搜索_默认"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        !handler ?: handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    //配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -12;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, backItem];
}


+ (void)addBackItemForVC:(UIViewController *)vc{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"btn_back_selected"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 45, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    //配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -12;
    vc.navigationItem.leftBarButtonItems = @[spaceItem, backItem];
}
@end
