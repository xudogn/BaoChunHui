//
//  SubmitView.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/9.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubmitView : UIView

@property(nonatomic, strong) UILabel *priceL;


@property(nonatomic, strong) UIButton *payBtn;

@property(nonatomic, copy) void(^payBtnClicked)();



@end
