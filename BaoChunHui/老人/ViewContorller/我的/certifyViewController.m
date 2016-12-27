//
//  certifyViewController.m
//  BaoChunHui
//
//  Created by xudogn on 16/11/23.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "certifyViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "proviceModel.h"

typedef NS_ENUM(NSUInteger, AreaChosed) {
    AreaProvice,
    AreaCity,
    AreaCounty,
    AreaTown,
};




@interface certifyViewController ()<UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *nameL;

@property (weak, nonatomic) IBOutlet UITextField *idL;

@property (weak, nonatomic) IBOutlet UILabel *genderL;

@property (weak, nonatomic) IBOutlet UIButton *genderSwitchBtn;


@property (weak, nonatomic) IBOutlet UITextField *addressL;

@property (weak, nonatomic) IBOutlet UITextField *recommend_manL;

@property (weak, nonatomic) IBOutlet UIButton *picktureA;
@property (weak, nonatomic) IBOutlet UIButton *pictureB;

@property (weak, nonatomic) IBOutlet UIButton *provice;

@property (weak, nonatomic) IBOutlet UIButton *cityMsg;

@property (weak, nonatomic) IBOutlet UIButton *countyMsg;

@property (weak, nonatomic) IBOutlet UIButton *townMsg;


@property (weak, nonatomic) IBOutlet UITextField *street;// 户口街道所在地

@property (weak, nonatomic) IBOutlet UITextField *emergency_contact;


@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@property(nonatomic) NSInteger tag;



@property(nonatomic, strong) NSMutableArray<proviceModel *> *proviceArr;
@property(nonatomic, strong) NSMutableArray<cityModel *> *cityArr;
@property(nonatomic, strong) NSMutableArray<countyModel *> *countyArr;
@property(nonatomic, strong) NSMutableArray<townModel *> *townArr;

@property(nonatomic, strong) UIView *pickerMaskView;

@property(nonatomic, strong) UIPickerView *pickerV;
@property(nonatomic) AreaChosed currentArea;

@property(nonatomic, strong) proviceModel *proviceModel;
@property(nonatomic, strong) cityModel *cityModel;
@property(nonatomic, strong) countyModel *countyModel;
@property(nonatomic, strong) townModel *townModel;








@end

@implementation certifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ((UIScrollView *)self.view).contentSize = CGSizeMake(kMainScreenWidth, 755);
    // 待处理 逻辑
    // 判断审核状态用以选择 显示页面    用userModel中的check_state判断   待审核时发送请求验证是否通过
    // 可更改现住址和 手机号码
    // 以及更改验证（手机号）      向原手机号发送验证短信。。。。。。。。或。。。。。。。。。
    // 快速点击  性别按钮，  bug...
    
    // 从服务器更新个人信息   给userModel赋值
    
    
    
    
    
    
    // 判断 审核状态
    switch ([userModel defaultsUserModel].check_state) {
        case check_state0:// 无效
            
            break;
        case check_stateNot:// 未提交
            
            break;
        case check_stateFail:
            
            break;
        case check_stateSucess:
            [self configCheckStateSucess];
            break;
        case check_stateChecking:
            [self configCheckStateSucess];
            break;
        default:
            break;
    }
    
    
    
    //
    [self configAddressButton];// 初始化四级联动按钮
    [self configPickerView];   // 可考虑多线程加载
}

- (void)configCheckStateSucess{
    self.nameL.text = [userModel defaultsUserModel].name;
    self.nameL.enabled = NO;
    self.idL.text = @"**********";
    self.idL.enabled = NO;
    self.genderSwitchBtn.enabled = NO;
    self.addressL.text = [userModel defaultsUserModel].detail_street;
    self.addressL.enabled = NO;
    self.provice.enabled = NO;
    self.street.text = [userModel defaultsUserModel].street;
    self.street.enabled = NO;
    // 紧急联系人  待处理
    self.pictureB.enabled = NO;
    self.picktureA.enabled = NO;
    self.recommend_manL.text = [userModel defaultsUserModel].recommend_man;
    self.recommend_manL.enabled = NO;
    self.submitBtn.enabled = NO;
    
}
- (void)configChectStateChecking{
    // 同审核成功？？？
}



