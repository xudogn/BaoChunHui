//
//  RegistViewController.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistViewController : UIViewController

@property(nonatomic, readonly) MainModulePart module;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Module:(MainModulePart)module;

@end
