//
//  ChooseGuiGeView.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/12.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseGuiGeView : UIView

@property(nonatomic, strong) UIView *headV;

@property(nonatomic, strong) UILabel *priceL;


@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIButton *QueDingBtn;

@property(nonatomic) NSInteger button_tag;

@property(nonatomic) ViewControllerType type;

@property(nonatomic, copy) void(^clickQewdingBtn)();

@property(nonatomic, strong) goodsModel *goodsmodel;

- (instancetype)initWithGoodsModel:(goodsModel *)goodsmodel buttonTag:(NSInteger)tag ViewControllerType:(ViewControllerType)type;;



@end