- (void)configPickerView{
    // height = 255;
    self.pickerMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, kMainScreenHeight-300, kMainScreenWidth, 255)];
    self.pickerV = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 45, kMainScreenWidth, 255)];
    [self.pickerMaskView addSubview:self.pickerV];
    [self.view addSubview:self.pickerMaskView];
    self.pickerMaskView.backgroundColor = [UIColor whiteColor];
    self.pickerV.delegate = self;
    self.pickerV.dataSource = self;
    // 添加右上角确定按钮
    UIButton *quedingBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.pickerMaskView addSubview:quedingBtn];
    [quedingBtn setTitle:@"确定" forState:UIControlStateNormal];
    [quedingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(80, 45));
        make.top.equalTo(0);
        make.right.equalTo(-10);
    }];
    [quedingBtn addTarget:self action:@selector(quedingBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    //添加左上角取消按钮
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.pickerMaskView addSubview:cancelBtn];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(80, 45));
        make.top.equalTo(0);
        make.left.equalTo(10);
    }];
    [cancelBtn addTarget:self action:@selector(cancelBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    self.currentArea = AreaProvice;         // 当前pickerView 选择省单位
    [self.pickerV reloadAllComponents];
    self.pickerMaskView.hidden = YES;
}

- (void)quedingBtnClicked{
    // pickerView 隐藏
    // 向相应的  传值
    // 下级 enabled = YES;
    // 请求下级 数据
    self.pickerMaskView.hidden = YES;
    switch (self.currentArea) {
        case AreaProvice:
        {
            // 判断数组是否为空，没网
            if (!self.proviceArr) {
                self.pickerMaskView.hidden = YES;
                // 弹出alert  提示网络异常
                break;
            }
            
            
            // 判断是否重新选择了同一个省 ？ return : 请求新的下一级;
            NSString *btnTitle = self.provice.titleLabel.text;// self.provice.currentTitle.....
            NSLog(@"%@", btnTitle);
            if ([self.proviceModel.provice_name isEqualToString:btnTitle]) {
                break;
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.provice setTitle:self.proviceModel.provice_name forState:UIControlStateNormal];
            });
            
            self.cityMsg.enabled = YES;
            [self.cityMsg setTitle:@"未选择" forState:UIControlStateNormal];
            self.countyMsg.enabled = NO;
            [self.countyMsg setTitle:@"未选择" forState:UIControlStateNormal];
            [self requestForNext];
            self.townMsg.enabled = NO;
            [self.townMsg setTitle:@"未选择" forState:UIControlStateNormal];
        }
            break;
        case AreaCity:{
            if (!self.cityArr) {
                self.pickerMaskView.hidden = YES;
            }
            
            
            // 判断 所选地区是否改变 ？ 请求 : return;
            NSString *btnTitle = self.cityMsg.titleLabel.text;// self.provice.currentTitle.....
            NSLog(@"%@", btnTitle);
            if ([self.cityModel.city_name isEqualToString:btnTitle]) {
                break;
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.cityMsg setTitle:self.cityModel.city_name forState:UIControlStateNormal];
            });
            
            
            self.countyMsg.enabled = NO;
            [self.countyMsg setTitle:@"未选择" forState:UIControlStateNormal];
            [self requestForNext];
            self.townMsg.enabled = NO;
            [self.townMsg setTitle:@"未选择" forState:UIControlStateNormal];
            
            self.countyMsg.enabled = YES;
            [self requestForNext];
        }
            break;
        case AreaCounty:
        {
            
            if (!self.countyArr) {
                self.pickerMaskView.hidden = YES;
            }
            
            // 判断 所选地区是否改变 ？ 请求 : return;
            NSString *btnTitle = self.countyMsg.titleLabel.text;// self.provice.currentTitle.....
            NSLog(@"%@", btnTitle);
            if ([self.countyModel.county_name isEqualToString:btnTitle]) {
                break;
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.countyMsg setTitle:self.countyModel.county_name forState:UIControlStateNormal];
            });
            
            
            self.townMsg.enabled = NO;
            [self.townMsg setTitle:@"未选择" forState:UIControlStateNormal];
            
            self.townMsg.enabled = YES;
            [self requestForNext];
        }
            break;
        case AreaTown:{
            
            if (!self.townArr) {
                self.pickerMaskView.hidden = YES;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.countyMsg setTitle:self.countyModel.county_name forState:UIControlStateNormal];
            });
            [self.townMsg setTitle:self.townModel.town_name forState:UIControlStateNormal];
            [self requestForNext];}
            break;
            
        default:
            break;
    }
}



