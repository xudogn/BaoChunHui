//
//  shopPingJiaView.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/30.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopPingJiaView : UIView

@property (weak, nonatomic) IBOutlet UILabel *scoreLb; // 评分label

@property (weak, nonatomic) IBOutlet UILabel *haoPingLvLb;// 好评率

@property (weak, nonatomic) IBOutlet UILabel *senPingFenLbb;//配送评分

@property (weak, nonatomic) IBOutlet UIImageView *sendStar1;

@property (weak, nonatomic) IBOutlet UIImageView *sendStar2;

@property (weak, nonatomic) IBOutlet UIImageView *sendStar3;
@property (weak, nonatomic) IBOutlet UIImageView *sendStar4;
@property (weak, nonatomic) IBOutlet UIImageView *sendStar5;

@property (weak, nonatomic) IBOutlet UILabel *shangJIaPingFenLb;// 商家评分lb

@property (weak, nonatomic) IBOutlet UIImageView *shangJiaStar1;
@property (weak, nonatomic) IBOutlet UIImageView *shangJiaStar2;

@property (weak, nonatomic) IBOutlet UIImageView *shangJiaStar3;
@property (weak, nonatomic) IBOutlet UIImageView *shangJiaStar4;
@property (weak, nonatomic) IBOutlet UIImageView *shangJiaStar5;


//// ---------  按钮

@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *imgBtn;
@property (weak, nonatomic) IBOutlet UIButton *haoPingBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhongPIngBtn;
@property (weak, nonatomic) IBOutlet UIButton *chaPIngBtn;



@property (weak, nonatomic) IBOutlet UITableView *pingJiaTableView;




@property(nonatomic, strong) NSArray *dataList;   // 数据来源   <泛型 *>




- (void)reloadData;







@end
