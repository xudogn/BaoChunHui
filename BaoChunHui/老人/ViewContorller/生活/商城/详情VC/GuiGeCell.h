//
//  GuiGeCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/12.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuiGeCell : UITableViewCell

@property(nonatomic, strong) StandardModel *standardModel;

@property(nonatomic, copy) void(^chooseGuige)(UIButton *sender);

@property(nonatomic) NSInteger cellheight;


@end
