//
//  PayViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/5.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;




@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addConfirmBtn];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(0);
        make.bottom.equalTo(self.btn.mas_top);
    }];
    
}


//  确认付款按钮
- (void)addConfirmBtn{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = [UIColor orangeColor];
    
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn.titleLabel.textColor = [UIColor whiteColor];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.height.equalTo(49);
    }];
    
    NSString *price = [NSString stringWithFormat:@""];              // 取值 显示
    [self.btn setTitle:price forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(payBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)payBtnClicked{
    // 付款   支付宝 or 微信。
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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
