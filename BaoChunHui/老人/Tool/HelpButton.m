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

#define kHelpBtnWidth 40
#define kHelpBtnHeight 40

@interface HelpButton ()
@property (nonatomic, strong) UIButton *btn;

@end


@implementation HelpButton


- (instancetype)initWithFrame:(CGRect)frame{
    CGRect f = CGRectMake(kMainWidth - kHelpBtnWidth - 8, 20, kHelpBtnWidth, kHelpBtnHeight);
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
    _btn.frame = CGRectMake(0, 0, kHelpBtnWidth, kHelpBtnHeight);
    [_btn setImage:[UIImage imageNamed:@"list_phone"] forState:UIControlStateNormal];// btn_aid
    [_btn addTarget:self action:@selector(helpBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.rootViewController.view addSubview:_btn];
}

- (void)helpBtnClicked{
    NSLog(@"Help btn clicked!");
    // 1. 打电话
    //    NSString *tele = [[NSUserDefaults standardUserDefaults] objectForKey:@"teleNum"];
    //    NSString *teleNum = [NSString stringWithFormat:@"tel://%@", tele];
    NSURL *url = [NSURL URLWithString:@"tel://10086"];
    [[UIApplication sharedApplication] openURL:url];
    
    // 打完电话可回来~~~~~~
//    UIWebView *webView = [[UIWebView alloc] init];
//    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
    
    
    
}








- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
}


@end
