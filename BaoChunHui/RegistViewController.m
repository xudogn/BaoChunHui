//
//  RegistViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/21.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "RegistViewController.h"
#import "OlePeopleTabBarViewController.h"
#import "FamilyTabBarViewController.h"

#import "AppDelegate.h"
#import "FuWuJIGOUVC.h"

@interface RegistViewController ()

@property (weak, nonatomic) IBOutlet UITextField *teleNumber;


@property (weak, nonatomic) IBOutlet UITextField *YanZhengMa;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *comfirmPsd;

@property (weak, nonatomic) IBOutlet UIButton *YZMBtn;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    kSetNaviBarItemTitleFontAndColor
    
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.masksToBounds = YES;
}



- (IBAction)getYanZhengMa:(UIButton *)sender {
    // 获取验证码
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    NSDictionary *parameter = @{@"phone":self.teleNumber.text};
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/securityCode" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Send code sucess.");
        NSString *flag = [NSString stringWithFormat:@"%@", responseObject[@"flag"]];
        
        if (flag.intValue == 0) {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"您的手机号已注册!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *act = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertC dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertC addAction:act];
            [self.navigationController presentViewController:alertC animated:YES completion:nil];
        }else {
            __block NSInteger time = 59;
            sender.enabled = NO;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
                [sender setTitle:[NSString stringWithFormat:@"%ld",(long)time] forState:UIControlStateNormal];
                if (time == 0) {
                    sender.enabled = YES;
                    [self.timer invalidate];
                    self.timer = nil;
                    [sender setTitle:@"验证" forState:UIControlStateNormal];
                }
                time -= 1;
            } repeats:YES];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Send code fail.");
    }];
}

- (IBAction)clickRegisterBtn:(UIButton *)sender {
    
    // 注册逻辑
    NSDictionary *parameter = @{@"phone":self.teleNumber.text,@"code":self.YanZhengMa.text,@"pwd":self.password.text.md5String};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/register" parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSString *flag =  [NSString stringWithFormat:@"%@", responseObject[@"flag"]];
        NSLog(@"flag = %@", flag);
        NSInteger f = [flag intValue];
        switch (f) {
            case 1:// 注册成功
            {
                //  进入相应的界面，同登录/切换 逻辑
                [[NSUserDefaults standardUserDefaults] setValue:dic[@"uid"] forKey:@"user_id"];
                [[NSUserDefaults standardUserDefaults] setValue:dic[@"token"] forKey:@"token"];
                NSString *str = [[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"];
                NSLog(@"%@", str);
                switch (self.module) {
                    case PartOfOldPeople:
#warning login
                        break;
                    case PartOfFamily:
                        
                        break;
                    case PartOfService:
                        
                        break;
                    case PartOfCareStation:
                        
                        break;
                    case PartOf5:
                        
                        break;
                    default:
                        break;
                }
            }
                break;
            case 2:// 验证码错误
            {
                
            }
                break;
            case 3:// 注册失败
            {
                
            }
                break;
            default:
                break;
        }
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Register request fail.");
    }];
    
    
    
}

- (IBAction)enterTeleNum:(UITextField *)sender {
    if (self.teleNumber.text.length == 11) {
        self.YZMBtn.enabled = YES;
    }
}

- (IBAction)enterPassword:(UITextField *)sender {
    if ((sender.text.length>5) && ([self.comfirmPsd.text isEqualToString:self.password.text]) && self.YanZhengMa.text!= nil && self.teleNumber.text.length == 11) {
        self.registerBtn.enabled = YES;
    }
}

- (IBAction)confirmPassword:(UITextField *)sender {
    if ((sender.text.length>5) && ([self.comfirmPsd.text isEqualToString:self.password.text]) && self.YanZhengMa.text!= nil && self.teleNumber.text.length == 11) {
        self.registerBtn.enabled = YES;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Module:(MainModulePart)module{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _module = module;
    }
    return self;
}


- (IBAction)guestLogin:(id)sender {
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
            NSNumber *obviousModule = [NSNumber numberWithInteger:PartOfCareStation];
            [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
        }
            break;
        case PartOfService:
            //服务站
        {
            
            NSNumber *obviousModule = [NSNumber numberWithInteger:PartOfService];
            [[NSUserDefaults standardUserDefaults] setObject:obviousModule forKey:@"obviousModule"];
        }
            break;
        case PartOf5:
            //
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
            
        default:
            //
            break;
    }
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
