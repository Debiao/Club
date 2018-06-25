//
//  PX_UM_RegisteredViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/5/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_RegisteredViewController.h"
#import "PX_UM_RegisteredView.h"
#import "PX_UM_RegisteredHandle.h"
#import "PX_UM_RegisteredModel.h"
#import "PX_UM_RegisteredWebViewController.h"

@interface PX_UM_RegisteredViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) PX_UM_RegisteredView *registeredView;
@property (nonatomic,strong) PX_UM_RegisteredModel *model;
@end

@implementation PX_UM_RegisteredViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"社区注册";
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:PXBLACKCOLOR,
                                                           NSFontAttributeName:[UIFont boldSystemFontOfSize:TextSize]
                                                           }];
    
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    // 设置字号
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:PXBLACKCOLOR,
                                                           NSFontAttributeName:[UIFont boldSystemFontOfSize:18.f]
                                                           }];
}

#pragma mark - methoed
// 添加布局子控件
- (void)addSubviews
{
    
    [_registeredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.view);
    }];
    [self.view addSubview:self.registeredView];
    [self.view layoutIfNeeded];
    
}

#pragma mark - lazy
- (UIView *)registeredView
{
    @weakify(self);
    if (!_registeredView) {
        _registeredView = [[PX_UM_RegisteredView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
        _registeredView.accountTf.delegate = self;
        _registeredView.passWordTf.delegate = self;
        
        _registeredView.block = ^(UIButton *btn, NSString *phone, NSString *password) {
            [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
            
            int px_type = 1;
            
            NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            [emailTest evaluateWithObject:phone];
            
            if (!emailTest) {
                px_type = 3;
            }
            
            if (whetherHaveNetwork) {
                [weak_self.view makeToast:@"没有网络"];
            }else{
            
            if (self->_registeredView.myCheckBox.on == YES) {
                if ([PX_TC_CG_UIKitTool px_checkUserInput:phone] == NO || [PX_TC_CG_UIKitTool px_checkUserInput:password] == NO) {
                    [weak_self.view makeToast:@"昵称/密码不能为空"];
                }else{
                    [weak_self.view makeToastActivity:CSToastPositionCenter];
                    [PX_UM_RegisteredHandle performaRegisteredType:px_type Code:@"王八蛋" UserName:phone Password:password success:^(id obj) {
                        weak_self.model = obj;
                        if (weak_self.model.state == 1) {
                            [PX_UserDefaults setObject:weak_self.model.token forKey:@"token"];
                            [PX_UserDefaults synchronize];
                            [weak_self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0];
                        }else{
                            [weak_self performSelector:@selector(delayStateExceptionMethod) withObject:nil afterDelay:1.0];
                        }
                        
                    } failure:^(id obj) {
                        [weak_self performSelector:@selector(delayFailMethod) withObject:nil afterDelay:1.0];
                    } ];
                }
                
                
            }else{
                [weak_self.view hideToastActivity];
                [weak_self.view makeToast:@"未同意社区用户协议"];
            }
            
        }
        };
        UITapGestureRecognizer *RegisteredTapWebAgreement=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(RegisteredTapWebAgreementPushClick)];
        _registeredView.userAgreementLb.userInteractionEnabled=YES;
        [_registeredView.userAgreementLb addGestureRecognizer:RegisteredTapWebAgreement];
        
    }
    return _registeredView;
}

- (void)delayMethod{
    [self.view hideToastActivity];
    [self.view makeToast:@"注册成功"];
    isLogin = YES;
    [self performSelector:@selector(delayMethodPush) withObject:nil afterDelay:1.0];
}
- (void)delayMethodPush{
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)delayFailMethod{
    [self.view hideToastActivity];
    [self.view makeToast:@"注册失败请重新注册"];
}

- (void)delayStateExceptionMethod{
    [self.view hideToastActivity];
    [self.view makeToast:[PX_TC_CG_UIKitTool px_state:self.model.state]];
}

- (void)RegisteredTapWebAgreementPushClick{
    
    PX_UM_RegisteredWebViewController *registeredWebVc = [[PX_UM_RegisteredWebViewController alloc]init];
    [self.navigationController pushViewController:registeredWebVc animated:NO];
    
}

#pragma mark - textfielddelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _registeredView.accountTf) {
        [_registeredView.passWordTf becomeFirstResponder];
    }else if(textField == _registeredView.passWordTf){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = 0.0;
            self.view.frame = frame;
        }];
        return [textField resignFirstResponder];
    }
    return [textField resignFirstResponder];
}


@end
