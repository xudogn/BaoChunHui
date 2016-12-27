//
//  userModel.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

typedef NS_ENUM(NSUInteger, check_state) {
    check_state0,
    check_stateSucess,
    check_stateFail,
    check_stateChecking,
    check_stateNot,
};



#import <Foundation/Foundation.h>


@class  goodsModel, addressModel;
@interface userModel : NSObject


@property(nonatomic, strong) NSString *user_id;

@property(nonatomic, strong) NSString *name;    // 姓名
@property(nonatomic) NSInteger id_card;           // 身份证号码
@property(nonatomic) BOOL gender;               // 1 male, 0 female
@property(nonatomic) BOOL isCertified;          // 是否实名
@property(nonatomic, strong) NSMutableArray *families;// 家属 们
@property(nonatomic) NSInteger telephont_num;




@property(nonatomic, strong) NSString *detail_street;

@property(nonatomic, strong) NSMutableArray<addressModel *> *address_arr;

@property(nonatomic, strong) NSString *domiciled;


@property(nonatomic, strong) NSString *street; // 街道
@property(nonatomic, strong) NSString *emergency_contact; // 亲属急救手机号
@property(nonatomic, strong) NSString *teleNum_CareStation; // 站点电话
@property(nonatomic, strong) NSString *teleNUm_System; // 系统电话

@property(nonatomic) check_state check_state;  // 审核状态  1 成功     2  未通过     3 未提交      4  待审核

@property(nonatomic, strong) NSString *recommend_man;   //  推荐人















/*             各种购物车     1. 点餐  2. 商城   3. 便利店   4. 足道推拿订单                                */

@property(nonatomic, strong) NSMutableArray<goodsModel *> *gouWuChe_dianCan_arr;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *gouWuChe_shangCheng_arr;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *gouWuChe_bianLiDian_arr;

@property(nonatomic, strong) NSMutableArray<goodsModel *> *gouWuChe_zuDao_arr;




+ (instancetype)defaultsUserModel;




@end

@interface addressModel : NSObject


@property(nonatomic, strong) NSString *name;

@property(nonatomic) NSInteger teleNum;

@property(nonatomic, strong) NSString *address;

@property(nonatomic, assign) BOOL isDefault;

@end

































