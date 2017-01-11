//
//  WenYiShiPinViewModel.h
//  BaoChunHui
//
//  Created by xudogn on 17/1/10.
//  Copyright © 2017年 xudogn. All rights reserved.
//

#import "BaseViewModel.h"
#import "WenYiShiPinModel.h"

typedef enum : NSUInteger {
    VideoType_PengRenZhiNan,
    VideoType_YangHuaMiJi,
    VideoType_QinQiShuHUa,
    VideoType_ShengYueXiQu
} VideoType;

@interface WenYiShiPinViewModel : BaseViewModel

@property(nonatomic, assign) NSInteger page;


@property(nonatomic, strong) NSMutableArray<WenYiShiPinModel *> *datalist;

- (NSString *)titleAtIndex:(NSInteger)index;

- (NSURL *)imageURLAtIndex:(NSInteger)index;

- (NSURL *)videoURLAtIndex:(NSInteger)index;











- (void)getNetRequestWithVideoType:(VideoType)type RequestMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;







@end
