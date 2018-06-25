//
//  PX_UM_LoginView.m
//  newclubs
//
//  Created by sundebiao on 2018/5/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_LoginView.h"

@interface PX_UM_LoginView()

@end

@implementation PX_UM_LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self addSubviews];
    }
    return self;
}

#pragma mark - methoed
- (void)addSubviews
{
    
    self.backgroundColor = [UIColor whiteColor];
   
    
    [self addSubview:self.backBt];
    //用户logo
    [self addSubview:self.toplogoImgView];
    //账号
    [self addSubview:self.accountTf];
    //用户密码
    [self addSubview:self.passWordTf];
    //密码明文暗文
    [self addSubview:self.passWordBrightDarkBt];
    //登录按钮
    [self addSubview:self.loginBt];
    //注册按钮
    [self addSubview:self.registeredBt];
    //忘记密码
    [self addSubview:self.forgotPasswordBt];
    
    //返回按钮
    [_backBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(State_Height);
        make.left.mas_equalTo(self.mas_left).offset(MarginSize);
    }];
    
    //Logo
    [_toplogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(NavBar_State_Height);
        make.centerX.mas_equalTo(self);
    }];
    
    //账户
    [_accountTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.toplogoImgView.mas_bottom).offset(MarginSize);
        make.height.mas_equalTo(TFHEIGH);
        make.width.mas_equalTo(CONTENTWIDTH);
        make.centerX.mas_equalTo(self);
    }];
    
    //密码
    [_passWordTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountTf.mas_bottom).offset(MarginSize);
        make.height.mas_equalTo(TFHEIGH);
        make.width.mas_equalTo(CONTENTWIDTH);
        make.centerX.mas_equalTo(self);
    }];
    //密码明文暗文
    [_passWordBrightDarkBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.passWordTf.mas_right).offset(-MarginSize);
        make.centerY.mas_equalTo(self.passWordTf.mas_centerY);
    }];
    
    
    //登录按钮
    [_loginBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTf.mas_bottom).offset(SCREENH_HEIGHT*0.04);
        make.height.mas_equalTo(TFHEIGH);
        make.width.mas_equalTo(CONTENTWIDTH);
        make.centerX.mas_equalTo(self);
    }];
    
    //注册按钮
    [_registeredBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBt.mas_bottom);
        make.height.mas_equalTo(TFHEIGH);
        make.left.mas_equalTo(MarginSize);
    }];
    
    //忘记密码
    [_forgotPasswordBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBt.mas_bottom);
        make.height.mas_equalTo(TFHEIGH);
        make.right.lessThanOrEqualTo(self.loginBt.mas_right);
    }];
    
    
    
}

#pragma mark - lazy
- (UIImageView *)toplogoImgView{
    if (!_toplogoImgView){
        _toplogoImgView = [[UIImageView alloc]init];
        [_toplogoImgView setImage:[UIImage imageNamed:@"logo"]];
    }
    return _toplogoImgView;
}

- (UITextField *)accountTf
{
    if (!_accountTf) {
        _accountTf = [PX_TC_CG_UIKitTool textFileHolder:@"请输入昵称/手机号/邮箱" style:UITextBorderStyleNone];
        _accountTf.keyboardType = UIKeyboardTypeDefault;
        [_accountTf setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:TextSize]];
        [_accountTf setTextColor:PXMAJORCOLOR];
    }
    return _accountTf;
}

- (UITextField *)passWordTf
{
    if (!_passWordTf) {
        _passWordTf = [PX_TC_CG_UIKitTool textFileHolder:@"请输入登录密码" style:UITextBorderStyleNone];
        self.passWordTf.secureTextEntry = !self.passWordTf.secureTextEntry;
        [_passWordTf setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:TextSize]];
        [_passWordTf setTextColor:PXMAJORCOLOR];
    }
    return _passWordTf;
}

