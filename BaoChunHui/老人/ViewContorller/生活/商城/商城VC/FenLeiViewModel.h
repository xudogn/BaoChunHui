//
//  FenLeiViewModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/14.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseViewModel.h"

@interface FenLeiViewModel : BaseViewModel

@property(nonatomic, strong) NSMutableArray *datalist;

@property(nonatomic) NSInteger page;
@property(nonatomic) NSInteger sort_id;
@property(nonatomic) ViewControllerType type;



- (instancetype)initWithSort_id:(NSInteger)sort_id ViewControllerType:(ViewControllerType)type;



















@end
