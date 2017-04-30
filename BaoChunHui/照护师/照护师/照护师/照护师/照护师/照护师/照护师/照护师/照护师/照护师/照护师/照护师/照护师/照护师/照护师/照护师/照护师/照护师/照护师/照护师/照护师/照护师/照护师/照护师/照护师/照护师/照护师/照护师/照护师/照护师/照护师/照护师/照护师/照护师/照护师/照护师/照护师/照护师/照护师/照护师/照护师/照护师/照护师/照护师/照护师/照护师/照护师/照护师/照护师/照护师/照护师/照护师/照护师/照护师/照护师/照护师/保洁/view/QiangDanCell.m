//
//  QiangDanCell.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "QiangDanCell.h"

@implementation QiangDanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (IBAction)qiangDanBtnClicked:(UIButton *)sender {
    !_myblock ?: _myblock(sender);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
