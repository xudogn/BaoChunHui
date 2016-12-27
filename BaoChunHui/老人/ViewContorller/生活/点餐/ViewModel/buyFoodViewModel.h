//
//  buyFoodViewModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "BaseViewModel.h"

@interface buyFoodViewModel : BaseViewModel
@property(nonatomic) NSInteger page;










@property(nonatomic, strong) NSMutableArray *datalist;

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError * error))completionHandler;



@end