//密码明文暗文
- (UIButton *)passWordBrightDarkBt
{
    if (!_passWordBrightDarkBt) {
        _passWordBrightDarkBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_passWordBrightDarkBt setImage:[UIImage imageNamed:@"ic_button_password_noshow"] forState:UIControlStateNormal];
        [_passWordBrightDarkBt setImage:[UIImage imageNamed:@"ic_button_password_noshow"] forState:UIControlStateNormal | UIControlStateHighlighted];
        [_passWordBrightDarkBt setImage:[UIImage imageNamed:@"ic_button_password_show"] forState:UIControlStateSelected];
        [_passWordBrightDarkBt setImage:[UIImage imageNamed:@"ic_button_password_show"] forState:UIControlStateSelected | UIControlStateHighlighted];
        _passWordBrightDarkBt.titleLabel.font = [UIFont systemFontOfSize: 12.0];
        [_passWordBrightDarkBt addTarget:self action:@selector(passWordBrightDarkBtClick:)  forControlEvents:UIControlEventTouchUpInside];
    }
    return _passWordBrightDarkBt;
}
//登录按钮
- (UIButton *)loginBt
{
    if (!_loginBt) {
        _loginBt = [PX_TC_CG_UIKitTool buttonTitle:@"立即登录" font:TextSize action:@selector(LoginBtnClick:) titleColor:[UIColor whiteColor] target:self];
        _loginBt.backgroundColor = PXMAJORCOLOR;
       
        [_loginBt.layer setBorderWidth:1.5];   //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 217/255.0, 217/255.0, 217/255.0, 1 });
        [_loginBt.layer setBorderColor:colorref];//边框颜色

//        _loginBt.layer.shadowOffset = CGSizeMake(1.5, 1.5);
//        _loginBt.layer.shadowOpacity = 0.8;
//        _loginBt.layer.shadowColor = [UIColor blackColor].CGColor;
        
    }
    
    return _loginBt;
}
//注册按钮
- (UIButton *)registeredBt
{
    if (!_registeredBt) {
        _registeredBt = [PX_TC_CG_UIKitTool buttonTitle:@"新用户注册" font:ContentTextSize action:@selector(RegisteredBtnClick:) titleColor:PXMAJORCOLOR target:self];
        
    }
    return _registeredBt;
}

- (UIButton *)forgotPasswordBt
{
    if (!_forgotPasswordBt) {
        _forgotPasswordBt = [PX_TC_CG_UIKitTool buttonTitle:@"无法登录?" font:ContentTextSize action:@selector(forgotPasswordBtClick) titleColor:PXMAJORCOLOR target:self];
    }
    return _forgotPasswordBt;
}

- (UIButton *)backBt
{
    if (!_backBt) {
        _backBt = [PX_TC_CG_UIKitTool buttonTitle:@"取消" font:TextSize action:@selector(backBtClick:) titleColor:PXMAJORCOLOR
                                           target:self];
    }
    return _backBt;
}



#pragma mark - event
//登录
- (void)LoginBtnClick:(UIButton *)sender{
    self.block(sender, _accountTf.text, _passWordTf.text);
}

//注册
- (void)RegisteredBtnClick:(UIButton *)sender{
    self.Registrationblock(sender);
}

//忘记密码
- (void)forgotPasswordBtClick{
    
}
//返回
- (void)backBtClick:(UIButton *)sender{
    self.Backblock(sender);
}
//密码明文暗文
- (void)passWordBrightDarkBtClick:(UIButton *)sender{
    if (sender.selected == YES) {
        sender.selected = NO;
        self.passWordTf.secureTextEntry = YES;
        NSString *text = _passWordTf.text;
        _passWordTf.text = @" ";
        _passWordTf.text = text;
    }else{
        sender.selected = YES;
        self.passWordTf.secureTextEntry = NO;
        NSString *text = _passWordTf.text;
        _passWordTf.text = @" ";
        _passWordTf.text = text;
    }
    
}
@end
