//
//  AppDelegate.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/15.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "AppDelegate.h"
#import "welcomeViewController.h"
#import "AdViewController.h"
#import "ViewController.h"
#import "OlePeopleTabBarViewController.h"
#import "NurseTabBarViewController.h"
#import "FamilyTabBarViewController.h"





#import <AVFoundation/AVFoundation.h>
//#import "EMSDK.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WXApi.h"
#import "WeiboSDK.h"





@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 广告， 欢迎页 显示逻辑
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    NSString *readVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"readVersion"];
    if (![version isEqualToString:readVersion]) {
        [self welcomeWindow];
    }
    if (![version isEqualToString:readVersion]) {// 去掉  ！  恢复正常逻辑
        [self adWindow];
    }
    
    
    //[self netTest];
    
    [[userModel defaultsUserModel] setValue:@"000" forKey:@"user_id"];
    
    for (int i = 0; i <6; i++) {
        goodsModel *model = [[goodsModel alloc] init];
        
        model.goods_price = 11;
        model.goods_name = @"name";
        model.goods_number = 3;
        [[userModel defaultsUserModel].gouWuChe_shangCheng_arr addObject:model];
    }
    
    
    
    [self window];
    
    //[self speechModelConfig];  // 通过此设置，防止因为手机设置而听不到声音、
   // [self configHuanXin];      // 环信
    [self shareSDKConfig];
    
    return YES;
}

- (void) shareSDKConfig{
    /**
     *  设置ShareSDK的appKey，如果尚未在ShareSDK官网注册过App，请移步到http://mob.com/login 登录后台进行应用注册
     *  在将生成的AppKey传入到此方法中。
     *  方法中的第二个第三个参数为需要连接社交平台SDK时触发，
     *  在此事件中写入连接代码。第四个参数则为配置本地社交平台时触发，根据返回的平台类型来配置平台信息。
     *  如果您使用的时服务端托管平台信息时，第二、四项参数可以传入nil，第三项参数则根据服务端托管平台来决定要连接的社交SDK。
     *  bchyanglao@gmail.com    bch123456
     */
    [ShareSDK registerApp:@"194a82959d569"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformTypeWechat),
                            @(SSDKPlatformTypeQQ),
                            
                            ]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformTypeQQ:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
            
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"568898243"
                                           appSecret:@"38a4f8204cc784f81f9f0daaf31e02e3"
                                         redirectUri:@"http://www.sharesdk.cn"
                                            authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx4868b35061f87885"
                                       appSecret:@"64020361b8ec4c99936c0e3999a9f249"];
                 break;
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"100371282"
                                      appKey:@"aed9b0303e3ed1e27bae87c33761161d"
                                    authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeRenren:
                 [appInfo        SSDKSetupRenRenByAppId:@"226427"
                                                 appKey:@"fc5b8aed373c4c27a05b712acba0f8c3"
                                              secretKey:@"f29df781abdd4f49beca5a2194676ca4"
                                               authType:SSDKAuthTypeBoth];
                 break;
             case SSDKPlatformTypeGooglePlus:
                 [appInfo SSDKSetupGooglePlusByClientID:@"232554794995.apps.googleusercontent.com"
                                           clientSecret:@"PEdFgtrMw97aCvf0joQj7EMk"
                                            redirectUri:@"http://localhost"];
                 break;
             default:
                 break;
         }
     }];
}



- (void)netTest{
    //  服务器测试代码
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSDictionary *dic = @{@"":@""};
    
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/index/User/uploading" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
    
    
    // 上传图片
    
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/index/User/uploading" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
        for (int i = 0; i < 2; i++) {
            
            UIImage *image = [UIImage imageNamed:@"IMG_0412"];
            NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            
            // 在网络开发中，上传文件时，是文件不允许被覆盖，文件重名
            // 要解决此问题，
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
            /*
             *该方法的参数
             1. appendPartWithFileData：要上传的照片[二进制流]
             2. name：对应网站上[upload.php中]处理文件的字段（比如upload）
             3. fileName：要保存在服务器上的文件名
             4. mimeType：上传的文件的类型
             */
            [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"image/jpeg"]; //
        }
        
        
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
}








- (void)speechModelConfig{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    NSError *error;
    if (![audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error]) {
            NSLog(@"set category error : %@", error);
        }
    if (![audioSession setActive:YES error:&error]) {
            NSLog(@"set active error: %@", error);
        }
    
    
}


-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        
//        NSNumber *obviousModule = [NSNumber numberWithInteger:PartOfOldPeople];
//        [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
        //判断默认 界面。   已经登录
        MainModulePart module = ((NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"obviousModule"]).integerValue;
        NSLog(@"");
        switch (module) {
            case PartOfOldPeople:{
                _window.rootViewController =[[OlePeopleTabBarViewController alloc] init];
            }
                break;
            case PartOfFamily:{
                _window.rootViewController =[[FamilyTabBarViewController alloc] init];
            }
                
                break;
            case PartOfService:{
                _window.rootViewController =[[NurseTabBarViewController alloc] init];
            }
                
                break;
            case PartOfCareStation:{
                //_window.rootViewController =[[OlePeopleTabBarViewController alloc] init];
            }
                
                break;
            case PartOf5:
                
                break;
            default:{
                
            
                ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainModule"];
                _window.rootViewController = vc;
        }
                break;
        }
        
        //  主界面， 调试用
//        ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
//        _window.rootViewController = vc;
    
        //_window.rootViewController =[[OlePeopleTabBarViewController alloc] init];
        
    }
    return _window;
}

- (UIWindow *)welcomeWindow{
    if (!_welcomeWindow) {
        _welcomeWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _welcomeWindow.hidden = NO;
        _welcomeWindow.rootViewController = [[welcomeViewController alloc] init];
        _welcomeWindow.windowLevel = 3;
    }
    return _welcomeWindow;
}

- (UIWindow *)adWindow{
    if (!_adWindow) {
        _adWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _adWindow.hidden = NO;
        _adWindow.windowLevel = 2;
        _adWindow.rootViewController = [[AdViewController alloc] init];
    }
    return _adWindow;
}













/*
- (void)configHuanXin{
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"1136161121115997#baochunhui"];
    options.apnsCertName = @"";  // APNS name
    [[EMClient sharedClient] initializeSDKWithOptions:options];
}

*/

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
   // [[EMClient sharedClient] applicationDidEnterBackground:application];
}
// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //[[EMClient sharedClient] applicationWillEnterForeground:application];
}





- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}





- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BaoChunHui"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
