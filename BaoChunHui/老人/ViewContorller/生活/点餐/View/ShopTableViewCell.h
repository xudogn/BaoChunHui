//
//  ShopTableViewCell.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;

@property (weak, nonatomic) IBOutlet UILabel *shopName;

@property (weak, nonatomic) IBOutlet UIImageView *starImg;

@property (weak, nonatomic) IBOutlet UILabel *score;

@property (weak, nonatomic) IBOutlet UILabel *count;

@property (weak, nonatomic) IBOutlet UILabel *distance;

@property (weak, nonatomic) IBOutlet UILabel *reduce;

@property (weak, nonatomic) IBOutlet UILabel *add;




@end
