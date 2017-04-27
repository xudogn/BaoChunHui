//
//  MiShuViewController.m
//  BaoChunHui
//
//  Created by BCH on 2017/4/12.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "MiShuViewController.h"
#import "XiaoMiShuTableViewCell.h"
#import "TianjiaAlertViewController.h"
#import "Data.h"
#import "Clock.h"

@interface MiShuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *showTableView;
@property (nonatomic) UIButton *addButton;
@property (nonatomic) NSMutableArray *dataArray;
@end

@implementation MiShuViewController
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(228, 83, 138, 1);
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.barTintColor = kRGBA(48, 206, 185, 1);
}
- (UITableView *)showTableView {
    if (!_showTableView) {
        _showTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height - 150)];
        [self.view addSubview:_showTableView];
    }
    _showTableView.backgroundColor = [UIColor whiteColor];
    [_showTableView registerClass:[XiaoMiShuTableViewCell class] forCellReuseIdentifier:@"cell"];
    _showTableView.delegate = self;
    _showTableView.dataSource = self;
    return _showTableView;
}
- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [[UIButton alloc] init];
        [self.view addSubview:_addButton];
        [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(50);
        }];
        [_addButton setTitle:@"添加提醒" forState:UIControlStateNormal];
        [_addButton setTitleColor:kRGBA(228, 83, 138, 1) forState:UIControlStateNormal];
        _addButton.backgroundColor = [UIColor whiteColor];
        _addButton.titleLabel.font = [UIFont systemFontOfSize:25];
        
        [_addButton addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}
- (void)btnClicked {
    self.hidesBottomBarWhenPushed = YES;
    TianjiaAlertViewController *vc = [[TianjiaAlertViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [TRFactory addBackItemForVC:self];
    UIBarButtonItem *rightBtn1 = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteCell:)];
    UIBarButtonItem *rightBtn2 = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItems = @[rightBtn2, rightBtn1];
    
   
    self.navigationItem.title = @"小秘书";
    [self showTableView];
    [self addButton];
    self.view.backgroundColor = kRGBA(245, 245, 245, 1);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 20)];
    label.text = @"今天";
    label.backgroundColor = kRGBA(245, 245, 245, 1);
    
    return label;
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[Data clockData] mutableCopy];
    }
    return _dataArray;
}
/******** 添加或删除的 两问一答  *************************/
//问一 某行可以编辑  默认都可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//问二 每行的编辑按键 是什么样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//答一  点中加号 或 减号 做对应的事情
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"插入数据");
        
    }else  if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"删除数据");
        [self removeCityIndexPath:indexPath];
    }
}
//根据 分区号 及 行号  把对应的城市删除掉
-(void)removeCityIndexPath:(NSIndexPath *)indexPath {
    //删除 点中行 对应数组中的 元素
    [self.dataArray removeObjectAtIndex:indexPath.row];
    //刷新 tableView
    [self.showTableView reloadData];
}
/******** 移动的 一问一答  *************************/
//问一 当前行是否可以移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//答一 移动后 如何响应
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //把 移动 源位置 的 城市获取出来
    Clock *clock = self.dataArray[sourceIndexPath.row];
    //把 数组中 源位置的 元素删掉
    [self.dataArray removeObjectAtIndex:sourceIndexPath.row];
    //把移动的城市对象 插入到 数组目标位置
    [self.dataArray insertObject:clock atIndex:destinationIndexPath.row];
    //刷新 tableView
    [self.showTableView reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XiaoMiShuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Clock *clock = self.dataArray[indexPath.row];

    cell.titleLb.text = clock.titleStr;
    cell.timeLb.text = clock.subStr;
    return cell;
}
//删除cell
- (void)deleteCell:(UIBarButtonItem *)sender {
    NSLog(@".....");
    //支持同时选中多行
    self.showTableView.allowsMultipleSelectionDuringEditing = YES;
    if (self.showTableView.isEditing) {
        [self.showTableView beginUpdates];
        NSArray * selectRows = [self.showTableView indexPathsForSelectedRows];
        NSMutableIndexSet * indexpaths = [[NSMutableIndexSet alloc] init];
        for(NSIndexPath * path in selectRows){
            [indexpaths addIndex:path.row];
        }
        [self.dataArray removeObjectsAtIndexes:indexpaths];
        
        [self.showTableView deleteRowsAtIndexPaths:selectRows withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.showTableView endUpdates];
        [self.showTableView setEditing:NO animated:YES];
        [sender setTitle:@"删除"];
    }else{
        [self.showTableView setEditing:!self.showTableView.editing animated:YES];
        [sender setTitle:@"完成"];
    }
    
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
