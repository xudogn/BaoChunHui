//
//  AddNewAddressCell.h
//  BaoChunHui
//
//  Created by xudogn on 17/1/4.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewAddressCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UITextView *textV;

@property (weak, nonatomic) IBOutlet UIImageView *moreImgV;

@property (weak, nonatomic) IBOutlet UISwitch *setDefault;

@end
