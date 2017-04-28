//
//  infoWebViewVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/28.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "infoWebViewVC.h"

@interface infoWebViewVC ()

@end

@implementation infoWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wkWebViewEasyUse];
}
- (void)wkWebViewEasyUse
{
    //1.创建WKWebView
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height - 20;
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, width, height)];
    // 2.创建URL
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [webView loadRequest:request];
    // 5.最后将webView添加到界面
    [self.view addSubview:webView];
    
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
