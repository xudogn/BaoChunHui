//
//  userModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "userModel.h"

@implementation userModel






static userModel *users = nil;
+ (instancetype)defaultsUserModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (users == nil) {
            users = [[userModel alloc] init];
        }
    });
    return users;
}



- (NSMutableArray<addressModel *> *)address_arr{
    if (!_address_arr) {
        _address_arr = [[NSMutableArray<addressModel *> alloc] init];
        
    }
    return _address_arr;
}


-(NSMutableArray<goodsModel *> *)gouWuChe_dianCan_arr{
    if (!_gouWuChe_dianCan_arr) {
        _gouWuChe_dianCan_arr = [[NSMutableArray<goodsModel *> alloc] init];
    }
    return _gouWuChe_dianCan_arr;
}

-(NSMutableArray<goodsModel *> *)gouWuChe_bianLiDian_arr{
    if (!_gouWuChe_bianLiDian_arr) {
        _gouWuChe_bianLiDian_arr = [[NSMutableArray<goodsModel *> alloc] init];
    }
    return _gouWuChe_bianLiDian_arr;
}
-(NSMutableArray<goodsModel *> *)gouWuChe_shangCheng_arr{
    if (!_gouWuChe_shangCheng_arr) {
        _gouWuChe_shangCheng_arr = [[NSMutableArray<goodsModel *> alloc] init];
    }
    return _gouWuChe_shangCheng_arr;
}
-(NSMutableArray<goodsModel *> *)gouWuChe_zuDao_arr{
    if (!_gouWuChe_zuDao_arr) {
        _gouWuChe_zuDao_arr = [[NSMutableArray<goodsModel *> alloc] init];
    }
    return _gouWuChe_zuDao_arr;
}



@end





