//
//  proviceModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/28.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface proviceModel : NSObject

@property(nonatomic, strong) NSString *provice_name;

@property(nonatomic) NSInteger provice_id;


@end

@interface cityModel : NSObject

@property(nonatomic, strong) NSString *city_name;

@property(nonatomic) NSInteger city_id;


@end

@interface countyModel : NSObject

@property(nonatomic, strong) NSString *county_name;

@property(nonatomic) NSInteger county_id;

@end

@interface townModel : NSObject

@property(nonatomic, strong) NSString *town_name;

@property(nonatomic) NSInteger town_id;

@end




