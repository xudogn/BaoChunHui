//
//  shopPingJiaCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/30.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopPingJiaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;// 头像

@property (weak, nonatomic) IBOutlet UILabel *nameLb;// 名字

@property (weak, nonatomic) IBOutlet UILabel *timeLb;// 评价时间
@property (weak, nonatomic) IBOutlet UILabel *sendTime;// 送达时间


@property (weak, nonatomic) IBOutlet UILabel *pingJiaLb;// 评价内容


@property (weak, nonatomic) IBOutlet UIImageView *star1;
@property (weak, nonatomic) IBOutlet UIImageView *star2;
@property (weak, nonatomic) IBOutlet UIImageView *star3;
@property (weak, nonatomic) IBOutlet UIImageView *star4;
@property (weak, nonatomic) IBOutlet UIImageView *star5;






@end
