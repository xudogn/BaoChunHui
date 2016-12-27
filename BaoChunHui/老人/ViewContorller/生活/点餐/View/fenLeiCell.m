//
//  fenLeiCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "fenLeiCell.h"

@implementation fenLeiCell












- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self label];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self label];
    }
    return self;
}


- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc] init];
        [self addSubview:_label];
        _label.textAlignment = NSTextAlignmentCenter;
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:16];
    }
    return _label;
}


- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc ] init];
        [self addSubview:_imgV];
        _imgV.contentMode = UIViewContentModeScaleAspectFill;
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(10, 10));
        }];
    }
    return _imgV;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
