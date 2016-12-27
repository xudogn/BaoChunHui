//
//  scoreShopViewModel.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/24.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "scoreShopViewModel.h"

@implementation scoreShopViewModel



// headerView
- (NSURL *)urlForBanner{
    return self.banner.banner_url.myURL;
}
- (NSString *)scoreForScoreLb{
    return [NSString stringWithFormat:@"积分:%ld", (long)self.banner.totalscore];
}





// goods Cell
- (NSString *)productNameAtindexpath:(NSInteger)indexpath{
    return self.datalist[indexpath].product_name;
}
- (NSString *)priceLbAtindexpath:(NSInteger)indexpath{
    return [NSString stringWithFormat:@"%ld积分", (long)self.datalist[indexpath].product_score];
}
- (NSString *)priceCashAtindexpath:(NSInteger)indexpath{
    return [NSString stringWithFormat:@"%ld元兑换", (long)self.datalist[indexpath].product_cash];
}
- (NSURL *)urlOfImgVAtindexpath:(NSInteger)indexpath{
    return [NSURL URLWithString:self.datalist[indexpath].product_name];
}






- (void)getPage:(NSInteger)page completionHandler:(void (^)(scoreShopModel *, NSError *))completionHandler{
    
}







@end
