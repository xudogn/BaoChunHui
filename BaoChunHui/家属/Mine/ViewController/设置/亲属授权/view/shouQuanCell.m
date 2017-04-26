//
//  shouQuanCell.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/19.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "shouQuanCell.h"

@implementation shouQuanCell












- (IBAction)btncliked:(id)sender {
    !_btnClicked ?: _btnClicked(sender);
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _acceptBtn.layer.cornerRadius = 5;
    _acceptBtn.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
