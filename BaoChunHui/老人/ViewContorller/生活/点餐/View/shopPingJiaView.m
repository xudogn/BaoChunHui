//
//  shopPingJiaView.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/30.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "shopPingJiaView.h"
#import "shopPingJiaCell.h"





@interface shopPingJiaView ()<UITableViewDelegate, UITableViewDataSource>






@end


@implementation shopPingJiaView





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    //return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shopPingJiaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopPingJiaCell" forIndexPath:indexPath];
    
//    cell.iconImgV sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#>
//    cell.nameLb.text = self.dataList[indexPath.row].
//    cell.pingJiaLb.text =
//    cell.timeLb.text =
//    cell.sendTime.text =
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}













- (void)reloadData{
    [self.pingJiaTableView reloadData];
    //  给View  数据刷新
    
    
    
    
}



#pragma mark   -  生命周期
+(id)viewFromNibNamed:(NSString*)nibName owner:(id)owner{
    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"shopPingJiaView" owner:self options:nil];
    return [nibView firstObject];
}


- (void)awakeFromNib{
    [super awakeFromNib];
    UINib *nib = [UINib nibWithNibName:@"shopPingJiaCell" bundle:nil];
    [self.pingJiaTableView registerNib:nib forCellReuseIdentifier:@"shopPingJiaCell"];
    self.pingJiaTableView.delegate = self;
    self.pingJiaTableView.dataSource = self;
}




#pragma mark - 懒加载

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = [[NSArray alloc] init];     // 加上 <泛型 *>
    }
    return _dataList;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
