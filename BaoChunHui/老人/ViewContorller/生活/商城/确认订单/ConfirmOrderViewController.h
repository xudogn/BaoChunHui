//
//  ConfirmOrderViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/10.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmOrderViewController : UIViewController


@property(nonatomic) ViewControllerType type;

- (instancetype)initWithVicwControllerType:(ViewControllerType)type datalist:(NSMutableArray<goodsModel *> *)datalist;

@end
