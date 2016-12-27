//
//  foodClassModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/30.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>



@class foodClassModel,foodListModel, foodStandardModel;
@interface foodClassModel : NSObject

@property(nonatomic, strong) NSString *sort_name;

@property(nonatomic) NSInteger sort_id;

@property(nonatomic) NSInteger shop_id;


@property(nonatomic, strong) NSMutableArray<foodListModel *> *goods;


@end


@interface foodListModel : NSObject

@property(nonatomic, strong) NSString *goods_photo;

@property(nonatomic, strong) NSString *goods_name;

@property(nonatomic) NSInteger sellCount; // 月售额

@property(nonatomic) NSInteger praiseRate;// 好评率

@property(nonatomic) NSInteger goods_price;

@property(nonatomic) NSInteger goods_id;

@property(nonatomic, strong) NSString *goods_sort;

@property(nonatomic, strong) NSArray<foodStandardModel *> *standard;



@property(nonatomic) NSInteger ios_count;

@end



@interface foodStandardModel : NSObject

@property(nonatomic, strong) NSString *standard_name;

@property(nonatomic) NSInteger standard_id;

@property(nonatomic) NSInteger goods_id;


@end

















