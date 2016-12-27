//
//  zhaoHuViewController.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/5.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "zhaoHuViewController.h"
#import "sendMealCollectionViewController.h"
#import "sendMeadlTableViewController.h"
#import "sendMealCollectionViewController.h"
#import "huLiCollectionViewController.h"
//#import "bianLiViewController.h"
#import "footCollectionViewController.h"
#import "peiHuCollectionViewController.h"
//#import "peiHuViewController.h"
#import "SCWeixiuViewController.h"

#define kScreenW ([UIScreen mainScreen].bounds.size.width)
@interface zhaoHuViewController ()<UICollectionViewDelegateFlowLayout,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic) iCarousel *ic;
@property (nonatomic) NSArray *imageList;
@property (nonatomic) zhaoHuViewController *zhaoVc;
@end

@implementation zhaoHuViewController
#pragma mark - iCDelegate
//问题1: 有多少个cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageList.count;
}
//问题2: 每个的样式
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        //        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 154, 280)];
        view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        view.frame = carousel.bounds;
        
        UIImageView *iv = [[UIImageView alloc] initWithFrame:view.bounds];
        [view addSubview:iv];
        view.clipsToBounds = YES;
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.tag = 1000;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:1000];
    iv.image = self.imageList[index];
    return view;
}
//个性化定制各种属性
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //如果询问的是 是否循环滚动
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [[iCarousel alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //模仿表格的头部滚动栏
        _ic.frame = CGRectMake(0, 0, kScreenW, 187);
        [self.view addSubview:_ic];
        _ic.delegate = self;
        _ic.dataSource = self;
        //设置显示的模式 ---自己挨个运行测试
        //不爱写枚举 -  0 ~ 11
        _ic.type = 0;
        //自动滚动, 负数向左, 正数向右.
        //_ic.autoscroll = 1;
        //滚动方向
        //_ic.vertical = YES;
        //滚动速度, 有增加阻尼的效果
        _ic.scrollSpeed = .1;
    }
    return _ic;
}
- (void)makeICScroll:sender{
    //滚动到下一页
    [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 animated:YES];
}
- (NSArray *)imageList{
    if (!_imageList) {
        UIImage *s1 = [UIImage imageNamed:@"showImage1"];
        UIImage *s2 = [UIImage imageNamed:@"showImage2"];
        UIImage *s3 = [UIImage imageNamed:@"showImage3"];
        UIImage *s4 = [UIImage imageNamed:@"showImage4"];
        _imageList = @[s1,s2,s3,s4];
    }
    return _imageList;
}
- (IBAction)sendOfMeal:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    sendMealCollectionViewController *vc = [[sendMealCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)nurse:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    huLiCollectionViewController *vc = [[huLiCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)bianLiStore:(id)sender {
//    bianLiViewController *vc = [[bianLiViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)foot:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    footCollectionViewController *vc = [[footCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (IBAction)yiYang:(id)sender {
    self.hidesBottomBarWhenPushed = YES;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    peiHuCollectionViewController *vc = [[peiHuCollectionViewController alloc] initWithCollectionViewLayout:layout];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSOperationQueue new] addOperationWithBlock:^{
        [self imageList];
        //回归主线程, 刷新界面
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.ic reloadData];
            //启动定时器,自动滚动
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(makeICScroll:) userInfo:nil repeats:YES];
        }];
    }];
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
