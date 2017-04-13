//
//  VideoSearchResuleVC.h
//  BaoChunHui
//
//  Created by xudogn on 17/1/12.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoSearchResuleVC : UITableViewController

@property(nonatomic, strong) NSString *searchText;

- (instancetype)initWithSearchText:(NSString *)searchTest;


@end
