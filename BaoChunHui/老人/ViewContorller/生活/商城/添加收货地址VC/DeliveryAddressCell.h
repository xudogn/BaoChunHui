//
//  DeliveryAddressCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/17.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeliveryAddressCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *naneL;
@property (weak, nonatomic) IBOutlet UILabel *teltNumL;
@property (weak, nonatomic) IBOutlet UILabel *addressL;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *deitBtn;
@property (weak, nonatomic) IBOutlet UIButton *flagBtn;

@property(nonatomic, copy) void(^deleteBtnClicked)();

@property(nonatomic, copy) void(^editBtnClicked)();

@property(nonatomic, copy) void(^flagBtnClicked)();

@end
