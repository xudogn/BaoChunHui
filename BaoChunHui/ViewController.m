//
//  ViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "ViewController.h"
#import "LoginnViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *oldPeopleButton;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (IBAction)chooseModule:(UIControl *)sender {
    // [[speach sharedSpeechModel] speechStartWithText:sender.titleLabel.text];
    //sleep(2);
    if (/*已经自动登录*//* DISABLES CODE */ (0)) {
        // 跳转点击界面
        switch (sender.tag) {
            case 0:
            
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
            case 4:
                
                break;
            case 5:
                
                break;
                
            default:
                break;
        }
    }else {
        
        LoginnViewController *loginVC = [[LoginnViewController alloc] initWithNibName:@"LoginnViewController" bundle:nil Module:sender.tag];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:loginVC];
        navi.navigationBar.backgroundColor = [UIColor colorWithR:48 g:206 b:185 alpha:1];
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        delegate.window.rootViewController = navi;
        
        
    }
    
   
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
