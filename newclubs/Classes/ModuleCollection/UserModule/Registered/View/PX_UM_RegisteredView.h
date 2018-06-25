//
//  PX_UM_RegisteredView.h
//  newclubs
//
//  Created by sundebiao on 2018/5/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMCheckBox.h"

typedef void(^BackClickBlock)(UIButton *btn);
typedef void(^ClickBlock)(UIButton *btn,NSString *phone,NSString *password);

@interface PX_UM_RegisteredView : UIView

@property (nonatomic, copy) BackClickBlock Backblock;
@property (nonatomic, copy) ClickBlock block;


@property (nonatomic, strong) UILabel *userAgreementLb;
//密码明文密文
@property (nonatomic, strong) UIButton *passWordBrightDarkBt;
//账号
@property (nonatomic, strong) UITextField *accountTf;
//密码
@property (nonatomic, strong) UITextField *passWordTf;
//注册按钮
@property (nonatomic, strong) UIButton *registeredBt;
//复选框
@property (nonatomic, strong) BEMCheckBox *myCheckBox;


@end
