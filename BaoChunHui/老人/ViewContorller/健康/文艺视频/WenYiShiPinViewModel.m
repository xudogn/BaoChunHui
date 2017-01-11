//
//  WenYiShiPinViewModel.m
//  BaoChunHui
//
//  Created by xudogn on 17/1/10.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "WenYiShiPinViewModel.h"

@implementation WenYiShiPinViewModel

- (NSString *)titleAtIndex:(NSInteger)index{
    return self.datalist[index].title;
}

- (NSURL *)imageURLAtIndex:(NSInteger)index{
    return self.datalist[index].image_url.myURL;
}

- (NSURL *)videoURLAtIndex:(NSInteger)index{
    return self.datalist[index].video_url.myURL;
}

- (void)getNetRequestWithVideoType:(VideoType)type RequestMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSString *path = nil;
    switch (type) {
        case VideoType_QinQiShuHUa:
            path = @"";
            break;
        case VideoType_YangHuaMiJi:
            path = @"";
            break;
        case VideoType_ShengYueXiQu:
            path = @"";
            break;
        case VideoType_PengRenZhiNan:
            path = @"";
            break;
            
        default:
            break;
    }
    if (requestMode == RequestModeRefresh) {
        self.page = 0;
    }
    NSDictionary *dic = @{@"page": @(self.page)};
    self.dataTask = [BaseNetworking GET:path parameters:dic completionHandler:^(id responseObj, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.datalist removeAllObjects];
            }
            [self.datalist addObjectsFromArray:[WenYiShiPinViewModel parse:responseObj]];
            self.page += 1;
            !completionHandler ?: completionHandler(nil);
        } else {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    
}








- (NSMutableArray<WenYiShiPinModel *> *)datalist{
    if (!_datalist) {
        _datalist = [[NSMutableArray<WenYiShiPinModel *> alloc] init];
    }
    return _datalist;
}

@end
