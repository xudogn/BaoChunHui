//
//  goodsDetailViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface goodsDetailViewController : UIViewController


@property(nonatomic, strong) goodsModel *goodsModel;
@property(nonatomic) ViewControllerType type;







- (instancetype)initWithGoodsModel:(goodsModel *)goodsModel ViewControllerType:(ViewControllerType)type;

@end


















