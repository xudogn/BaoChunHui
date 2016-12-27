//
//  BCHTool.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "gouWuCheView.h"

@class goodsModel;
@interface BCHTool : NSObject





// 自定义返回按钮
+ (void)addBackBtnItemForVC:(UIViewController *)ViewController;



//  添加紧急呼救按钮
+ (void)addHelpBtnItemForVC:(UIViewController *)ViewContorller;
+ (UIBarButtonItem *)configHelpBtnItemForVC:(UIViewController *)ViewContorller;

//  添加搜索按钮
+ (void)addSearchBtnAndHelpBtnForVC:(UIViewController *)ViewContorller ViewControllerType:(ViewControllerType)type;




















@end
