//
//  scoreShopViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "scoreShopViewController.h"
#import "scoreShopViewModel.h"

#import "scoreShopCell.h"
#import "scoreShopHeaderView.h"

@interface scoreShopViewController ()

@property(nonatomic, strong) scoreShopViewModel *scoreVM;





@end

@implementation scoreShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scoreVM = [[scoreShopViewModel alloc] init];
    // 下拉刷新
    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self.scoreVM getPage:0 completionHandler:^(scoreShopModel *model, NSError *error) {
        
        }];
    }];
    
    // 上拉加载
    self.collectionView.mj_footer = [MJRefreshFooter footerWithRefreshingBlock:^{
        
    }];
    
    
    
    
    
    // 注册Cell
    [self.collectionView registerClass:[scoreShopCell class] forCellWithReuseIdentifier:@"scoreCell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.scoreVM.datalist.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    scoreShopCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"scoreCell" forIndexPath:indexPath];
    
    
    
    cell.productName.text = [self.scoreVM productNameAtindexpath:indexPath.row];
    cell.priceLabel.text = [self.scoreVM priceLbAtindexpath:indexPath.row];
    cell.priceLabel.text = [self.scoreVM priceCashAtindexpath:indexPath.row];
    [cell.imgV sd_setImageWithURL:[self.scoreVM urlOfImgVAtindexpath:indexPath.row] placeholderImage:[UIImage imageNamed:@"IMG_0412"]];
    
    
    
    return cell;
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

@end
