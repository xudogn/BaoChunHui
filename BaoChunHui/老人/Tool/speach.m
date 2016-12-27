//
//  speach.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/17.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "speach.h"


@interface speach ()<AVSpeechSynthesizerDelegate>

@property(nonatomic, strong) AVSpeechSynthesizer * speechSynthesizer;

@property(nonatomic, strong) AVSpeechUtterance * speechUtterance;

@end



@implementation speach


static speach *instance = nil;

//+ (instancetype)sharedSpeechModel{
//    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        instance = [[self alloc] init];
//        NSLog(@"...");
//    });
//    
//    return instance;
//}


+ (instancetype)sharedSpeechModel{
    
    @synchronized (self) {
        if (!instance) {
            instance = [[self alloc] init];
        }
    }
    return instance;
}





- (void)speechFinished{
    
}

- (void)speechStartWithText:(NSString *)text{
    self.speechText = text;
    [self.speechSynthesizer speakUtterance:self.speechUtterance];
}

- (AVSpeechSynthesizer *)speechSynthesizer {
    if (!_speechSynthesizer) {
        _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        
    }
    return _speechSynthesizer;
}

- (AVSpeechUtterance *)speechUtterance{
    if (!_speechUtterance) {
        _speechUtterance = [[AVSpeechUtterance alloc] initWithString:self.speechText];
        
        //NSString *localLanguage = [AVSpeechSynthesisVoice currentLanguageCode];
        //AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithIdentifier:localLanguage];
        AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        _speechUtterance.voice = voice;
        
        _speechUtterance.rate = 0.5f;
        
        //  高音
        _speechUtterance.pitchMultiplier = 0.8f;
        
        //  读完一段之后停顿0.1s
        _speechUtterance.postUtteranceDelay = 0.1f;
        
    }
    return _speechUtterance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
    }
    return instance;
}
-(id) copyWithZone:(NSZone *)zone{
    return instance;
}

-(id) mutablecopyWithZone:(NSZone *)zone
{
    return [speach sharedSpeechModel];
}






@end
