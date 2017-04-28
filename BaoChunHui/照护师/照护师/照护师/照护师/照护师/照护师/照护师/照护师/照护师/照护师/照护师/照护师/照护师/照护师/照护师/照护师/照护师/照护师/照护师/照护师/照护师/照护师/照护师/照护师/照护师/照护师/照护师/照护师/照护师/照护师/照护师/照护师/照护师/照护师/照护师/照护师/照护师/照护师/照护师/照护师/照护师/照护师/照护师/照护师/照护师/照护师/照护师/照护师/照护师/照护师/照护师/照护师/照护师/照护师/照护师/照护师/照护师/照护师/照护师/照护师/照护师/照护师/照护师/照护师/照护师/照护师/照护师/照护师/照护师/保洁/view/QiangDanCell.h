//
//  QiangDanCell.h
//  BaoChunHui
//
//  Created by xudogn on 17/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QiangDanCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgV;

@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@property (weak, nonatomic) IBOutlet UILabel *distenceLb;

@property (weak, nonatomic) IBOutlet UIButton *qiangDanBtn;

@property(nonatomic, copy) void (^myblock)(UIButton *sender);


@end
