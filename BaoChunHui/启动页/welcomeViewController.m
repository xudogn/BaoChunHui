//
//  ViewController.m
//  welcomePage
//
//  Created by BCH on 16/11/15.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "welcomeViewController.h"
#import "AppDelegate.h"


@interface welcomeViewController ()
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation welcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self myScrollView];
    
}
- (void)myScrollView {
    //创建滚动视图 frame 和 view 一样
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.scrollView];
    
    //scrollView 的内容大小 宽度是 4个屏幕宽度因为要显示4张图片
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height);
    
    //设置 scrollView 整页滑动
    self.scrollView.pagingEnabled = YES;
    //关闭scrollView 的 弹性效果
    self.scrollView.bounces = NO;
    //去掉 下面 灰条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置 scrollView 中的内容
    for (int i = 0; i < 4; i ++) {
        //创建 ImageView
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        //根据 i 拼接图片名称
        NSString *imageName = [NSString stringWithFormat:@"IMG_071%d",i+2];
        imageview.image = [UIImage imageNamed:imageName];
        
        //将创建好的  imageView  添加到 滚动视图中
        [self.scrollView addSubview:imageview];
        
        if (i == 3) { //说明现在 创建最后一个 imageview
            //打开 imageView 的用户交互， 只有这样它的子控件 button 才可以点击
            imageview.userInteractionEnabled = YES;
            [imageview addSubview:[self enterButton]];
        }
    }
}
- (UIButton *)enterButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake((self.view.frame.size.width - 150) * 0.5, self.view.frame.size.height * 0.8, 150, 40);
    [button setTitle:@"进入体验" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setBackgroundColor:[UIColor grayColor]];
    button.layer.cornerRadius = 10;
    [button addTarget:self action:@selector(goIn) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}
- (void)goIn {
   
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIView animateWithDuration:1 animations:^{
        self.view.window.alpha = 0;
        //view 三大属性: bounds,  frame, transform
        self.view.window.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        delegate.welcomeWindow.hidden = YES;
        //释放欢迎控制器的指针索引
        delegate.welcomeWindow.rootViewController = nil;
        delegate.welcomeWindow = nil;
        
        //设置当前版本号为已读版本号
        NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
        NSString *version = infoDic[@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"readVersion"];
        //NSUserDefaults从内存写入硬盘的时机,由runloop来掌握, 并不是立刻写入.
        //要想立刻写入, 则调用
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
