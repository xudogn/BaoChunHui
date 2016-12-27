//
//  buyFoodViewModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "buyFoodViewModel.h"
#import "oldNetManager.h"


@implementation buyFoodViewModel











- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    if (requestMode == RequestModeRefresh) {
        if (requestMode == RequestModeRefresh) {
            self.page = 0;
        }else {
            self.page ++;
        }
        
        
        self.dataTask = [oldNetManager getPage:self.page completionHandler:^(FoodModel *model, NSError *error) {
            if (!error) {
                if (requestMode == RequestModeRefresh) {
                    [self.datalist removeAllObjects];
                }
                //self.datalist addObjectsFromArray:<#(nonnull NSArray *)#>
            }else {
                !completionHandler ?: completionHandler(error);
            }
        }];
    }
}


@end
