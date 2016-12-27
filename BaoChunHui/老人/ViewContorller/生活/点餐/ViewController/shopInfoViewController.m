//
//  shopInfoViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shopInfoViewController.h"
#import "shopInfoDianCaiView.h"
#import "shopPingJiaView.h"
#import "shopFoodCell.h"


@interface shopInfoViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property(nonatomic, strong) shopInfoDianCaiView *shopInfoView;

@property(nonatomic, strong) shopPingJiaView *shopPingJiaView;


@property (weak, nonatomic) IBOutlet UIImageView *shopIcon;

@property (weak, nonatomic) IBOutlet UILabel *shopName;

@property (weak, nonatomic) IBOutlet UILabel *gongGaoLb;




@property (weak, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redLineLeftContraints;

@property (weak, nonatomic) IBOutlet UIButton *dianCaiBtn;

@property (weak, nonatomic) IBOutlet UIButton *pingJIaBtn;

@property (weak, nonatomic) IBOutlet UIButton *shangJIaBtn;



@end

@implementation shopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self congfigDianCaiView];
    
    
    [self.shopInfoView reloadData];
    [self configBtnState];
    self.count = 0;
    self.Price = 0;
}



- (void)configBtnState{
    self.dianCaiBtn.enabled = NO;
    self.pingJIaBtn.enabled = YES;
    self.shangJIaBtn.enabled = YES;
}




- (IBAction)dianCaiBtnClicked:(UIButton *)sender {
    self.dianCaiBtn.enabled = YES;
    self.pingJIaBtn.enabled = YES;
    self.shangJIaBtn.enabled = YES;
    sender.enabled = NO;
    if (sender.tag == 200) {
        [UIView animateWithDuration:.5 animations:^{
            self.redLineLeftContraints.constant = 30;
            self.scrollView.contentOffset = CGPointMake(0, 0);
            [self.redView layoutIfNeeded];
        }];
        
    }else if (sender.tag == 201){
        if (!_shopPingJiaView) {
            [self shopPingJiaView];
        }
        [UIView animateWithDuration:.5 animations:^{
            self.redLineLeftContraints.constant = kMainScreenWidth/2 - 40;
            self.scrollView.contentOffset = CGPointMake(kMainScreenWidth, 0);
            [self.redView layoutIfNeeded];
        }];
    }else if (sender.tag == 202){
//        if (!_shopPingJiaView) {          //  店铺信息View
//            [self shopPingJiaView];
//        }
        [UIView animateWithDuration:.5 animations:^{
            self.redLineLeftContraints.constant = kMainScreenWidth - 30 - 80;
            self.scrollView.contentOffset = CGPointMake(kMainScreenWidth * 2, 0);
            [self.redView layoutIfNeeded];
        }];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 300) {
        
        NSInteger x = scrollView.contentOffset.x;
        NSInteger y = scrollView.contentOffset.y;
        if (y > 0) {
            scrollView.contentOffset = CGPointMake(x, 0);
        }
        
        
        if (x == 0) {
            self.dianCaiBtn.enabled = YES;
            self.pingJIaBtn.enabled = YES;
            self.shangJIaBtn.enabled = YES;
            self.dianCaiBtn .enabled = NO;
            [UIView animateWithDuration:.5 animations:^{
                self.redLineLeftContraints.constant = 30;
                
                [self.redView layoutIfNeeded];
            }];
            
        }else if (x == kMainScreenWidth){
            self.dianCaiBtn.enabled = YES;
            self.pingJIaBtn.enabled = YES;
            self.shangJIaBtn.enabled = YES;
            self.pingJIaBtn.enabled = NO;
            if (!_shopPingJiaView) {
                [self shopPingJiaView];
            }
            [UIView animateWithDuration:.5 animations:^{
                self.redLineLeftContraints.constant = kMainScreenWidth/2 - 40;
                
                [self.redView layoutIfNeeded];
            }];
        }else if (x == kMainScreenWidth *2 ){
            self.dianCaiBtn.enabled = YES;
            self.pingJIaBtn.enabled = YES;
            self.shangJIaBtn.enabled = YES;
            self.shangJIaBtn.enabled = NO;
            [UIView animateWithDuration:.5 animations:^{
                self.redLineLeftContraints.constant = kMainScreenWidth - 30 - 80;
                
                [self.redView layoutIfNeeded];
            }];
        }
    }
}





