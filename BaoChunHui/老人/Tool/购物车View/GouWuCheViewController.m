//
//  GouWuCheViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/8.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "GouWuCheViewController.h"
#import "SelectModel.h"
#import "SubmitView.h"
#import "shangChengCell.h"
#import "ConfirmOrderViewController.h"



@interface GouWuCheViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray<goodsModel *> *datalist;

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) SubmitView *subV;

@property(nonatomic, strong) NSMutableArray<SelectModel *> *selecArr;

@property(nonatomic) NSInteger total_num;// 判断 支付按钮 激活状态

@end


@implementation GouWuCheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.type) {
        case ViewControllerType_dianCai:
            self.datalist = [userModel defaultsUserModel].gouWuChe_dianCan_arr;
            break;
        case ViewControllerType_bianLiDian:
            self.datalist = [userModel defaultsUserModel].gouWuChe_bianLiDian_arr;
            break;
        case ViewControllerType_shangCheng:
            self.datalist = [userModel defaultsUserModel].gouWuChe_shangCheng_arr;
            break;
        case ViewControllerType_Zudao:
            self.datalist = [userModel defaultsUserModel].gouWuChe_zuDao_arr;
            break;
        default:
            break;
    }
    
    
    self.total_num = 0;
    self.subV.payBtn.enabled = NO;
    [self.tableView registerClass:[shangChengCell class] forCellReuseIdentifier:@"cell"];
    
    self.navigationItem.title = @"购物车";
    kSetNaviBarItemTitleFontAndColor
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.datalist.count ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datalist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    shangChengCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    goodsModel *model = self.datalist[indexPath.row];
    [cell.imgV sd_setImageWithURL:[NSURL URLWithString:model.goods_url] placeholderImage:[UIImage imageNamed:@"manhua"]];
    
    cell.goods_name.text = model.goods_name;
    float price = [model getPirceOfGoodsModel];
    NSInteger num = model.goods_number;
    cell.goods_price.text = [NSString stringWithFormat:@"%.2f", price];
    cell.goods_number.text = [NSString stringWithFormat:@"x%ld", num];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"通知" message:@"确定删除？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actD = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        // 删除订单  ，删除cell   从网上本地记录删除订单
        
        
        
        //[self.tableView deleteRowAtIndexPath:indexPath withRowAnimation:YES];
        
        switch (self.type) {
            case ViewControllerType_dianCai:
                [[userModel defaultsUserModel].gouWuChe_dianCan_arr removeObjectAtIndex:indexPath.row];
                break;
            case ViewControllerType_bianLiDian:
                 [[userModel defaultsUserModel].gouWuChe_bianLiDian_arr removeObjectAtIndex:indexPath.row];
                break;
            case ViewControllerType_shangCheng:
                 [[userModel defaultsUserModel].gouWuChe_shangCheng_arr removeObjectAtIndex:indexPath.row];
                break;
            case ViewControllerType_Zudao:
                 [[userModel defaultsUserModel].gouWuChe_zuDao_arr removeObjectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        [self.tableView reloadData];
        //  刷新 购物车View 内容数据
        
        
        if (self.selecArr[indexPath.row].isSelected) {
            
            [self reloadPrice];
            self.total_num -= 1;
        }
        
        
        
        

        //添加网络请求， 从服务器删除订单
        
        //[alertVC dismissViewControllerAnimated:YES completion:nil];
        
    }];
    UIAlertAction *actC = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        [alertVC dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertVC addAction:actC];
    [alertVC addAction:actD];
    [self presentViewController:alertVC animated:YES completion:nil];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    shangChengCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.selecArr[indexPath.row].isSelected = !self.selecArr[indexPath.row].isSelected;
    if (self.selecArr[indexPath.row].isSelected) {
        
        cell.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        self.total_num += 1;
    }else{
        
        cell.backgroundColor = [UIColor whiteColor];
        self.total_num -= 1;
    }
    
    
    [self reloadPrice];
    
    
    if (self.total_num) {
        self.subV.payBtn.enabled = YES;
    }else{
        self.subV.payBtn.enabled = NO;
    }
}








- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
    [self reloadPrice];
}
- (void)reloadPrice{
    NSInteger price = 0;
    for (int i = 0; i < self.selecArr.count; i++) {
        if (self.selecArr[i].isSelected) {
            price += [self.datalist[i] getPirceOfGoodsModel];
        }
    }
    
    self.subV.priceL.text = [NSString stringWithFormat:@"￥ %ld 元", price];
}



- (instancetype)initWithStyle:(UITableViewStyle)style ViewContorllerType:(ViewControllerType)type{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
            make.bottom.equalTo(self.subV.mas_top);
        }];
    }
    return _tableView;
}

- (SubmitView *)subV{
    if (!_subV ) {
        _subV = [[SubmitView alloc] init];
        [self.view addSubview:_subV];
        [_subV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(49);
        }];
        MJWeakSelf
        _subV.payBtnClicked = ^(){
            // 立即支付按钮按下 回调
            //  跳转 确认订单界面
            NSMutableArray<goodsModel *> *arr = [[NSMutableArray<goodsModel *> alloc]init];
            for (int i = 0 ; i < self.selecArr.count; i++) {
                if (weakSelf.selecArr[i].isSelected) {
                    [arr addObject:weakSelf.datalist[i]];
                }
            }
            //   将arr传入下个页面
            ConfirmOrderViewController *vc = [[ConfirmOrderViewController alloc] initWithVicwControllerType:weakSelf.type datalist:arr];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        };
    }
    return _subV;
}


- (NSMutableArray<SelectModel *> *)selecArr{
    if (!_selecArr) {
        _selecArr = [NSMutableArray<SelectModel *> new];
        for (int i = 0 ; i < self.datalist.count; i++) {
            SelectModel *model = [[SelectModel alloc] init];
            model.isSelected = NO;
            [_selecArr addObject:model];
        }
    }
    
    
    return _selecArr;
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
