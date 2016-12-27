//
//  shopFoodCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopFoodCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@property (weak, nonatomic) IBOutlet UILabel *goodsName;

@property (weak, nonatomic) IBOutlet UILabel *haopingLb;

@property (weak, nonatomic) IBOutlet UILabel *priceLv;

@property (weak, nonatomic) IBOutlet UIButton *keXuanGuiGe;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;  // tag = 400

@property (weak, nonatomic) IBOutlet UIButton *jianBtn; // tag = 401

@property (weak, nonatomic) IBOutlet UILabel *countLb;  // tag = 402

@property(nonatomic, copy) NSDictionary*(^clickBtn)(UIButton *btn);















@end
