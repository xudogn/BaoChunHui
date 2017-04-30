//
//  LoginnViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "LoginnViewController.h"
#import "RegistViewController.h"
#import "OlePeopleTabBarViewController.h"
#import "FamilyTabBarViewController.h"
#import "ViewController.h"
#import "NurseTabBarViewController.h"
#import "ZHStationViewController.h"


#import "AppDelegate.h"
#import "FuWuJIGOUVC.h"
#import "VolunteerForOldViewController.h"

@interface LoginnViewController ()

@property (weak, nonatomic) IBOutlet UITextField *teltNumber;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation LoginnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    kSetNaviBarItemTitleFontAndColor
    
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
}


- (IBAction)enterTeleNumber:(UITextField *)sender {
    if ((sender.text.length == 11)&&(self.password.text.length>5)) {
        self.loginBtn.enabled = YES;
    }
}

- (IBAction)enterPassword:(UITextField *)sender {
    if ((self.teltNumber.text.length == 11)&&(self.password.text.length>5)) {
        self.loginBtn.enabled = YES;
    }
}




- (IBAction)clickLoginBtn:(UIButton *)sender {
    // 登录逻辑
    NSDictionary *parameter = @{@"phone":self.teltNumber.text, @"pwd":self.password.text.md5String};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/login" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"登录请求成功。");
        // 0 账号不存在
        // 1 登录成功
        // 2 密码错误
        // 登录成功跳转
    switch (_module) {
        case PartOfOldPeople:{
            //老人
            
            id homeNavi = [[UIStoryboard storyboardWithName:@"MineStoryboard" bundle:nil] instantiateInitialViewController];
            [self presentViewController:homeNavi animated:YES completion:nil];
            
            
        }
            break;
        case PartOfFamily:
            //家属
            break;
        case PartOfCareStation:
            //照护站
            break;
        case PartOfService:{
            //服务站
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
            layout.itemSize = CGSizeMake((kScreenW - 3)/2.0, 100);
            FuWuJIGOUVC *vc = [[FuWuJIGOUVC alloc] initWithCollectionViewLayout:layout];
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:navi animated:YES completion:nil];
        }
            break;
        case PartOf5:
            //
            break;
            
        default:
            //
            break;
    }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Register request fail.");
    }];
    
    
    
}

//游客登录
- (IBAction)visiterLogin:(id)sender {
    switch (_module) {
        case PartOfOldPeople:{
            //老人
            OlePeopleTabBarViewController *vc = [[OlePeopleTabBarViewController alloc] init];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
            
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:PartOfOldPeople] forKey:@"obviousModule"];
            
            
            
        }
            break;
        case PartOfFamily:
            //家属
        {
            FamilyTabBarViewController *vc = [[FamilyTabBarViewController alloc] init];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
            
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:PartOfFamily] forKey:@"obviousModule"];
        }
            break;
        case PartOfCareStation:
            //照护站
        {
            ZHStationViewController *vc = [[ZHStationViewController alloc] init];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
            
//            NSNumber *obviousModule = [NSNumber numberWithInteger:PartOfCareStation];
//            [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
        }
            break;
        case PartOfService:
            //个人，照护师端
        {
            NurseTabBarViewController *vc = [[NurseTabBarViewController alloc] init];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
            NSNumber *obviousModule = [NSNumber numberWithInteger:PartOfService];
            [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
        }
            break;
        case PartOf5:
            //服务机构端
        {
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            layout.sectionInset = UIEdgeInsetsMake(1, 1, 1, 1);
            layout.itemSize = CGSizeMake((kScreenW - 3)/2.0, 100);
            FuWuJIGOUVC *vc = [[FuWuJIGOUVC alloc] initWithCollectionViewLayout:layout];
            UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:navi animated:YES completion:nil];
        }
        {
            
        }
            break;
        case PsrtOf6:
            // 敬老志愿
        {
            VolunteerForOldViewController *vc = [[VolunteerForOldViewController alloc] init];
           // [self presentViewController:vc animated:YES completion:nil];
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            delegate.window.rootViewController = vc;
            NSNumber *obviousModule = [NSNumber numberWithInteger:PsrtOf6];
            [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
            
        }
            break;
        default:
            //
            break;
    }
}



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Module:(MainModulePart)module{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _module = module;
    }
    return self;
}



- (IBAction)cancelBtn:(id)sender {
    ViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainModule"];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = vc;
}

- (IBAction)registerBtn:(id)sender {
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil Module:self.module];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
