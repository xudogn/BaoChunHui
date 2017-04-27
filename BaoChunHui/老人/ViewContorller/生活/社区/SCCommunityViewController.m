//
//  SCCommunityViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SCCommunityViewController.h"
#import "SCCommunityViewCell.h"
#import "SCInfoCollectController.h"
#import "SCWebViewController.h"

@interface SCCommunityViewController ()<SCCommunityViewCellDelegate>
@property (nonatomic) NSMutableArray<UILabel *> *timeInfoLbs;
@end

@implementation SCCommunityViewController

static NSString * const reuseIdentifier = @"Cell";
- (void)didClickedBtn:(UIButton *)btn {
    self.hidesBottomBarWhenPushed = YES;
    SCWebViewController *vc = [[SCWebViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (NSMutableArray<UILabel *> *)timeInfoLbs {
    if (!_timeInfoLbs) {
        _timeInfoLbs = [NSMutableArray array];
    }
    return _timeInfoLbs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    [TRFactory addCollectInfoForVC:self clickedHandler:^{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        SCInfoCollectController *vc = [[SCInfoCollectController alloc] initWithCollectionViewLayout:layout];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    self.navigationItem.title = @"社区信息";
    self.collectionView.backgroundColor = kRGBA(245, 245, 245, 1);
    [self.collectionView registerClass:[SCCommunityViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    NSInteger count = 10;
    for (int i = 0; i < count; i++) {
        UILabel *lb = [UILabel new];
        lb.backgroundColor = kRGBA(204, 204, 204, 1);
        //lb.frame = CGRectMake(0, 25+(i * 310), kScreenW, 25);
        [self.collectionView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(25+(i * 310));
            make.height.equalTo(30);
            make.width.mas_greaterThanOrEqualTo(65);
        }];
        lb.text = @"2016年12月20日 10:26";
        lb.textAlignment = NSTextAlignmentCenter;
        [self.timeInfoLbs addObject:lb];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#feaale"];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = kScreenW - 24;
    CGFloat hight = 230;
    return CGSizeMake(width, hight);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(70, 12, 70, 12);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 81;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SCCommunityViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.backgroundColor = [UIColor brownColor];
    cell.titleLb.text = @"健康饮食从你我做起";
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.readLb.textColor = [UIColor blackColor];
    [cell.toInfoBtn setImage:[UIImage imageNamed:@"con_more"] forState:UIControlStateNormal];
    cell.delegate = self;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
