//
//  ConfirmOrderViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/10.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "ConfirmOrderViewController.h"
#import "AddressCell.h"
#import "PlusMinusCell.h"
#import "SubmitView.h"
#import "shangChengCell.h"
#import "goodsWithGuigeCell.h"



@interface ConfirmOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) SubmitView *submitV;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *datalist;




@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self reloadSubViewPriceLabel];
    [self.tableView registerClass:[AddressCell class] forCellReuseIdentifier:@"address"];
    [self.tableView registerClass:[PlusMinusCell class] forCellReuseIdentifier:@"plus"];
    [self.tableView registerClass:[shangChengCell class] forCellReuseIdentifier:@"shangC"];
    UINib *nib = [UINib nibWithNibName:@"goodsWithGuigeCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"guige"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
}



#pragma tableView  DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count ? self.datalist.count * 2 + 1 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//   选择地址 cell
        
        AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"address" forIndexPath:indexPath];
        cell.name.text = [userModel defaultsUserModel].name;
        cell.teleNum.text = [NSString stringWithFormat:@"%ld", [userModel defaultsUserModel].telephont_num];
#warning 收货地址 逻辑待处理
        cell.address.text = [userModel defaultsUserModel].address_arr.count ? [userModel defaultsUserModel].address_arr[0] : @"请添加收货地址";
        return cell;
        
        
        
        
        
        
        

    }else if (indexPath.row % 2 == 1){      //   shangChengCell  cell
        
        goodsWithGuigeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guige" forIndexPath:indexPath];
        [cell.imgV sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"manhua"]];
        cell.imgV.contentMode = UIViewContentModeScaleAspectFill;
        cell.imgV.clipsToBounds = YES;
        cell.nameL.textColor = [UIColor blackColorNew];
        cell.nameL.text = self.datalist[indexPath.row/2].goods_name;
        cell.guigeL.textColor = [UIColor colorWithR:59 g:59 b:59 alpha:1];
        NSString *guige = @"";
        for (int i = 0; i < self.datalist[indexPath.row/2].standard_arr.count; i++) {
            NSString *str = [NSString stringWithFormat:@"%@:%@ ", self.datalist[indexPath.row/2].standard_arr[i].standard_name, self.datalist[indexPath.row/2].standard_arr[i].selected_standard.standard_detail_name];
            guige = [guige stringByAppendingString:str];
        }
        
        cell.guigeL.text = guige;
        cell.priceL.text = [NSString stringWithFormat:@"%.2f", [self.datalist[indexPath.row/2] getPirceOfGoodsModel]];
        cell.priceL.textColor = [UIColor ShengHuoColor];
        cell.numberL.text = [NSString stringWithFormat:@"x%ld", self.datalist[indexPath.row/2].goods_number];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
        
        
        
        
        
    }else  {// if (indexPath.row % 2 ==  0)             //   plusminuscell
        
        PlusMinusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"plus" forIndexPath:indexPath];
    __weak __typeof(cell)weakCell = cell;
        
        //NSIndexPath *ind = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
        //shangChengCell *baseCell = [tableView cellForRowAtIndexPath:ind];
        
    if (self.datalist[indexPath.row/2 - 1].goods_number == 1) {
        weakCell.minusBtn.enabled = NO;
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row/2 - 1].goods_number];
    
        
        // + 按钮 按下 回调block
    cell.plus = ^(){
        NSLog(@"row: + %ld ",  indexPath.row/2 - 1);
        self.datalist[indexPath.row/2 - 1].goods_number += 1;
        weakCell.numberLabel.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row/2 - 1].goods_number];
        //baseCell.goods_number.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row/2 - 1].goods_number];
        weakCell.minusBtn.enabled = YES;
        [self.tableView reloadData];
        [self reloadSubViewPriceLabel];
        
    };
        
        // - 按钮 按下 回调block
    cell.minus = ^(){
        NSLog(@"row: - %ld ",  indexPath.row/2 - 1);
        self.datalist[indexPath.row/2 - 1].goods_number -= 1;
        weakCell.numberLabel.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row/2 - 1].goods_number];
        //baseCell.goods_number.text = [NSString stringWithFormat:@"%ld", self.datalist[indexPath.row/2 - 1].goods_number];
        if (self.datalist[(indexPath.row/2 - 1)].goods_number == 1) {
            weakCell.minusBtn.enabled = NO;
        }
        [self.tableView reloadData];
        [self reloadSubViewPriceLabel];
    };
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    
}

- (void)reloadSubViewPriceLabel{
    NSInteger price = 0;
    for (int i = 0; i < self.datalist.count; i++) {
        price += self.datalist[i].goods_number * [self.datalist[i] getPirceOfGoodsModel];
    }
    self.submitV.priceL.text = [NSString stringWithFormat:@"￥ %ld 元", price];
}












- (BOOL)tableView:(UITableView *)tableView canFocusRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return YES;
    }else{
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"dian ji %ld hang", indexPath.row);
    if (indexPath.row == 0) {
        //  跳转到 添加收货地址 VC
        
        
        
        
        
        NSLog(@"增加 收货地址按钮按下");
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        if (UITableViewAutomaticDimension < 160) {
            return 160;
        }
    }
    return UITableViewAutomaticDimension;
}
























- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(self.submitV.mas_top);
        }];
    }
    return _tableView;
}

- (SubmitView *)submitV{
    if (!_submitV) {
        _submitV = [[SubmitView alloc] init];
        [self.view addSubview:_submitV];
        [_submitV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(49);
        }];
        _submitV.payBtnClicked = ^(){
            //  支付
            // 调支付宝， 微信支付。
            NSLog(@"支付按钮按下");
#warning add  pay function;
        };
    }
    return _submitV;
}



- (instancetype)initWithVicwControllerType:(ViewControllerType)type datalist:(NSMutableArray<goodsModel *> *)datalist{
    self = [super init];
    if (self) {
        self.type  = type;
        self.datalist = datalist;
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
