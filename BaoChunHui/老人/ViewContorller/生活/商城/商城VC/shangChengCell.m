//
//  shangChengCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shangChengCell.h"

@implementation shangChengCell


-(instancetype)init{
    self = [super init];
    if (self) {
        [self imgV];
        [self goods_name];
        [self goods_price];
        [self goods_number];
    }
    return self;
}



- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV];
        _imgV.contentMode = UIViewContentModeScaleAspectFill;
        _imgV.clipsToBounds = YES;
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(120, 120));
            make.top.left.equalTo(12);
            make.bottom.equalTo(-12);
        }];
    }
    return _imgV;
}

- (UILabel *)goods_name{
    if (!_goods_name) {
        _goods_name = [[UILabel alloc] init];
        [self.contentView addSubview:_goods_name];
        _goods_name.textAlignment = NSTextAlignmentLeft;
        _goods_name.numberOfLines = 0;
        _goods_name.font = [UIFont systemFontOfSize:28];
        _goods_name.textColor = [UIColor colorWithRed:26/255 green:26/255 blue:26/255 alpha:1];
        [_goods_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgV.mas_right).equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(25);
            
        }];
    }
    return _goods_name;
}

- (UILabel *)goods_price{
    if (!_goods_price) {
        UILabel *s = [[UILabel alloc] init];
        [self.contentView addSubview:s];
        s.text = @"￥";
        [s sizeToFit];
        s.textColor = [UIColor ShengHuoColor];
        s.font = [UIFont systemFontOfSize:20];
        [s mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgV.mas_right).equalTo(10);
            make.bottom.equalTo(-20);
        }];
        _goods_price = [[UILabel alloc] init];
        [self.contentView addSubview:_goods_price];
        [_goods_price sizeToFit];
        _goods_price.textAlignment = NSTextAlignmentLeft;
        _goods_price.font = [UIFont systemFontOfSize:30];
        _goods_price.textColor = [UIColor ShengHuoColor];
        [_goods_price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(s.mas_right).equalTo(7);
            make.bottom.equalTo(s.mas_bottom).equalTo(3);
            
        }];
    }
    return _goods_price;
}

- (UILabel *)goods_number{
    if (!_goods_number) {
        _goods_number = [[UILabel alloc] init];
        [self.contentView addSubview:_goods_number];
        _goods_number.font = [UIFont systemFontOfSize:28];
        [_goods_number sizeToFit];
        [_goods_number mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(-12);
        }];
    }
    return _goods_number;
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
