//
//  NSString+myURL.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "NSString+myURL.h"

@implementation NSString (myURL)

- (NSURL *)myURL{
    if ([self containsString:@"https://"]|| [self containsString:@"http://"]) {
        return [NSURL URLWithString:self];
    }
    return [NSURL fileURLWithPath:self];
}


@end
