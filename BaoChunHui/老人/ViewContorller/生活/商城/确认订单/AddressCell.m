//
//  AddressCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/10.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "AddressCell.h"

@interface AddressCell ()






@end


@implementation AddressCell

- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:25];
        _name.textColor = [UIColor blackColorNew];
        [self.contentView addSubview:_name];
        [_name sizeToFit];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(12);
        }];
        
    }
    return _name;
}



- (UILabel *)teleNum{
    if (!_teleNum) {
        _teleNum = [[UILabel alloc] init];
        _teleNum.font = [UIFont systemFontOfSize:25];
        [_teleNum sizeToFit];
        [self.contentView addSubview:_teleNum];
        [_teleNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(20);
            make.top.equalTo(20);
        }];
    }
    return _teleNum;
}

- (UILabel *)address{
    if (!_address) {
        _address = [[UILabel alloc] init];
        [self.contentView addSubview:_address];
        _address.font = [UIFont systemFontOfSize:28];
        [_address sizeToFit];
        _address.textColor = [UIColor blackColorNew];
        _address.numberOfLines = 0;
        [_address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.teleNum.mas_bottom).equalTo(10);
            make.left.equalTo(12);
            make.bottom.equalTo(-20);
            make.right.equalTo(-20);
        }];
    }
    return _address;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self name];
    
    [self teleNum];
    [self address];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
