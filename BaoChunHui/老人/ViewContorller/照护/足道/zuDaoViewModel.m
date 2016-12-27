//
//  zuDaoViewModel.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/8.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "zuDaoViewModel.h"

@implementation zuDaoViewModel
#warning for NetWorking
- (NSInteger)itemNumber {
    return _dataList.count;
}
- (NSString *)typeTitleForRow:(NSInteger)row {
    return _dataList[row].detail_name;
}
- (NSString *)priceTitleForRow:(NSInteger)row {
    return _dataList[row].serve_price;
}
- (NSMutableArray<zuDaoModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
@end
