//
//  PX_MC_BM_CreateCirclePermissionsViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/20.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CreateCirclePermissionsViewController.h"
#import "PX_MC_BM_CircleViewController.h"
#import "UILablePadding.h"
#import "HSChooseWhetherVC.h"

@interface PX_MC_BM_CreateCirclePermissionsViewController ()<HSChooseWhetherVCDelegate>
@property (nonatomic,strong)  UISwitch *swCircle;
@end

@implementation PX_MC_BM_CreateCirclePermissionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"配置权限";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(0,0, 50, 30);
    btn.backgroundColor = PXMAJORCOLOR;
    btn.layer.cornerRadius = 3.0f;
    [btn setTitle:@"保存"forState:UIControlStateNormal];
    [btn setTitleColor:PXWHITECOLOR forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem  *barBut = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barBut;
    
    UILablePadding *labPermissions = [[UILablePadding alloc]initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 44)];
    labPermissions.backgroundColor = HexColor(0xBEBEBE);
    labPermissions.text = @"是否为私有圈子";
    labPermissions.edgeInsets = UIEdgeInsetsMake(8, 8 + 10, 8, 8 + 10);
    [self.view addSubview:labPermissions];
    
    
    self.swCircle  = [[UISwitch alloc]init];
    [self.view addSubview:self.swCircle];
    [self.swCircle addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.swCircle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(labPermissions);
        make.right.mas_equalTo(labPermissions.mas_right).offset(-MarginSize);
    }];
    
}
-(void)switchAction:(UISwitch *)pxSwitch{
    //判断开关的状态
    if (self.swCircle.on) {
        HSChooseWhetherVC *vc = [[HSChooseWhetherVC alloc] init];
        vc.delegate = self;
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        NSLog(@"switch is off");
    }
}
#pragma mark - HSChooseWhetherVCDelegate
-(void)ChooseWhether:(HSChooseWhetherVC *)choosewhether selectedIs:(NSString *)is State:(NSInteger)state{
    if (state == 1) {
        self.swCircle.on = NO;
    }
}

-(void)popView{
    [self.view makeToast:@"创建成功"];
    [self performSelector:@selector(delayPopViewMethod) withObject:nil afterDelay:1.0];
}
- (void)delayPopViewMethod{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
