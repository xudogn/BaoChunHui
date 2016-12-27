//
//  makeCall.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface makeCall : NSObject



//[self.view addSubview [makeCall callPhoneNumber:@"10086"]];


+ (UIWebView *)callPhoneNumber:(NSString *)phoneNum;


@end
