//
//  gouWuCheView.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopVCModel.h"


@interface gouWuCheView : UIView


@property(nonatomic, strong) UIButton *addBtn;   // 添加进购物车

@property(nonatomic, strong) UIButton *payBtn;     // 立即去付款

@property(nonatomic, strong) UIButton *shoppingCardBtn; //  购物车图标 ，点击进去购物车VC

@property(nonatomic, copy) void(^goToGWC)();

@property(nonatomic, copy) void(^add_buy)(UIButton *sender);







@property(nonatomic, strong) goodsModel *goodsModel ;

@property(nonatomic) ViewControllerType type;





@end
