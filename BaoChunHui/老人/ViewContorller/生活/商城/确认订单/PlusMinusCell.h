//
//  PlusMinusCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/10.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlusMinusCell : UITableViewCell

@property(nonatomic, strong) UIButton *plusBtn;

@property(nonatomic, strong) UILabel *numberLabel;

@property(nonatomic, strong) UIButton *minusBtn;



@property(nonatomic, strong) UILabel *shuliang;



@property(nonatomic, copy) void(^plus)();

@property(nonatomic, copy) void(^minus)();








@end
