//
//  PX_BC_TabBarViewController.m
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_TabBarViewController.h"

#import "PX_BC_NavigationViewController.h"
#import "PX_TC_TB_TabBarView.h"

#import "PX_MC_BM_RecommendViewController.h"
#import "PX_MC_BM_CircleViewController.h"
#import "PX_MC_BM_MyViewController.h"

@interface PX_BC_TabBarViewController ()<PX_TC_TB_TabBarViewDelegate>

@end

@implementation PX_BC_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 配置控制器
    [self configViewControllers];
    // 加载tabbar
    [self.tabBar addSubview:self.pxtabbar];

    // self.view.backgroundColor = [UIColor redColor];
    // 解决tabbar的阴影线
    //[[UITabBar appearance] setShadowImage:[UIImage new]];
    //[[UITabBar appearance] setBackgroundImage:[UIImage new]];
    // Do any additional setup after loading the view.
    //[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    
}


#pragma mark - delegate
#pragma mark tabbarDelegate
-(void)tabbar:(PX_TC_TB_TabBarView *)tabbar seletexIndex:(NSUInteger)index{
    if (index != 10) {
        self.selectedIndex = index - 100;
        return;
    }
}


#pragma mark - event
#pragma mark  configViewControllers
- (void)configViewControllers
{

    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"PX_MC_BM_RecommendViewController",@"PX_MC_BM_CircleViewController",@"PX_MC_BM_MyViewController"]];
    
    NSArray *titleArray = @[@"",@"",@""];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        vc.navigationItem.title = titleArray[i];
        
        PX_BC_NavigationViewController *nav = [[PX_BC_NavigationViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    };
    self.viewControllers = array;
}

#pragma mark - lazy
- (PX_TC_TB_TabBarView *)pxtabbar
{
    if (!_pxtabbar) {
        _pxtabbar = [[PX_TC_TB_TabBarView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,TabBar_Height)];
        _pxtabbar.backgroundColor = PXWHITECOLOR;
        _pxtabbar.delegate = self;
    }
    
    return _pxtabbar;
}


@end
