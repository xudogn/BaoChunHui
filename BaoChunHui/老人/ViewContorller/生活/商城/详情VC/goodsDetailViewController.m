//
//  goodsDetailViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "goodsDetailViewController.h"
#import "gouWuCheView.h"
#import "GouWuCheViewController.h"
#import "ChooseGuiGeView.h"
#import "ConfirmOrderViewController.h"


@interface goodsDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) gouWuCheView *gwcV;

@property(nonatomic, strong) ChooseGuiGeView *chooseGuiGeV;




@end

@implementation goodsDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self headerView];
    
    [BCHTool addHelpBtnItemForVC:self];
    
    self.navigationItem.title = @"详情";
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(self.gwcV.mas_top);
        }];
    }
    return _tableView;
}

- (gouWuCheView *)gwcV{ //  下方（购物车，加入购物车，立即购买）View
    if (!_gwcV) {
        _gwcV = [[gouWuCheView alloc] init];
        [self.view addSubview:_gwcV];
        [_gwcV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(49);
        }];
        __weak __typeof(self)weakSelf = self;
        _gwcV.goToGWC = ^(){                    //  点击购物车按钮， 跳转购物车  VC
            GouWuCheViewController *gwcVC = [[GouWuCheViewController alloc] initWithStyle:UITableViewStyleGrouped ViewContorllerType:weakSelf.type];
            [weakSelf.navigationController pushViewController:gwcVC animated:YES];
        };
        /******       //  点击 购买或加入购物车  加载 选择规格View                   ********/
        
        _gwcV.add_buy = ^(UIButton *sender){
            // 添加到购物车sender.tag == 110      // 立即购买 sender.tag == 111
            
            if (!weakSelf.chooseGuiGeV) {
                weakSelf.chooseGuiGeV = [[ChooseGuiGeView alloc] initWithGoodsModel:weakSelf.goodsModel buttonTag:sender.tag ViewControllerType:weakSelf.type];
                weakSelf.chooseGuiGeV.backgroundColor = [UIColor whiteColor];
                [weakSelf.view addSubview:weakSelf.chooseGuiGeV];
                [weakSelf.chooseGuiGeV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.right.equalTo(0);
                    make.bottom.equalTo(weakSelf.gwcV.mas_bottom).equalTo(0);
                    make.height.equalTo(kMainScreenHeight * 0.8 - 64);
                }];
                
            }
            /****          点击确定按钮 block回调，         ******/
            weakSelf.chooseGuiGeV.clickQewdingBtn = ^(){     //
                [weakSelf clickQuedingBtn:sender];
            };
            
            [UIView animateWithDuration:0.5 animations:^{
                [weakSelf.chooseGuiGeV mas_updateConstraints:^(MASConstraintMaker *make) {
                    CGRect frame = weakSelf.chooseGuiGeV.frame;
                    frame.origin.y = kMainScreenHeight * .2;
                    weakSelf.chooseGuiGeV.frame = frame;
                    
                    [weakSelf.view layoutIfNeeded];
                }];
                
            }];

        };
    }
    return _gwcV;
}

