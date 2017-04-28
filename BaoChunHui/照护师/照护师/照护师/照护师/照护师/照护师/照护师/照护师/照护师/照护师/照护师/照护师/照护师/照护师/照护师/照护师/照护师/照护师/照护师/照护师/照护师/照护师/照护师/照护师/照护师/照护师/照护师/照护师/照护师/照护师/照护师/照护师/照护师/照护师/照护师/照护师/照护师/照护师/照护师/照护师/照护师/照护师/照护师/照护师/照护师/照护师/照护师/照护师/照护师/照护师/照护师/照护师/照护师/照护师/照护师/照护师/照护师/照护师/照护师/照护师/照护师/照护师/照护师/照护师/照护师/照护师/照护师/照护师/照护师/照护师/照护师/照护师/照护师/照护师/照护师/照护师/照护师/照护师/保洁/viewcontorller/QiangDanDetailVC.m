//
//  QiangDanDetailVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/4/26.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "QiangDanDetailVC.h"

@interface QiangDanDetailVC ()

@end

@implementation QiangDanDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.scrollView.contentSize= CGSizeMake(kScreenW, kScreenH);
    
    
    [self.qiangDanBtn bk_addEventHandler:^(id sender) {
        [self qiangDanBtnClicked];
    } forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)qiangDanBtnClicked{
    
    // 抢单动作执行
    
    NSLog(@"抢单btn  clicked");
    
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
