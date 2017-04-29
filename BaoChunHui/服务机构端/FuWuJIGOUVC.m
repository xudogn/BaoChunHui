//
//  FuWuJIGOUVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/13.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "FuWuJIGOUVC.h"
#import "jianKangJiGouCell.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "gonvermentTVC.h"
#import "sheQuZhuLaoVCT.h"
#import "yanglaoTVC.h"
#import "tuolaoTVC.h"
#import "jiazhengTVC.h"
#import "travelTVC.h"
#import "lawerTVC.h"
#import "OldProductMakerVC.h"
#import "volunteerOrgTVC.h"

@interface FuWuJIGOUVC ()

@end

@implementation FuWuJIGOUVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.collectionView registerClass:[jianKangJiGouCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor colorWithR:244 g:244 b:244 alpha:1];
    
    
    self.navigationItem.title = @"服务机构";
    
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:33],
    NSForegroundColorAttributeName:[UIColor blackColor]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    jianKangJiGouCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSArray<NSString *> *arr = @[@"政府民政老龄办",@"全国社区助老工程",@"养老机构",@"社区托老",@"家政公司",@"旅游公司",@"律师事务所",@"老年产品生产商",@"志愿者组织", @"角色切换"];
    cell.name.text = arr[indexPath.row];
    cell.imgV.image = [UIImage imageNamed:@"zhaohu_nursing"];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    switch (indexPath.row) {
        case 0:
        {
            gonvermentTVC *vc = [[gonvermentTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            sheQuZhuLaoVCT *vc = [[sheQuZhuLaoVCT alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            yanglaoTVC *vc = [[yanglaoTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            tuolaoTVC *vc = [[tuolaoTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            jiazhengTVC *vc = [[jiazhengTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            travelTVC *vc = [[travelTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            lawerTVC *vc = [[lawerTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            OldProductMakerVC *vc = [[OldProductMakerVC alloc] initWithNibName:@"OldProductMakerVC" bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:
        {
            
            volunteerOrgTVC *vc = [[volunteerOrgTVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 9:
        {
            ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainModule"];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    
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