// 请求下级数据
- (void)requestForNext{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        switch (self.currentArea) {
            case AreaProvice:{
                
                
                self.countyMsg.enabled = NO;
                self.townMsg.enabled = NO;      //
                [self.countyMsg setTitle:@"未选择" forState:UIControlStateDisabled];
                [self.townMsg setTitle:@"未选择" forState:UIControlStateDisabled];
                
                
                
                NSNumber *num = [NSNumber numberWithInteger:self.proviceModel.provice_id];
                NSDictionary *dic = @{@"provice_id":num, @"provice_name":self.proviceModel.provice_name};
                [manager GET:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/getCity" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    self.cityArr = [cityModel parse:responseObject];
                    [self.pickerV reloadAllComponents];// 刷新数据
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"Get cityArr fail!");
                }];
            }
                break;
            case AreaCity:{
                
                
                self.townMsg.enabled = NO;
                [self.townMsg setTitle:@"未选择" forState:UIControlStateDisabled];
                
                
                NSNumber *num = [NSNumber numberWithInteger:self.cityModel.city_id];
                NSDictionary *dic = @{@"city_id":num, @"city_name":self.cityModel.city_name};
                [manager GET:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/getCounty" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    self.countyArr = [countyModel parse:responseObject];
                    [self.pickerV reloadAllComponents];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"Get countyArr fail!");
                }];
            }
                
                break;
            case AreaCounty:{
                
                
                
                
                NSNumber *num = [NSNumber numberWithInteger:self.countyModel.county_id];
                NSDictionary *dic = @{@"county_id":num, @"county_name":self.countyModel.county_name};
                [manager GET:@"http://192.168.1.106/baochunhui/public/index.php/Index/index/getTown" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    self.townArr = [townModel parse:responseObject];
                    [self.pickerV reloadAllComponents];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"Get townArr fail!");
                }];
            }
                
                break;
            case AreaTown:
                
                break;
                
            default:
                break;
        }
    });
}



- (void)cancelBtnClicked{
    // 隐藏pickerV;
    self.pickerMaskView.hidden = YES;
    
}

//  pickerView 每行显示的title
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (self.currentArea) {
        case AreaProvice:
            return self.proviceArr[row].provice_name;
            break;
        case AreaCity:
            return self.cityArr[row].city_name;
            break;
        case AreaCounty:
            return self.countyArr[row].county_name;
            break;
        case AreaTown:
            return self.townArr[row].town_name;
            break;
            
        default:
            break;
    }
}


#pragma mark - pickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (self.currentArea) {
        case AreaProvice:
            return self.proviceArr.count;
            break;
        case AreaCity :
            return self.cityArr.count;
            break;
        case AreaCounty:
            return self.countyArr.count;
            break;
        case AreaTown:
            return self.townArr.count;
            break;
        default:
            break;
    }
}

#pragma mark - pickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    // 选中某行后调用
    // 根据 row 选择相应数组中的数据， 做相应逻辑
    switch (self.currentArea) {
        case AreaProvice:
            self.proviceModel = self.proviceArr[row];
            break;
        case AreaCity:
            self.cityModel = self.cityArr[row];
            break;
        case AreaCounty:
            self.countyModel = self.countyArr[row];
            break;
        case AreaTown:
            self.townModel = self.townArr[row];
            break;
            
        default:
            break;
    }
    
    
    
}



- (IBAction)switchGender:(UIButton *)sender {
    NSString *tmp = self.genderL.text;
    self.genderL.text = sender.titleLabel.text;
    [sender setTitle:tmp forState:UIControlStateNormal];
}


// 初始化四级联动按钮
- (void)configAddressButton{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         [manager GET:kChooseProvicePath parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             self.proviceArr = [proviceModel parse:responseObject];
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"省 获取失败！");
         }];
    });
   
    
    self.cityMsg.enabled = NO;
    [self.cityMsg setTitle:@"未选择" forState:UIControlStateDisabled];
    self.countyMsg.enabled = NO;
    [self.countyMsg setTitle:@"未选择" forState:UIControlStateDisabled];
    self.townMsg.enabled = NO;
    [self.townMsg setTitle:@"未选择" forState:UIControlStateDisabled];
}

- (IBAction)choseProvice:(UIButton *)sender {
    self.pickerMaskView.hidden = NO;
    self.currentArea = AreaProvice;
    [self.pickerV reloadAllComponents];
    
    // 下两行代码解决了点开pickerV 不做滑动，不选择直接点击确定时 不调用  didSelected...的代理方法，从而不能正确更新地区的问题
    NSInteger row = [self.pickerV selectedRowInComponent:0];
    self.proviceModel = self.proviceArr[row];
    //self.cityMsg.enabled = YES;
}

- (IBAction)choseCity:(UIButton *)sender {
    self.pickerMaskView.hidden = NO;
    self.currentArea = AreaCity;
    [self.pickerV reloadAllComponents];
    
    NSInteger row = [self.pickerV selectedRowInComponent:0];
    self.cityModel = self.cityArr[row];
    //self.countyMsg.enabled = YES;
}

- (IBAction)choseCounty:(UIButton *)sender {
    self.pickerMaskView.hidden = NO;
    self.currentArea = AreaCounty;
    [self.pickerV reloadAllComponents];
    
    NSInteger row = [self.pickerV selectedRowInComponent:0];
    self.countyModel = self.countyArr[row];
    //self.townMsg.enabled = YES;
}

- (IBAction)choseTown:(UIButton *)sender {
    self.pickerMaskView.hidden = NO;
    self.currentArea = AreaTown;
    [self.pickerV reloadAllComponents];
    NSInteger row = [self.pickerV selectedRowInComponent:0];
    self.townModel = self.townArr[row];
}




