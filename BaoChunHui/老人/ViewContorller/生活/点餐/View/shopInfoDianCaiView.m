//
//  shopInfoDianCaiView.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/29.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shopInfoDianCaiView.h"
#import "fenLeiCell.h"
#import "shopFoodCell.h"






@interface shopInfoDianCaiView ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic) CGPoint lastPosition;
@property(nonatomic) BOOL up;               //  用于判断滑动方向


@property(nonatomic) BOOL delay1;
@property(nonatomic, strong) NSTimer *timer;//  用于解决 联动问题




@end






@implementation shopInfoDianCaiView


/*
 * Cell中 点菜个数的实现:
 * 在点击 +、-时 修改数据来源数组中的 对象的属性(自己赋值，初值为0)
 * 
 **********/











-(void)reloadData{
    [self.foodTableV reloadData];
    [self.classTableV reloadData];
}

#pragma mark - tableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"numberOfSection tableView");
    
    if (tableView.tag == 100) {
        return 1;
        return self.classArr.count ? 1 : 0;
    }
    return 15;
    return self.classArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 15;
    
    if (tableView.tag == 100) {
        
        return self.classArr.count;
    }else{
        NSInteger number = 0;
        for (int i = 0; i < self.classArr.count; i++) {
            number += self.classArr[i].count;
        }
        return number;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 100) {
        fenLeiCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fenLeiCell" forIndexPath:indexPath];
        
        //cell.label.text = self.classArr[indexPath.row].className;
        cell.label.text = [NSString stringWithFormat:@"label%ld", indexPath.row];
        return cell;
    }else{
        shopFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopFoodCell" forIndexPath:indexPath];
        //foodListModel *foodModel = self.classArr[indexPath.section][indexPath.row];
        
        //[cell.imgV sd_setImageWithURL:foodModel.foodImg.myURL placeholderImage:[UIImage imageNamed:@""]];
        //cell.goodsName.text = foodModel.foodName;
        //cell.priceLv.text = [NSString stringWithFormat:@"￥%ld", foodModel.price];
        
        
        
        
        
        
        
        
        cell.imgV.image = [UIImage imageNamed:@""];
        cell.goodsName.text = @"name,name";
        cell.priceLv.text = @"22";
        
        
        // 做判断: 是否隐藏  .ios_count属性  计数_记录当前cell 点菜个数
        
        cell.keXuanGuiGe.hidden = YES;
        cell.addBtn.hidden = YES;
        cell.jianBtn.hidden = YES;
        cell.countLb.hidden = YES;
        
        // 如果  可选规格，  addbtn...  隐藏
        if (1) {
            cell.addBtn.hidden = NO;
        } else {
            cell.keXuanGuiGe.hidden = NO;
        }
        
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 100) {
        return 60;
    }
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView.tag == 100) {
        return nil;
    }
    
    return [NSString stringWithFormat: @"section%ld", section];
    return self.classArr[section].className;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

#pragma mark - tableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 100) {
        
        [self.foodTableV scrollToRow:0 inSection:indexPath.row atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        
        /*
         *尝试延时解决联动问题.  chenggong...
         ***/
        self.delay1 = NO;
        [self.timer invalidate];
        self.timer = nil;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:.5 block:^(NSTimer * _Nonnull timer) {
            self.delay1 = YES;
        } repeats:NO];
        
        
//        fenLeiCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        cell.label.textColor = [UIColor redColor];
        
        
        return;
    }
    [self.foodTableV deselectRowAtIndexPath:indexPath animated:YES];
    //  跳转 菜品详细界面
    
    
    
    
    NSLog(@"dianji  senction:%ld  row: %ld", indexPath.section, indexPath.row);
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 100) {
        fenLeiCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.label.textColor = [UIColor blackColor];
    }
}



/*
 *  右侧tableView 上下滑动 左侧变化的逻辑
 *  上划判断 didEndDisplay 的section + 1，
 *  下划判断 willDisplay  的section
 *
 */

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if (!self.up && self.delay1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:section inSection:0];
        [self.classTableV selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionTop)];
        
    }
    
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section{
    if (self.up && self.delay1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:section + 1 inSection:0];
        [self.classTableV selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionTop)];
        
        
    }
    
}

//  判断   滑动方向
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ((self.lastPosition.y - scrollView.contentOffset.y) > 0) {
        //  下
        self.up = NO;
    }else{
        self.up = YES;
    }
    self.lastPosition = scrollView.contentOffset;
}





#pragma mark - 懒加载


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self classTableV];
        [self foodTableV];
        [self.classTableV registerClass:[fenLeiCell class] forCellReuseIdentifier:@"fenLeiCell"];
        UINib *nib = [UINib nibWithNibName:@"shopFoodCell" bundle:nil];
        [self.foodTableV registerNib:nib forCellReuseIdentifier:@"shopFoodCell"];
    }
    return self;
}

- (UITableView *)classTableV{
    if (!_classTableV) {
        _classTableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self addSubview:_classTableV];
        _classTableV.delegate = self;
        _classTableV.dataSource = self;
        _classTableV.tag = 100;
        [_classTableV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(0);
            make.size.width.equalTo(100);
        }];
    }
    return _classTableV;
}

- (UITableView *)foodTableV{
    if (!_foodTableV) {
        _foodTableV = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self addSubview:_foodTableV];
        _foodTableV.delegate = self;
        _foodTableV.dataSource = self;
        _foodTableV.tag = 200;
        [_foodTableV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(0);
            make.width.equalTo(kMainScreenWidth - 100);
            make.left.equalTo(self.classTableV.mas_right);
        }];
    }
    return _foodTableV;
}



//- (NSMutableArray<foodClassModel *> *)classArr{
//    if (!_classArr) {
//        _classArr = [[NSMutableArray<foodClassModel *> alloc] init];
//    }
//    return _classArr;
//}


/*
- (NSMutableArray<foodListModel *> *)foodList{
    if (!_foodList) {
        _foodList = [[NSMutableArray<foodListModel *> alloc] init];
    }
    return _foodList;
}

*/






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
