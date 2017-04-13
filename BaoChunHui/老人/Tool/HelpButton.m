//
//  HelpButton.m
//  XuanFuButton
//
//  Created by xudogn on 17/3/7.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "HelpButton.h"


#define kMainWidth [UIScreen mainScreen].bounds.size.width
#define kMainHeight [UIScreen mainScreen].bounds.size.height

#define kHelpBtnWidth 100
#define kHelpBtnHeight 100

@interface HelpButton ()
@property (nonatomic, strong) UIButton *btn;

@end


@implementation HelpButton


- (instancetype)initWithFrame:(CGRect)frame{
    CGRect f = CGRectMake(kMainWidth - kHelpBtnWidth - 8, 12, kHelpBtnWidth, kHelpBtnHeight);
    self = [super initWithFrame:f];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert + 11;
        self.rootViewController = [UIViewController new];
        [self addHelpBtn];
        
        
        [self makeKeyAndVisible];
        
        
    }
    return self;
}

- (void)addHelpBtn{
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btn setTitle:@"help" forState:UIControlStateNormal];
    _btn.frame = CGRectMake(0, 0, kHelpBtnWidth, kHelpBtnHeight);
    [_btn setImage:[UIImage imageNamed:@"con_phone"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(helpBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.rootViewController.view addSubview:_btn];
}

- (void)helpBtnClicked{
    NSLog(@"Help btn clicked!");
}








- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}


@end
