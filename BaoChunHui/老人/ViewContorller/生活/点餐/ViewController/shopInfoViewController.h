//
//  shopInfoViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *totalPrice;

@property (weak, nonatomic) IBOutlet UILabel *totalCount;
@property(nonatomic) NSInteger count; 
@property(nonatomic) NSInteger Price;







@end
