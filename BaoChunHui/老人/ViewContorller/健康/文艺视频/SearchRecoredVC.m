//
//  SearchRecoredVC.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/10.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "SearchRecoredVC.h"
#import "VideoSearchResuleVC.h"

@interface SearchRecoredVC ()<UISearchBarDelegate>

@property(nonatomic, strong)UISearchBar *searchBar;

@property(nonatomic, strong) NSMutableArray *historyArr;


@end

@implementation SearchRecoredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSearchBar];
    [TRFactory addBackItemForVC:self];
    self.view.backgroundColor = [UIColor colorWithR:245 g:245 b:245 alpha:1];
}

- (void)configSearchBar{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth - 90, 44)];
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入关键字";
    [self addsearchRecordView];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"searchBar text did change: %@", searchText);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *historyArrPath = [path stringByAppendingPathComponent:@"historyRecord/historyArr"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileexist = [fileManager fileExistsAtPath:historyArrPath];
    if (!fileexist) {
        NSArray *arr = [NSArray arrayWithObject:searchBar.text];
        [fileManager createDirectoryAtPath:historyArrPath withIntermediateDirectories:YES attributes:nil error:nil];
        [arr writeToFile:historyArrPath atomically:YES];
    } else {
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:historyArrPath];
        [array addObject:searchBar.text];
        [array writeToFile:historyArrPath atomically:YES];
    }
    
    VideoSearchResuleVC *vc = [[VideoSearchResuleVC alloc] initWithSearchText:searchBar.text];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)addsearchRecordView{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *historyArrPath = [path stringByAppendingPathComponent:@"historyRecord/historyArr"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileexist = [fileManager fileExistsAtPath:historyArrPath];
    if (!fileexist) {
        return;
    }
    self.historyArr = [NSMutableArray arrayWithContentsOfFile:historyArrPath];
    
    // 历史记录有数据
    if (self.historyArr && self.historyArr.count) {
        UILabel *historyLb = [[UILabel alloc] initWithFrame:CGRectMake(12, 24, 110, 52)];
        historyLb.text = @"历史记录";
        historyLb.font = [UIFont systemFontOfSize:28];
        [historyLb sizeToFit];
        historyLb.textColor = [UIColor colorWithHexString:@"1a1a1a"];
        [self.view addSubview:historyLb];
        [self addBtnWithArray:self.historyArr];
    }
}

- (void)addBtnWithArray:(NSArray *)array{
    int width = 0;
    int height = 0;
    int number = 0;
    int han = 0;
    for (int i = 0; i < array.count + 1; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 500 + i;
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.layer.cornerRadius = 3;
        button.layer.masksToBounds = YES;
        CGSize titleSize = [self getSizeByString:array[i] AndFontSize:25];
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
        number++;
        
        [button setTitleColor:[UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [button setBackgroundColor:[UIColor colorWithRed:228/255.0 green:228/255.0 blue:228/255.0 alpha:1]];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        if (i == array.count) {
            // 添加清除历史记录按钮
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:@"清除历史记录" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:25];
            btn.tintColor = [UIColor lightGrayColor];
            btn.frame = CGRectMake(62, 46 + 10 +50*(height+1), kMainScreenWidth-62*2, 40);
            
            [btn addTarget:self action:@selector(deleteHistoryRecord) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    }

}
- (void)deleteHistoryRecord{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *historyArrPath = [path stringByAppendingPathComponent:@"historyRecord/historyArr"];
    NSArray *arr = nil;
    [arr writeToFile:historyArrPath atomically:YES];
}



- (void)handleButton:(UIButton *)btn{
    self.searchBar.text = btn.titleLabel.text;
    [self searchBarSearchButtonClicked:self.searchBar];
}

- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithR:255 g:207 b:74 alpha:1];
}

@end
