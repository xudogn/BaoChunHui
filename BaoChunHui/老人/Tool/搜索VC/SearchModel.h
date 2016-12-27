//
//  SearchModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/7.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject





@property(nonatomic, strong) NSMutableArray<goodsModel *> *datalist;



@property(nonatomic) BOOL has_more;


@end