- (IBAction)pictureA:(UIControl *)sender {
    self.tag = sender.tag;
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
    sheet.tag = 100;
    [sheet showInView:self.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 100) {
        __block NSInteger sourceType = 0;
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){// 是否支持相机
            switch (buttonIndex) {
                case 0:
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 1:
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    return;
                    break;
            }
            
        }else {
            NSLog(@"不支持相机功能");
            if (buttonIndex == 0) {
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        
        UIImagePickerController *imgPickerC = [[UIImagePickerController alloc] init];
        imgPickerC.delegate = self;
        imgPickerC.allowsEditing = YES;
        imgPickerC.sourceType = sourceType;
        [self presentViewController:imgPickerC animated:YES completion:^{
            NSLog(@"open imgPickerController");
        }];
        
        
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIButton *picBtn = [self.view viewWithTag:self.tag];
    [picBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}








- (IBAction)submitBtn:(id)sender {
    // 将  男女转换成 0 ，1
    NSString * gend = @"男";
    if ([self.genderL.text isEqualToString:@"男"]) {
        gend = @"1";
    }else if ([self.genderL.text isEqualToString:@"女"]){
        gend = @"0";
    }
    
    NSNumber *proviceNum = [NSNumber numberWithInteger:self.proviceModel.provice_id];
    NSNumber *cityNum = [NSNumber numberWithInteger:self.cityModel.city_id];
    NSNumber *countyNum = [NSNumber numberWithInteger:self.countyModel.county_id];
    NSNumber *townNum = [NSNumber numberWithInteger:self.townModel.town_id];
    
    NSDictionary *dic = @{@"user_id":[userModel defaultsUserModel].user_id, @"detail_address":self.street.text, @"emergency_contact":self.emergency_contact.text, @"gender":gend, @"id_card":self.idL.text, @"name":self.nameL.text, @"recomment":self.recommend_manL.text, @"provice_id":proviceNum, @"city_id":cityNum, @"county_id":countyNum, @"town_id":townNum, @"domiciled":self.street.text};
    
    
    // 基于AFN3.0+ 封装的HTPPSession
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 20;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"multipart/form-data", @"application/json", @"text/html", @"image/jpeg", @"image/png", @"application/octet-stream", @"text/json", nil];
    // 在parameters里存放照片以外的对象
    [manager POST:@"http://192.168.1.106/baochunhui/public/index.php/Index/user/evpi" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // formData: 专门用于拼接需要上传的数据,在此位置生成一个要上传的数据体
        // 这里的_photoArr是你存放图片的数组
        UIImage *imgA = self.picktureA.currentBackgroundImage;
        UIImage *imgB = self.pictureB.currentBackgroundImage;
        NSArray *photosArr = @[imgA, imgB];
        for (int i = 0; i < 2; i++) {
            
            UIImage *image = photosArr[i];
            //NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
            NSData *imgData = UIImageJPEGRepresentation(image, 1);
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
            [formData appendPartWithFileData:imgData name:@"file" fileName:fileName mimeType:@"image/jpeg"]; //
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"---上传进度--- %@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"```上传成功``` %@",responseObject);
        
        // 审核状态改为 待审核   // 审核状态  1 成功     2  未通过     3 未提交      4  待审核
        [[userModel defaultsUserModel] setValue:@"4" forKey:@"check_state"];
#pragma mark  测试后下行代码打开
       // [self configCheckStateSucess];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"xxx上传失败xxx %@", error);
        
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    self.pickerMaskView.hidden = YES;
    
}

#pragma mark - 懒加载

- (proviceModel *)proviceModel{
    if (!_proviceModel) {
        _proviceModel = [[proviceModel alloc] init];
    }
    return _proviceModel;
}

- (cityModel *)cityModel{
    if (!_cityModel) {
        _cityModel = [[cityModel alloc] init];
    }
    return _cityModel;
}

- (countyModel *)countyModel{
    if (!_countyModel) {
        _countyModel = [[countyModel alloc] init];
    }
    return _countyModel;
}

-(townModel *)townModel{
    if (!_townModel) {
        _townModel = [[townModel alloc] init];
    }
    return _townModel;
}


- (NSMutableArray<cityModel *> *)cityArr{
    if (!_cityArr) {
        _cityArr = [[NSMutableArray<cityModel *> alloc] init];
    }
    return _cityArr;
}

- (NSMutableArray<countyModel *> *)countyArr{
    if (!_countyArr) {
        _countyArr = [[NSMutableArray<countyModel *> alloc] init];
    }
    return _countyArr;
}

- (NSMutableArray<townModel *> *)townArr{
    if (!_townArr) {
        _townArr = [[NSMutableArray<townModel *> alloc] init];
    }
    return _townArr;
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
