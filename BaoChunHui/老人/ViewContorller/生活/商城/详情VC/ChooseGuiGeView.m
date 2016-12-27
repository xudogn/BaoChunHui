//
//  ChooseGuiGeView.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/12.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "ChooseGuiGeView.h"
#import "PlusMinusCell.h"
#import "GuiGeCell.h"


@interface ChooseGuiGeView ()<UITableViewDelegate, UITableViewDataSource>



@end

@implementation ChooseGuiGeView



#pragma tableView Delegate

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"%ld", 1 + self.goodsmodel.standard_arr.count);
    return 1 + self.goodsmodel.standard_arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.goodsmodel.standard_arr.count) {
        PlusMinusCell *cell = [tableView dequeueReusableCellWithIdentifier:@"plus" forIndexPath:indexPath];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        if (self.goodsmodel.goods_number == 1) {
            cell.minusBtn.enabled = NO;
        }
        cell.numberLabel.text = [NSString stringWithFormat:@"%ld", self.goodsmodel.goods_number];
        __weak __typeof(cell)weakcell = cell;
        cell.plus = ^(){
            weakcell.minusBtn.enabled = YES;
            self.goodsmodel.goods_number += 1;
            
            [self reloadGoodsNumber:weakcell];
            [self reloadPrice];
        };
        cell.minus = ^(){
            if (_goodsmodel.goods_number > 1) {
                self.goodsmodel.goods_number -= 1;
                if (self.goodsmodel.goods_number == 1) {
                    weakcell.minusBtn.enabled = NO;
                }
            }
            
            [self reloadGoodsNumber:weakcell];
            [self reloadPrice];
        };
        
        return cell;
    }else{
        GuiGeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"guige" forIndexPath:indexPath];
        
        cell.standardModel = self.goodsmodel.standard_arr[indexPath.row];
        
        /****          点击  具体规格  按钮 block回调，         ******/
        cell.chooseGuige = ^(UIButton *sender){
            
            // 获取所选 具体规格
            StandardDetailModel *detail = self.goodsmodel.standard_arr[indexPath.row].standard_detail_arr[sender.tag - 500];
            // 存储所选规格
            self.goodsmodel.standard_arr[indexPath.row].selected_standard = detail;
            [self reloadPrice];
            
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.height = cell.cellheight;
        return cell;
    }
}

- (void)reloadPrice{
    self.priceL.text = [NSString stringWithFormat:@"%.2f", [self.goodsmodel getPirceOfGoodsModel]];
}
- (void)reloadGoodsNumber:(PlusMinusCell *)cell{
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", self.goodsmodel.goods_number];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击 tableviewcell");
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == self.goodsmodel.standard_arr.count) {
        return UITableViewAutomaticDimension;
    }else{
        //NSLog(@"%ld", ((GuiGeCell *)[tableView cellForRowAtIndexPath:indexPath]).cellheight);
        
        return 116;
    }
    
}








- (UIButton *)QueDingBtn{
    if (!_QueDingBtn) {
        _QueDingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_QueDingBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_QueDingBtn setTintColor:[UIColor whiteColor]];
        [_QueDingBtn setBackgroundColor:[UIColor ShengHuoColor]];
        _QueDingBtn.titleLabel.font = [UIFont systemFontOfSize:30];
        [self addSubview:_QueDingBtn];
        [_QueDingBtn bk_addEventHandler:^(id sender) {
            // 点击确定按钮
           
            !self.clickQewdingBtn ?: self.clickQewdingBtn();
        } forControlEvents:UIControlEventTouchUpInside];
        [_QueDingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(49);
        }];
    }
    return _QueDingBtn;
}







- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [self addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle= UITableViewCellSeparatorStyleSingleLine;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.headV.mas_bottom);
            make.bottom.equalTo(self.QueDingBtn.mas_top);
        }];
        [_tableView registerClass:[PlusMinusCell class] forCellReuseIdentifier:@"plus"];
        [_tableView registerClass:[GuiGeCell class] forCellReuseIdentifier:@"guige"];
    }
    return _tableView;
}


- (UIView *)headV{
    if (!_headV) {
        
        
        
        _headV = [[UIView alloc] init];
        [self addSubview:_headV];
        [_headV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(103);
        }];
        
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(12, -20, 107, 107)];
        [_headV addSubview:imgV];
        
        imgV.layer.cornerRadius = 3;
        imgV.clipsToBounds = YES;
        imgV.layer.borderWidth = 3;
        imgV.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [imgV sd_setImageWithURL:[NSURL URLWithString:self.goodsmodel.goods_url] placeholderImage:[UIImage imageNamed:@"IMG_0415"]];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
#warning 添加图片
        
        UILabel *symble = [[UILabel alloc]initWithFrame:CGRectMake(131, 23, 20, 30)];
        [_headV addSubview:symble];
        symble.textColor = [UIColor ShengHuoColor];
        symble.text = @"￥";
        symble.font = [UIFont systemFontOfSize:20];
        [symble sizeToFit];
        
        self.priceL = [[UILabel alloc] init];
        [_headV addSubview:self.priceL];
        [self.priceL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(16);
            make.left.equalTo(symble.mas_right).equalTo(3);
            make.height.equalTo(30.5);
        }];
        [self.priceL sizeToFit];
        self.priceL.font = [UIFont systemFontOfSize:30];
        self.priceL.textColor = [UIColor colorWithRed:255/255.0 green:86/255.0 blue:86/255.0 alpha:1];
        self.priceL.text = [NSString stringWithFormat:@"%.2f", self.goodsmodel.goods_price];
        
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headV addSubview:cancelBtn];
        
//#warning 删除 按钮颜色 下行
        cancelBtn.backgroundColor = [UIColor blueColor];    // 删除
//#warning 添加 X 按钮
        [cancelBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [cancelBtn bk_addEventHandler:^(id sender) {
            [UIView animateWithDuration:1 animations:^{
                CGRect frame = self.frame;
                frame.origin.y = kMainScreenHeight + 40;
                self.frame = frame;
                [self layoutIfNeeded];
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.right.equalTo(-12);
        }];
        
        UILabel *xuanzeL = [[UILabel alloc] init];
        [_headV addSubview:xuanzeL];
        xuanzeL.font = [UIFont systemFontOfSize:25];
        [xuanzeL sizeToFit];
        xuanzeL.text = @"选择规格";
        xuanzeL.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [xuanzeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.priceL.mas_bottom).equalTo(10);
            make.left.equalTo(imgV.mas_right).equalTo(12);
        }];
    }
    return _headV;
}



- (instancetype)initWithGoodsModel:(goodsModel *)goodsmodel buttonTag:(NSInteger)tag ViewControllerType:(ViewControllerType)type{
    self = [super init];
    if (self ) {
        self.goodsmodel = goodsmodel;
        self.button_tag = tag;
        self.type = type;
        [self headV];
        [self tableView];
        [self QueDingBtn];
        [self reloadPrice];
    }
    return self;
}

@end
