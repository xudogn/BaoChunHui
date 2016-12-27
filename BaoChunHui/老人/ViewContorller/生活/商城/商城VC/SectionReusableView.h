//
//  SectionReusableView.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/6.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionReusableView : UIView
@property(nonatomic, strong) UIView *lineView;


@property(nonatomic, strong) UILabel *sectionTitle;

@property(nonatomic, strong) UIControl *moreBtn;

@property(nonatomic, copy) void(^moreBtnClicked)(NSInteger section);

@property(nonatomic) NSInteger section;


@end
