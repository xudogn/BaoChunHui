//
//  SearchViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface SearchViewController : UITableViewController






@property(nonatomic) ViewControllerType type;


- (instancetype)initWithStyle:(UITableViewStyle)style andViewControllerType:(ViewControllerType)type;


@end