// 点击  +  -  可选规格



- (IBAction)addBtnClicked:(UIButton *)sender {  // tag:  + 400, - 401,  规格 402;
    shopFoodCell *cell = (shopFoodCell *)[[sender superview] superview];
    
    cell.jianBtn.hidden = NO;
    cell.countLb.hidden = NO;
        self.count++;
        self.Price += cell.priceLv.text.intValue;
        self.totalCount.text = [NSString stringWithFormat:@"%ld", self.count];
        self.totalCount.hidden = NO;
        self.totalPrice.text = [NSString stringWithFormat:@"￥%ld", self.Price];
    
    
}

- (IBAction)jianBtnClicked:(UIButton *)sender {
    
    shopFoodCell *cell = (shopFoodCell *)[[sender superview] superview];
    NSIndexPath *indexPath = [self.shopInfoView.foodTableV indexPathForCell:cell];
    // tableView Cell 逻辑
    // 改变数组datalist 中ios_count 。
    // 改变Cell中 countLb显示 等..
    
    
    
    
    
    // VC 购物车逻辑
    self.count--;
    self.Price -= cell.priceLv.text.intValue;
    self.totalCount.text = [NSString stringWithFormat:@"%ld", self.count];
    self.totalCount.hidden = NO;
    self.totalPrice.text = [NSString stringWithFormat:@"￥%ld", self.Price];
    if (!self.count) {
        self.totalPrice.text = @"购物车是空的";
        self.totalCount.text = 0;
        self.totalCount.hidden = YES;
        cell.countLb.hidden = YES;
    }
    
    
    
}

- (IBAction)kexuanguigeClicked:(UIButton *)sender {
}












#pragma mark - 加载scrollView 上的3个视图

- (void)congfigDianCaiView{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"" parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"商店菜品  request sucess");
        
        
        //foodClassModel *model = [foodClassModel parse:responseObject];
        //self.shopInfoView.classArr = model
        [self.shopInfoView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"商店菜品  request faill");
        
    }];
}

- (void)congfigPingJiaViewNetManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"" parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"商店评价  request sucess");
        //foodClassModel *model = [foodClassModel parse:responseObject];
        //self.
        [self.shopPingJiaView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"商店评价  request faill");
        
    }];
    
}
- (void)congfigShopInfoViewNetManager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"" parameters:@{} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"商店信息  request sucess");
        //foodClassModel *model = [foodClassModel parse:responseObject];
        //self.shopInfoView.classArr = model
        [self.shopInfoView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"商店信息  request faill");
        
    }];
}















#pragma mark - 懒加载

-(shopInfoDianCaiView *)shopInfoView{
    if (!_shopInfoView) {
        _shopInfoView = [[shopInfoDianCaiView alloc] initWithFrame:self.scrollView.bounds];
        _shopInfoView.tag = 500;    //**********
        
        self.scrollView.contentSize = CGSizeMake(kMainScreenWidth*3, self.scrollView.bounds.size.height);
        
        self.scrollView.pagingEnabled = YES;
        self.scrollView.bounces =NO;
        self.scrollView.delegate = self;
        
        
        [self.scrollView addSubview:_shopInfoView];
        //CGSize size = self.scrollView.bounds.size;
        //_shopInfoView.frame = CGRectMake(0, 0, size.width, size.height);
        
    }
    return _shopInfoView;
}

- (shopPingJiaView *)shopPingJiaView{
    if (!_shopPingJiaView) {
        
        _shopPingJiaView = [[NSBundle mainBundle] loadNibNamed:@"shopPingJiaView" owner:self options:nil].firstObject;
        [self.scrollView addSubview:_shopPingJiaView];
        _shopPingJiaView.frame = CGRectMake(kMainScreenWidth, 0, kMainScreenWidth, kMainScreenHeight);
        
    }
    return _shopPingJiaView;
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
