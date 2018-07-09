//
//  PX_BC_NavigationViewController.m
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_NavigationViewController.h"

#import "UIBarButtonItem+PXBarButtonItem.h"

@interface PX_BC_NavigationViewController ()

@end

@implementation PX_BC_NavigationViewController

// 保证只对nacvar进行一次设置
+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
//    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
   
    // 设置字号
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName:PXBLACKCOLOR,
                                     NSFontAttributeName:[UIFont systemFontOfSize:18.f]
                                     }];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        PX_TC_CG_LeftPicRightTextButton *button = [PX_TC_CG_LeftPicRightTextButton buttonWithType:UIButtonTypeCustom];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(-5, 3, 15, 25)];
        [imageView setImage:[UIImage imageNamed:@"return"]];
        button.frame = CGRectMake(0, 0, 70, 25);
        [button addSubview:imageView];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:PXMAJORCOLOR forState:UIControlStateNormal];
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];

    }
    
    [super pushViewController:viewController animated:animated];

    
    if (whetherHaveNetwork) {
        //[self.view makeToast:@"没有网络"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionConfirm];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

- (void)pop
{
    [self popViewControllerAnimated:YES];
}

@end
