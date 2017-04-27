//
//  SCCommunityViewCell.h
//  BaoChunHui
//
//  Created by BCH on 2017/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCCommunityViewCell;
@protocol SCCommunityViewCellDelegate <NSObject>
@optional
- (void)didClickedBtn:(UIButton *)btn;

@end
@interface SCCommunityViewCell : UICollectionViewCell
@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIView *maskView;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *readLb;
@property (nonatomic) UIButton *toInfoBtn;
@property (nonatomic,weak) id<SCCommunityViewCellDelegate> delegate;
@end
