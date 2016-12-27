//
//  scoreShopCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "scoreShopCell.h"

@implementation scoreShopCell





- (UILabel *)productName{
    if (!_productName) {
        _productName = [[UILabel alloc] init];
        [self addSubview:_productName];
        _productName.font = [UIFont systemFontOfSize:20];
        _productName.textAlignment = NSTextAlignmentLeft;
        [_productName sizeToFit];
        [_productName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            //make.right.equalTo(-10);
            make.height.equalTo(30);
        }];
    }
    return _productName;
}

- (UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        [self addSubview:_priceLabel];
        _priceLabel.font = [UIFont systemFontOfSize:18];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        [_priceLabel sizeToFit];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.productName.mas_bottom).equalTo(10);
            
        }];
    }
    return _priceLabel;
}

- (UILabel *)priceCash{
    if (!_priceCash) {
        _priceCash = [UILabel new];
        _priceCash.font = [UIFont systemFontOfSize:18];
        _priceCash.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_priceCash];
        [_priceCash sizeToFit];
        [_priceCash mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.priceLabel.mas_right).equalTo(10);
            make.centerX.equalTo(self.priceLabel.centerX);
        }];
    }
    return _priceCash;
}

- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self addSubview:_imgV];
        _imgV.contentMode = UIViewContentModeScaleAspectFill;
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.right.equalTo(-10);
            make.top.equalTo(self.priceLabel.mas_bottom).equalTo(10);
        }];
    }
    return _imgV;
}







@end