- (void)clickQuedingBtn:(UIButton *)sender{
    //  判断是否选择了所有规格
    for (int i = 0; i < self.goodsModel.standard_arr.count; i++) {
        if (!self.goodsModel.standard_arr[i].selected_standard) {// 如果没有选择此 规格
            // 请选择规格  提示
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择规格" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:nil];   //  nil == {  tableView滚动至未选择规格Cell。。。 待添加   }
            [alertVC addAction:act];
            [self.navigationController presentViewController:alertVC animated:YES completion:^{
                
            }];
            return;
        }
        
    }
    //  如果选择了所有规格则执行以下逻辑
    //  选择规格view 退下
    [UIView animateWithDuration:1 animations:^{
        CGRect frame = self.chooseGuiGeV.frame;
        frame.origin.y = kMainScreenHeight + 40;
        self.chooseGuiGeV.frame = frame;
        [self.view layoutIfNeeded];
    }];
    //  通过sender.tag判断 所点按钮
    switch (sender.tag) {
        case 110:       // 加入购物车        将 self.goodsModel 加入 相应的购物车数组
            switch (self.type) {
                case ViewControllerType_Zudao:
                    [[userModel defaultsUserModel].gouWuChe_zuDao_arr addObject:self.goodsModel];
                    
                    break;
                case ViewControllerType_dianCai:
                    [[userModel defaultsUserModel].gouWuChe_dianCan_arr addObject:self.goodsModel];
                    break;
                case ViewControllerType_bianLiDian:
                    [[userModel defaultsUserModel].gouWuChe_bianLiDian_arr addObject:self.goodsModel];
                    break;
                case ViewControllerType_shangCheng:
                    [[userModel defaultsUserModel].gouWuChe_shangCheng_arr addObject:self.goodsModel];
                    break;
                default:
                    break;
            }
            break;
        case 111:       // 立即购买
        {
            //  跳转 订单详情页面   ，确认订单。
            goodsModel *goodsM = self.goodsModel;
            NSMutableArray<goodsModel *> *arr = [NSMutableArray<goodsModel *> arrayWithObjects:goodsM, nil];
            ConfirmOrderViewController *vc = [[ConfirmOrderViewController alloc] initWithVicwControllerType:self.type  datalist:arr];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            
            break;
        default:
            break;
    }
    
}





- (void)headerView{
    UIView *maskV = [[UIView alloc ] init];
    UIImageView *imgV = [[UIImageView alloc] init];
    [maskV addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(0);
        make.height.equalTo(kMainScreenWidth*3/4.0);
    }];
    
    [imgV sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"manhua"]];
    
    UILabel *nameL = [[UILabel alloc] init];
    [maskV addSubview:nameL];
    nameL.text = nameL.text = self.goodsModel.goods_name;
    [nameL sizeToFit];
    nameL.font = [UIFont systemFontOfSize:28];
    nameL.numberOfLines = 0;
    [nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(12);
        make.width.equalTo(kMainScreenWidth-24);
        
        make.top.equalTo(imgV.mas_bottom).equalTo(12);
    }];
    
    UILabel *s = [[UILabel alloc] init];
    [maskV addSubview:s];
    s.text = [NSString stringWithFormat:@"￥"];
    s.textColor = [UIColor ShengHuoColor];
    [s sizeToFit];
    s.font = [UIFont systemFontOfSize:20];
    [s mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(12);
        make.bottom.equalTo(-12);
    }];
    
    UILabel *priceL = [[UILabel alloc] init];
    [maskV addSubview:priceL];
    priceL.text = [NSString stringWithFormat:@"%.2f", self.goodsModel.goods_price];
    
    priceL.textColor = [UIColor ShengHuoColor];
    
    priceL.font = [UIFont systemFontOfSize:36];
    [priceL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameL.mas_bottom).equalTo(12);
        make.left.equalTo(30);
        make.bottom.equalTo(-12);
        
    }];
    [priceL sizeToFit];
    //CGFloat labelHeight = [nameL sizeThatFits:CGSizeMake(nameL.frame.size.width, MAXFLOAT)].height;
    maskV.frame = CGRectMake(0, 0, kMainScreenWidth, kMainScreenWidth*3/4.0 + 40 + 41 + priceL.frame.size.height + 10);
    
    NSLog(@"%f", nameL.height);
    
    
    
    self.tableView.tableHeaderView = maskV;
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"产地";
    cell.detailTextLabel.text = @"北京";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (instancetype)initWithGoodsModel:(goodsModel *)goodsModel ViewControllerType:(ViewControllerType)type{
    self = [super init];
    if (self) {
        self.goodsModel = goodsModel;
        self.type = type;
    }
    return self;
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
