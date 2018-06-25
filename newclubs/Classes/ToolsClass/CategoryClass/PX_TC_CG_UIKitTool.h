//
//  PX_TC_CG_UIKitTool.h
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PX_TC_CG_UIKitTool : NSObject
//*************************UI*****************************
// 按钮
+ (UIButton *)buttonTitle:(NSString *)title font:(int)font action:(SEL)action titleColor:(UIColor *)titleColor target:(id)target;

+ (UIButton *)buttonImage:(NSString *)image title:(NSString *)title font:(int)font action:(SEL)action titleColor:(UIColor *)titleColor target:(id)target;
// table
+ (UITableView *)tableCreat;

// label
+ (UILabel *)labelFont:(int)font;
+ (UILabel *)lableFont:(int)font textColor:(UIColor *)textColor;
+ (UILabel *)lableFont:(int)font textColor:(UIColor *)textColor text:(NSString *)text;

// textfield
+ (UITextField *)textFileHolder:(NSString *)holder style:(UITextBorderStyle)style;

// talbe
+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource;
+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource nibCell:(NSString *)nibCell ider:(NSString *)ider;
+ (UITableView *)tableDelegate:(id)delegate dataSource:(id)dataSource classCell:(id)classCell ider:(NSString *)ider;
// imagevie
+ (UIImageView *)imageView:(NSString *)image;

//***************************效验*************************
/**
 *  检测用户名格式
 *
 *  @param str 字符串
 *
 *  @return bool
 */
//用户输入
+ (BOOL)px_checkUserInput:(NSString *)input;
//邮箱
+ (BOOL)px_checkEmail:(NSString *)email;
//用户名
+ (BOOL)px_checkUserName:(NSString *)username;
//密码
+ (BOOL)px_checkPassWord:(NSString *)password;


//***************************state*************************

+ (NSString *)px_state:(NSInteger)state;

//设置状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor *)color;


@end
