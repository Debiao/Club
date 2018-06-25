//
//  PX_UM_LoginView.h
//  newclubs
//
//  Created by sundebiao on 2018/5/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(UIButton *btn,NSString *phone,NSString *password);
typedef void(^RegistrationClickBlock)(UIButton *btn);
typedef void(^BackClickBlock)(UIButton *btn);

@interface PX_UM_LoginView : UIView

@property (nonatomic, copy) ClickBlock block;
@property (nonatomic, copy) RegistrationClickBlock Registrationblock;
@property (nonatomic, copy) BackClickBlock Backblock;

//返回按钮
@property (nonatomic, strong) UIButton *backBt;
//用户logo
@property (nonatomic, strong) UIImageView *toplogoImgView;
//账号
@property (nonatomic, strong) UITextField *accountTf;
//密码
@property (nonatomic, strong) UITextField *passWordTf;
//登录按钮
@property (nonatomic, strong) UIButton *loginBt;
//注册按钮
@property (nonatomic, strong) UIButton *registeredBt;
//找回密码
@property (nonatomic, strong) UIButton *forgotPasswordBt;
//密码明文密文
@property (nonatomic, strong) UIButton *passWordBrightDarkBt;
@end
