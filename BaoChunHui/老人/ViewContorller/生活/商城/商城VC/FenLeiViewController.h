//
//  FenLeiViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/14.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FenLeiViewController : UITableViewController

@property(nonatomic) ViewControllerType type;
@property(nonatomic) NSInteger sort_id;


- (instancetype)initWithSortID:(NSInteger)sort_id ViewControllerType:(ViewControllerType)type;


@end
