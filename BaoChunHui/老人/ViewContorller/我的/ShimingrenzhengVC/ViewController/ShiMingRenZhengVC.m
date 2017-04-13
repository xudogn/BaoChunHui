//
//  ShiMingRenZhengVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/3/3.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "ShiMingRenZhengVC.h"
#import "SMRZView.h"


@interface ShiMingRenZhengVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;

@end

@implementation ShiMingRenZhengVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    SMRZView *SMRZview = [[NSBundle mainBundle] loadNibNamed:@"SMRZView" owner:nil options:nil].firstObject;
    [self.scrollV addSubview:SMRZview];
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.scrollV.showsHorizontalScrollIndicator = NO;
    [self.scrollV sizeToFit];
    self.scrollV.contentSize = SMRZview.size;
    //[self.scrollV sizeThatFits:CGSizeMake(600, 1000)];
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
