//
//  PlusMinusCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/10.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "PlusMinusCell.h"

@interface PlusMinusCell ()



@end


@implementation PlusMinusCell




- (UILabel *)shuliang{
    if (!_shuliang) {
        _shuliang = [[UILabel alloc] init];
        _shuliang.font = [UIFont systemFontOfSize:28];
        [self.contentView addSubview:_shuliang];
        _shuliang.text = @"购买数量";
        _shuliang.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [_shuliang sizeToFit];
        [_shuliang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
    }
    return _shuliang;
}

- (UILabel *)numberLabel{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textColor = [UIColor colorWithR:51 g:51 b:51 alpha:1];
        [self.contentView addSubview:_numberLabel];
        _numberLabel.font = [UIFont systemFontOfSize:28];
        [_numberLabel sizeToFit];
        [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.plusBtn.mas_left).equalTo(-10);
            make.centerY.equalTo(0);
        }];
    }
    return _numberLabel;
}

- (UIButton *)plusBtn{
    if (!_plusBtn) {
        _plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_plusBtn];
        [_plusBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _plusBtn.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        [_plusBtn bk_addEventHandler:^(id sender) {
            !_plus ?: _plus();
        } forControlEvents:UIControlEventTouchUpInside];
        [_plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-12);
            make.size.equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(0);
        }];
    }
    return _plusBtn;
}

- (UIButton *)minusBtn{
    if (!_minusBtn) {
        _minusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_minusBtn];
        [_minusBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _minusBtn.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        [_minusBtn bk_addEventHandler:^(id sender) {
            !_minus ?: _minus();
        } forControlEvents:UIControlEventTouchUpInside];
        [_minusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).equalTo(-10);
            make.size.equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(0);
        }];
    }
    return _minusBtn;
}




- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self shuliang];
        [self minusBtn];
        [self plusBtn];
    }
    return self;
}



















- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self shuliang];
    [self minusBtn];
    [self plusBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
