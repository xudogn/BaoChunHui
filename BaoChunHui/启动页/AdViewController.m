//
//  AdViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "AdViewController.h"
#import "AppDelegate.h"
@interface AdViewController ()


@property(nonatomic, strong) UIProgressView * progressV;
@property(nonatomic, strong) UIImage * AdImage;
@property(nonatomic, strong) UILabel * timeV;
@property(nonatomic, strong) UIImageView * imgV;
@property(nonatomic, strong) NSTimer * timer;

@end

@implementation AdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *adImage = [NSString stringWithFormat:@"%@/%@",documentPath, @"adImage"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:adImage] ) {
        //进入主界面
    }*/
    
    self.imgV = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.imgV];
    self.imgV.image = [UIImage imageNamed:@"IMG_0414"];
    
    [self timeV];
    
    
    
    
}




-(UILabel *)timeV{
    if (!_timeV) {
        _timeV = [[UILabel alloc]init];
        [self.imgV addSubview:_timeV];
        [_timeV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.right.equalTo(-50);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
    }
    
    _timeV.alpha = .8;
    _timeV.backgroundColor = [UIColor whiteColor];
    _timeV.font = [UIFont systemFontOfSize:30];
    _timeV.textColor = [UIColor blackColor];
    _timeV.textAlignment = NSTextAlignmentCenter;
    _timeV.layer.cornerRadius = 25;
    _timeV.clipsToBounds = YES;
    
    
    _timeV.text = @"3";
    
    __block NSInteger time = 2;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        _timeV.text = [NSString stringWithFormat:@"%ld",(long)time];
        if (time == 0) {
#pragma mark - 广告页面消失，进入主界面
            //广告页面消失，进入主界面
            
            [UIView animateWithDuration:1 animations:^{
                self.view.alpha = 0;
                self.view.transform = CGAffineTransformMakeScale(1.5, 1.5);
            } completion:^(BOOL finished) {
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.adWindow.rootViewController = nil;
            delegate.adWindow = nil;
            }];
            
        }
        time -= 1;
    } repeats:YES];
    return _timeV;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
