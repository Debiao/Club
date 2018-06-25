//
//  PX_UM_LoginViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/5/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_LoginViewController.h"
#import "PX_UM_LoginView.h"
#import "PX_UM_RegisteredViewController.h"
#import "PX_UM_LoginModel.h"
#import "PX_UM_LoginHandle.h"
#import "PX_TC_TB_TabBarView.h"

@interface PX_UM_LoginViewController ()<UINavigationControllerDelegate,UITextFieldDelegate>

@property (nonatomic, strong)PX_UM_LoginView *loginView;
@property (nonatomic, strong)PX_UM_LoginModel *model;
@end

@implementation PX_UM_LoginViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self addSubviews];
    }
    return self;
}


#pragma mark - methoed
// 添加布局子控件
- (void)addSubviews
{
   
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.view);
    }];
    [self.view addSubview:self.loginView];
    [self.view layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      self.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自身控制器
    BOOL isShowMyController = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowMyController animated:YES];
}

#pragma mark - lazy
- (UIView *)loginView
{
    @weakify(self);
    if (!_loginView) {
        _loginView = [[PX_UM_LoginView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
       
        _loginView.accountTf.delegate = self;
        _loginView.passWordTf.delegate = self;
    
        _loginView.Registrationblock = ^(UIButton *btn) {
            PX_UM_RegisteredViewController *registeredVc = [[PX_UM_RegisteredViewController alloc]init];
   
            [weak_self.navigationController pushViewController:registeredVc animated:YES];
        };
        _loginView.Backblock = ^(UIButton *btn) {
            if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[PX_BC_TabBarViewController class]]) {
                PX_BC_TabBarViewController *tabbar = (PX_BC_TabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
                [tabbar.pxtabbar itemClick:tabbar.pxtabbar.firstButton];
                tabbar.selectedIndex= 0;
            }
            [weak_self.navigationController dismissViewControllerAnimated:NO completion:nil];
            
          
        };
        
        _loginView.block = ^(UIButton *btn, NSString *phone, NSString *password) {
            [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
            if (whetherHaveNetwork) {
                  [weak_self.view makeToast:@"没有网络"];
            }else{
                if ([PX_TC_CG_UIKitTool px_checkUserInput:phone] == NO || [PX_TC_CG_UIKitTool px_checkUserInput:password] == NO) {
                    [weak_self.view makeToast:@"昵称/密码不能为空"];
                }else{
                    [weak_self.view hideAllToasts];
                    [weak_self.view makeToastActivity:CSToastPositionCenter];
                    
                    [PX_UM_LoginHandle performaLoginType:1 UserName:phone Password:password success:^(id obj) {
                        weak_self.model = obj;
                        if (weak_self.model.state == 1) {
                            [PX_UserDefaults removeObjectForKey:@"token"];
                            [PX_UserDefaults synchronize];
                            [weak_self performSelector:@selector(delayMethod) withObject:nil afterDelay:2.0];
                        }else{
                            [weak_self performSelector:@selector(delayStateExceptionMethod) withObject:nil afterDelay:1.0];
                        }
                    } failure:^(id obj) {
                        [weak_self performSelector:@selector(delayFailMethod) withObject:nil afterDelay:1.0];
                    }];
                    
                }
            }
        };

    }
    return _loginView;
}



- (void)delayMethod{
    [PX_UserDefaults setObject:self.model.token forKey:@"token"];
    [PX_UserDefaults synchronize];
    [self.view hideToastActivity];
    [self.view makeToast:@"登录成功"];
    isLogin = YES;
    [self performSelector:@selector(delayMethodDisMiss) withObject:nil afterDelay:1.0];
    
}
- (void)delayMethodDisMiss{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)delayStateExceptionMethod{
    [self.view hideToastActivity];
    [self.view makeToast:[PX_TC_CG_UIKitTool px_state:self.model.state]];
}

- (void)delayFailMethod{
    [self.view hideToastActivity];
    [self.view makeToast:@"登录失败请重新登录"];
}
//#pragma mark --Md5加密
//- (NSString *) md5:(NSString *) input {
//    const char *cStr = [input UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call
//    
//    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    
//    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
//        [output appendFormat:@"%02x", digest[i]];
//    
//    return  output;
//}


#pragma mark - textfielddelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _loginView.accountTf) {
      [_loginView.passWordTf becomeFirstResponder];
     }else if(textField == _loginView.passWordTf){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = 0.0;
            self.view.frame = frame;
        }];
        return [textField resignFirstResponder];
    }
    return [textField resignFirstResponder];
}

//#pragma mark - 设置弹出提示语
//- (void)setupAlertController {
//
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请先安装微信客户端" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [alert addAction:actionConfirm];
//    [self presentViewController:alert animated:YES completion:nil];
//}
@end
