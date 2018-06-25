//
//  PX_TC_CG_UIKitTool.m
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_CG_UIKitTool.h"
#import "PX_TC_CG_LineTextField.h"

@implementation PX_TC_CG_UIKitTool
+ (UIButton *)buttonTitle:(NSString *)title font:(int)font action:(SEL)action titleColor:(UIColor *)titleColor target:(id)target
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    return btn;
}

+ (UIButton *)buttonImage:(NSString *)image title:(NSString *)title font:(int)font action:(SEL)action titleColor:(UIColor *)titleColor target:(id)target
{
    UIButton *btn = [self buttonTitle:title font:font action:action titleColor:titleColor target:target];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    return btn;
}
+ (UITableView *)tableCreat
{
    UITableView *table = [[UITableView alloc] init];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    return table;
}
+ (UILabel *)labelFont:(int)font
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    return label;
}
+ (UILabel *)lableFont:(int)font textColor:(UIColor *)textColor
{
    UILabel *label = [self labelFont:font];
    label.textColor = textColor;
    return  label;
}

+ (UILabel *)lableFont:(int)font textColor:(UIColor *)textColor text:(NSString *)text
{
    UILabel *label = [self lableFont:font textColor:textColor];
    label.text = text;
    return label;
}

+ (UITextField *)textFileHolder:(NSString *)holder style:(UITextBorderStyle)style
{
    PX_TC_CG_LineTextField *text = [[PX_TC_CG_LineTextField alloc] init];
    text.borderStyle = style;
    text.placeholder = holder;
    return text;
}

+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource
{
    UITableView *table = [[UITableView alloc] init];
    table.delegate = delegate;
    table.dataSource = dataSource;
    return table;
}
+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource nibCell:(NSString *)nibCell ider:(NSString *)ider
{
    UITableView *table = [self tableDelegate:delegate dataSource:dataSource];
    REGISNIBCELL(table, nibCell, ider)
    return table;
}
+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource classCell:(id)classCell ider:(NSString *)ider
{
    UITableView *table = [self tableDelegate:delegate dataSource:dataSource];
    REGISCLASSCELL(table, classCell, ider)
    return table;
}
+ (UIImageView *)imageView:(NSString *)image
{
    UIImageView *ima = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    return ima;
}



//用户输入
+ (BOOL)px_checkUserInput:(NSString *)input{
    if ([input length] == 0)
    {
        return NO;
    }
    
    int length = (int)[input stringByReplacingOccurrencesOfString:@" " withString:@""].length;
    
    if (length==0)
    {
        return NO;
    }
    
    return YES;
}
//邮箱
+ (BOOL)px_checkEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//用户名
+ (BOOL)px_checkUserName:(NSString *)username{
    if ([username length] == 0)
    {
        return NO;
    }
    
    NSString *regex = @"^[a-zA-Z][a-zA-Z0-9_]{3,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:username];
    
    if (!isMatch)
    {
        return NO;
    }
    
    return YES;
}
//密码
+ (BOOL)px_checkPassWord:(NSString *)password{
    if ([password length] == 0)
    {
        return NO;
    }
    
    NSString *regex = @"^[a-zA-Z0-9_]{6,17}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:password];
    
    if (!isMatch)
    {
        return NO;
    }
    
    return YES;
}

+ (NSString *)px_state:(NSInteger)state{
    switch (state) {
        case -1:
            return @"登路状态已经失效";
            break;
        case -2:
            return @"内容不能为空";
            break;
            
        case -3:
            return @"处理失败";
            break;
        case -4:
            return @"登录/效验用户失败";
            break;
        case -5:
            return @"用户昵称不能为空";
            break;
        case -6:
            return @"验证码错误";
            break;
        case -7:
            return @"暂未开通的功能";
            break;
        case -8:
            return @"重复提交";
            break;
        case -9:
            return @"余额不足";
            break;
        case -10:
            return @"非法字符集";
            break;
        case 10:
            return @"非标准邮箱";
            break;
        case 11:
            return @"非标准密码";
            break;
        case 12:
            return @"非标准手机号";
            break;
        case 13:
            return @"⾮标准唯一昵称";
            break;
        case 14:
            return @"已经存在的邮箱";
            break;
        case 15:
            return @"已经存在的⼿手机号";
            break;
        case 16:
            return @"已经存在的昵称";
            break;
        case 17:
            return @"密码验证失败";
            break;
        case 18:
            return @"账户被封禁";
            break;
        case 19:
            return @"今日注册超过系统限制!";
            break;
            
           
        case 119:
            return @"家族已经存在";
            break;
        case 120:
            return @"家族不不存在";
            break;
        default:
            return @"成功";
            break;
    }
    
}

+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


 
@end
