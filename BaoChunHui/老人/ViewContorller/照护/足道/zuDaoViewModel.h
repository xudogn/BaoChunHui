//
//  zuDaoViewModel.h
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/8.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "BaseViewModel.h"
#import "zuDaoModel.h"//待删

@interface zuDaoViewModel : BaseViewModel
@property (nonatomic, readonly) NSInteger itemNumber;
@property (nonatomic) NSMutableArray<zuDaoModel *> *dataList;
- (NSString *)typeTitleForRow:(NSInteger)row;
- (NSString *)priceTitleForRow:(NSInteger)row;
@end
