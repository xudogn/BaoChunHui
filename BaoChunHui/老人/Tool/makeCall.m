//
//  makeCall.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "makeCall.h"

@implementation makeCall


+(UIWebView *)callPhoneNumber:(NSString *)phoneNum{
    NSString *teleNum = [NSString stringWithFormat:@"tel://%@", phoneNum];
    
    NSURL *url = [NSURL URLWithString:teleNum];
    // zhijie bo da
    //[[UIApplication sharedApplication] openURL:url];
    
    // 打完电话可回来~~~~~~
    UIWebView *webView = [[UIWebView alloc] init];
    
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    return webView;
}

@end
