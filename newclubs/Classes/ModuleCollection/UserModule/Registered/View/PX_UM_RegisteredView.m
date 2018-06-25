
//
//  PX_UM_RegisteredView.m
//  newclubs
//
//  Created by sundebiao on 2018/5/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_RegisteredView.h"


@implementation PX_UM_RegisteredView
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
    //账号
    [self addSubview:self.accountTf];
    //用户密码
    [self addSubview:self.passWordTf];
    //密码明文暗文
    [self addSubview:self.passWordBrightDarkBt];
    //注册按钮
    [self addSubview:self.registeredBt];
    //用户协议
    [self addSubview:self.userAgreementLb];
    //复选框
    [self addSubview:self.myCheckBox];
    
  
    //账户
    [_accountTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(TFHEIGH*2);
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
    
    //注册按钮
    [_registeredBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passWordTf.mas_bottom).offset(SCREENH_HEIGHT*0.04);
        make.height.mas_equalTo(TFHEIGH);
        make.width.mas_equalTo(CONTENTWIDTH);
        make.centerX.mas_equalTo(self);
    }];
    
    //用户协议
    [_userAgreementLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registeredBt.mas_bottom).offset(SCREENH_HEIGHT*0.04);
        make.centerX.mas_equalTo(self).offset(MarginSize);
    }];
    
    //复选框
    [_myCheckBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.registeredBt.mas_bottom).offset(SCREENH_HEIGHT*0.04);
        make.centerX.mas_equalTo(self.userAgreementLb.mas_left).offset(-MarginSize);
        make.centerY.mas_equalTo(self.userAgreementLb);
        make.size.mas_equalTo(CGSizeMake(MarginSize,MarginSize));
    }];
}

#pragma mark - lazy
- (UITextField *)accountTf
{
    if (!_accountTf) {
        _accountTf = [PX_TC_CG_UIKitTool textFileHolder:@"请输入昵称/邮箱" style:UITextBorderStyleNone];
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
        [_passWordTf setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:TextSize]];
        [_passWordTf setTextColor:PXMAJORCOLOR];
        self.passWordTf.secureTextEntry = !self.passWordTf.secureTextEntry;
    }
    return _passWordTf;
}


//注册按钮
- (UIButton *)registeredBt
{
    if (!_registeredBt) {
        _registeredBt = [PX_TC_CG_UIKitTool buttonTitle:@"注册" font:TextSize action:@selector(RegisteredBtnClick:) titleColor:[UIColor whiteColor] target:self];
        
        [_registeredBt.layer setBorderWidth:1.5];   //边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 217/255.0, 217/255.0, 217/255.0, 1 });
        [_registeredBt.layer setBorderColor:colorref];//边框颜色
        
    
        _registeredBt.backgroundColor = PXMAJORCOLOR;
    }
    return _registeredBt;
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


//标题
- (UILabel *)userAgreementLb{
    if (!_userAgreementLb) {
        
        NSString * htmlString = @"<html><body><font size=\"4\" color=\"df6060\">注册即代表你同意《社区用户协议》</font></body></html>";
        NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
       
        _userAgreementLb = [PX_TC_CG_UIKitTool lableFont:ContentTextSize textColor:nil text:nil];
        _userAgreementLb.attributedText = attrStr;
    }
    return _userAgreementLb;
}

- (BEMCheckBox *)myCheckBox{
    if (!_myCheckBox) {
        _myCheckBox = [[BEMCheckBox alloc]init];
        _myCheckBox.boxType = BEMBoxTypeSquare;
        _myCheckBox.onCheckColor = PXMAJORCOLOR;
        _myCheckBox.onTintColor = PXMAJORCOLOR;
        _myCheckBox.onAnimationType = BEMAnimationTypeFlat;
        _myCheckBox.on = YES;
        
    }
    return _myCheckBox;
}

#pragma mark - event
//注册
- (void)RegisteredBtnClick:(UIButton *)sender{
    self.block(sender,self.accountTf.text, self.passWordTf.text);
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
