//
//  GuiGeCell.m
//  BaoChunHui
//
//  Created by xudogn on 16/12/12.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "GuiGeCell.h"

@implementation GuiGeCell

- (void)setStandardModel:(StandardModel *)standardModel{
    _standardModel = standardModel;
    [self configButtons];
}

- (void)configButtons{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, 20, 280, 26)];
    [self.contentView addSubview:label];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    label.text = self.standardModel.standard_name;
    label.font = [UIFont systemFontOfSize:25];
    
    int width = 0;
    int height = 0;
    int number = 0;
    int han = 0;
    for (int i = 0; i < self.standardModel.standard_detail_arr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 500 + i;
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        [button setTitle:self.standardModel.standard_detail_arr[i].standard_detail_name forState:UIControlStateNormal];
        button.layer.cornerRadius = 3;
        button.layer.masksToBounds = YES;
        CGSize titleSize = [self getSizeByString:self.standardModel.standard_detail_arr[i].standard_detail_name AndFontSize:25];
        han = han +titleSize.width;
        if (han > [[UIScreen mainScreen]bounds].size.width) {
            han = 0;
            han = han + titleSize.width;
            height++;
            width = 0;
            width = width+titleSize.width;
            number = 0;
            button.frame = CGRectMake(12, 46 + 10 +50*height, titleSize.width, 40);
            
        }else{
            button.frame = CGRectMake(width+12+(number*10), 46 + 10 +50*height, titleSize.width, 40);
            width = width+titleSize.width;
        }
        self.cellheight = 50 *height + 56 + 40 + 20;
        number++;
        
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 3;
        
        [button setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [button setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]];
        [button setTitle:self.standardModel.standard_detail_arr[i].standard_detail_name forState:UIControlStateNormal];
        [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
        
    }
    
}

- (void)handleButton:(UIButton *)sender{
    for (int i = 0; i < self.standardModel.standard_detail_arr.count; i++) {
        UIButton *button = [self viewWithTag:500 +i];
        button.enabled = YES;
        button.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    sender.enabled = NO;
    sender.backgroundColor = [UIColor colorWithRed:251/255.0 green:78/255.0 blue:68/255.0 alpha:1];
    !self.chooseGuige ?: self.chooseGuige(sender);
}

//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}
























- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
