//
//  SectionReusableView.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/6.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SectionReusableView.h"
#import <UIControl+BlocksKit.h>
@implementation SectionReusableView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sectionTitle];
        [self moreBtn];
        [self lineView];
    }
    return self;
}


- (UILabel *)sectionTitle{
    if (!_sectionTitle) {
        _sectionTitle = [[UILabel alloc] init];
        [self addSubview:_sectionTitle];
        [_sectionTitle sizeToFit];
        _sectionTitle.font = [UIFont systemFontOfSize:30];
        _sectionTitle.textAlignment = NSTextAlignmentLeft;
        
        [_sectionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(16);
            make.bottom.equalTo(-16);
            make.left.equalTo(12);
            make.height.equalTo(28);
            make.right.equalTo(self.moreBtn.mas_left).equalTo(-5);
        }];
    }
    return _sectionTitle;
}

- (UIControl *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIControl new];
        [self addSubview:_moreBtn];
        
        [_moreBtn bk_addEventHandler:^(id sender) {
            !_moreBtnClicked ?: _moreBtnClicked(_section);
        } forControlEvents:UIControlEventTouchUpInside];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(-15);
            make.size.equalTo(CGSizeMake(50, 50));
            make.centerX.equalTo(0);
            
        }];
        
        UIImageView *imgV = [[UIImageView alloc] init];
        [_moreBtn addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //imgV.image = [UIImage imageNamed:@""];
        imgV.backgroundColor = [UIColor blueColor];
        
        
        
    }
    return _moreBtn;
}

- (void)setMoreBtnClicked:(void (^)(NSInteger))moreBtnClicked{
    _moreBtnClicked = moreBtnClicked;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self addSubview:_lineView];
        _lineView.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _lineView;
}









@end
