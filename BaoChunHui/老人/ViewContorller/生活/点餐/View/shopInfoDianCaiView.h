//
//  shopInfoDianCaiView.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "foodClassModel.h"



@interface shopInfoDianCaiView : UIView


@property(nonatomic, strong) UITableView *classTableV;
@property(nonatomic, strong) UITableView *foodTableV;

@property(nonatomic, strong) NSMutableArray<NSMutableArray<foodListModel *> *> *classArr;

//@property(nonatomic, strong) NSMutableArray<foodListModel *> *foodList;









- (void)reloadData;



@end
