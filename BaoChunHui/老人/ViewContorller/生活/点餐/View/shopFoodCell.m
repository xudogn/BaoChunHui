//
//  shopFoodCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shopFoodCell.h"

@implementation shopFoodCell










- (IBAction)kexuanguigeBtn:(UIButton *)sender {
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //!_clickBtn ?: _clickBtn(sender);
    
    
    
    NSLog(@" dian ji ke xuan hui ge btn");
}

- (IBAction)addFood:(UIButton *)sender {
    NSLog(@"dianji addfood  btn");
}

- (IBAction)jianFood:(UIButton *)sender {
    NSLog(@"dianji  jianfood btn");
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.frame = CGRectMake(0, 0, kMainScreenWidth - 100, 90);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
