//
//  AVViewController.h
//  Some
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AVViewController : UIViewController 

@property(nonatomic, strong) NSURL *url;

- (instancetype)initWithURL:(NSURL *)url;

@end
