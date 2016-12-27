//
//  const.h
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#ifndef const_h
#define const_h

typedef NS_ENUM(NSUInteger, MainModulePart) {
    PartOfOldPeople,
    PartOfFamily,
    PartOfCareStation,
    PartOfService,
    PartOf5,
    PsrtOf6
};
typedef NS_ENUM(NSUInteger, ViewControllerType) {
    ViewControllerType_dianCai,
    ViewControllerType_shangCheng,
    ViewControllerType_bianLiDian,
    ViewControllerType_Zudao,
};




#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

#define kSetNaviBarItemTitleFontAndColor [self.navigationController.navigationBar setTitleTextAttributes:\
@{NSFontAttributeName:[UIFont systemFontOfSize:33],\
  NSForegroundColorAttributeName:[UIColor whiteColor]}];

/********   快速三原色定制颜色   *********/
#define kRGBA(r, g, b, a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])

#define kScreenW ([UIScreen mainScreen].bounds.size.width)
#define kScreenH ([UIScreen mainScreen].bounds.size.height)



//- (void)sendHelpMsg{\
    /*
     // 判断用户设备能否发送短信
//     if (![MFMessageComposeViewController canSendText]) {
//     return;
//     }
//     
//     // 1. 实例化一个控制器
//     MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
//     
//     // 2. 设置短信内容
//     // 1) 收件人
//     controller.recipients = @[@"10010", @"10086"];
//     
//     // 2) 短信内容
//     controller.body = @"给您拜个晚年，祝您晚年快乐！";
//     
//     // 3) 设置代理
//     controller.messageComposeDelegate = self;
//     
//     // 3. 显示短信控制器
//     [self presentViewController:controller animated:YES completion:nil];*/
//}\









#endif /* const_h */
