//
//  Add_EditShouHuoDiZhiVC.h
//  BaoChunHui
//
//  Created by xudogn on 16/12/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    Edit,
    Add,
} VCtype;



@interface Add_EditShouHuoDiZhiVC : UIViewController



- (instancetype)initWithVCtype:(VCtype)type;



@end
