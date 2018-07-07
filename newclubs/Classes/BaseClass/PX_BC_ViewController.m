//
//  PX_BC_ViewController.m
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_ViewController.h"
#import "PX_BC_NavigationViewController.h"
#import "PX_UM_LoginViewController.h"
#import "PX_MC_BM_RecommendViewController.h"
#import "PX_MC_BM_CircleViewController.h"
#import "PX_MC_BM_MyViewController.h"


@interface PX_BC_ViewController ()
@property (nonatomic,strong) UIImageView *navBarHairlineImageView;

@end

@implementation PX_BC_ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    if (whetherHaveNetwork) {
        //[self.view makeToast:@"没有网络"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionConfirm];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    //nav黑线
    if (_navBarHairlineImageView == nil) {
        _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    }
    _navBarHairlineImageView.hidden = NO;
    
   
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = HexColorA(0xffffff, 0.5);

    if ([self isKindOfClass:[PX_MC_BM_RecommendViewController class]] || [self isKindOfClass:[PX_MC_BM_MyViewController class]]) {
        self.navigationController.navigationBar.translucent = YES;
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [PX_TC_CG_UIKitTool setStatusBarBackgroundColor:PXWHITECOLOR];
    }else{
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        [PX_TC_CG_UIKitTool setStatusBarBackgroundColor:PXCLEARCOLOR];
      
    }
    
    if ([self isKindOfClass:[PX_MC_BM_CircleViewController class]]) {
        if (!isLogin) {
            [self isLogin];
        }
        UIColor *color = PXWHITECOLOR;
     
        UIImage *image = [self imageWithColor:[color colorWithAlphaComponent:0]];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:image];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
         [PX_TC_CG_UIKitTool setStatusBarBackgroundColor:PXCLEARCOLOR];
        
    }else{
        
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
     
    }
    
    if ([self isKindOfClass:[PX_MC_BM_MyViewController class]]) {
        if (!isLogin) {
            [self isLogin];
        }
    }
    
}

//通过一个方法来找到这个黑线(findHairlineImageViewUnder):
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = PXBACKGROUNDCOLOR;
 
    [self initUI];
}

- (void)initUI{
    
};

-(UIViewController *)isLogin{
    PX_UM_LoginViewController *LoginVc = [[PX_UM_LoginViewController alloc]init];
    PX_BC_NavigationViewController *NavLoginVc = [[PX_BC_NavigationViewController alloc]initWithRootViewController:LoginVc];
    [self presentViewController:NavLoginVc animated:NO completion:nil];
    
    return self;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}


@end
