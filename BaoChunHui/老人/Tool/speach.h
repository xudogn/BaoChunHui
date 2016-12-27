//
//  speach.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/17.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface speach : NSObject



@property(nonatomic, strong) NSString * speechText;


+ (instancetype)sharedSpeechModel;

- (void)speechFinished;

- (void)speechStartWithText:(NSString *)text;



@end
