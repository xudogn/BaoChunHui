//
//  shouQuanCell.h
//  BaoChunHui
//
//  Created by xudogn on 17/4/19.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnclicked)(UIButton *sender);

@interface shouQuanCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@property (weak, nonatomic) IBOutlet UILabel *name;


@property (weak, nonatomic) IBOutlet UILabel *phonenum;

@property (weak, nonatomic) IBOutlet UIButton *acceptBtn;

@property (weak, nonatomic) IBOutlet UILabel *accepted;

@property(nonatomic) btnclicked btnClicked;


@end
