//
//  FenLeiViewModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/14.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "FenLeiViewModel.h"
#import "shangChengNetWorking.h"


@implementation FenLeiViewModel























- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    if (requestMode == RequestModeRefresh) {
        self.page = 0 ;
    }
    
    self.dataTask = [shangChengNetWorking getFenLeiPage:self.page parameters:nil completionHandler:^(NSArray<goodsModel *> *model, NSError *error) {
        if (requestMode == RequestModeRefresh) {
            [self.datalist removeAllObjects];
        }
        [self.datalist addObjectsFromArray:model];
        self.page++;
    }];
}







@end
