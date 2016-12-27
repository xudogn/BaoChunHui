//
//  searchBarController.m
//  zhaoHuDemo
//
//  Created by BCH on 2016/12/13.
//  Copyright © 2016年 BCH. All rights reserved.
//

#import "searchBarController.h"
#import "TRFactory.h"
#import "searchTableViewCell.h"
//#import <BaiduMapAPI_Search/BMKPoiSearch.h>

@interface searchBarController ()<UITableViewDelegate,UITableViewDataSource>//,BMKPoiSearchDelegate>
{
    NSString *_cityName;   // 检索城市名
    NSString *_keyWord;    // 检索关键字
    int currentPage;            //  当前页
}
//poi搜索
//@property (nonatomic) BMKPoiSearch *poisearcher;
@property (nonatomic) CLLocation *location;
@property (nonatomic) UIView *maskView;
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UIButton *buttonImage;
@property (nonatomic) UITableView *tableView;
@end

@implementation searchBarController
//- (UIView *)maskView {
//    if (!_maskView) {
//        _maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 66)];
//        [self.view addSubview:_maskView];
//        _maskView.backgroundColor = kRGBA(249, 110, 52, 1);
//    }
//    return _maskView;
//}
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        self.navigationItem.titleView = _searchBar;
        //_searchBar.backgroundColor = [UIColor purpleColor];
        _searchBar.placeholder = @"所在小区、街道、大厦名";
    }
    return _searchBar;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        [self.view addSubview:_tableView];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 83;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    searchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.titleLb.text = @"翠湖国家城市湿地";
    cell.subLb.text = @"北京市海淀区";
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self searchBar];
    [self tableView];
    self.view.backgroundColor = kRGBA(245, 245, 245, 1);
    [TRFactory addBackItemForVC:self];
    [TRFactory addSearchItemForVC:self clickedHandler:nil];
    [_tableView registerClass:[searchTableViewCell class] forCellReuseIdentifier:@"cell"];
   // [self initPoiSeaarch];
}
//- (BMKPoiSearch *)poisearcher {
//    if (!_poisearcher) {
//        _poisearcher = [[BMKPoiSearch alloc] init];
//        _poisearcher.delegate = self;
//        BMKCitySearchOption *citySearchOption = [[BMKCitySearchOption alloc] init];
//        citySearchOption.pageIndex = 0;
//        
//        citySearchOption.pageCapacity = 20;
//        
//        citySearchOption.city = @"北京";
//        
//        citySearchOption.keyword = _searchBar.text;
//    }
//    return _poisearcher;
//}
//- (void)initPoiSeaarch {
//    _poisearcher = [[BMKPoiSearch alloc] init];
//    _poisearcher.delegate = self;
//    currentPage = 0;
//    //附近云检索，其他检索方式见详细api
//    BMKNearbySearchOption *nearBySearchOption = [[BMKNearbySearchOption alloc]init];
//    nearBySearchOption.pageIndex = currentPage; //第几页
//    nearBySearchOption.pageCapacity = 10;  //最多几页
//    nearBySearchOption.keyword = @"设施";   //检索关键字
//    nearBySearchOption.location = _location.coordinate; // poi检索点
//
//    nearBySearchOption.radius = 1000; //检索范围 m
//    BOOL flag = [_poisearcher poiSearchNearBy:nearBySearchOption];
//    if(flag)
//    {
//        NSLog(@"城市内检索发送成功");
//    }
//    else
//    {
//        NSLog(@"城市内检索发送失败");
//    }
//    
//}
//- (void)onGetPoiResult:(BMKPoiSearch*)searcher result:(BMKPoiResult*)poiResult errorCode:(BMKSearchErrorCode)errorCode
//{
//    if (errorCode == BMK_SEARCH_NO_ERROR)
//    {
//        for (int i = 0; i < poiResult.poiInfoList.count; i++)
//        {
//            BMKPoiInfo *poi = [poiResult.poiInfoList objectAtIndex:i];
//            //BMKPoiInfo就是检索出来的poi信息
//            poi.city = @"北京";
//            poi.address = @"海淀区翠湖路";
//        }
//    }
//    
//}
- (void)inPutAction:(UISearchBar *)search {
    [self performSelector:@selector(delay) withObject:self afterDelay:0.5];
}
//取消键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_searchBar resignFirstResponder];
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
