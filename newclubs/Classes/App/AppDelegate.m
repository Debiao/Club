//
//  AppDelegate.m
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "AppDelegate.h"

//定义判断网络状态的全局变量
BOOL whetherHaveNetwork;
//定义是否登录
BOOL isLogin;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.tabbarVc = [[PX_BC_TabBarViewController alloc] init];
    self.window.rootViewController = self.tabbarVc;
    [self.window makeKeyAndVisible];
    [self initProperty];

//    [PX_TC_SC_HttpTool httpManagerNetworkReachabilityManageWithBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusNotReachable: {
//                NSLog(@"无网络");
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"xxxxxx" preferredStyle:UIAlertControllerStyleAlert];
//                        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//                        [alert addAction:actionConfirm];
//                [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
//                break;
//            }
//
//            case AFNetworkReachabilityStatusReachableViaWiFi:{
//                NSLog(@"WiFi网络");
//                break;
//            }
//
//            case AFNetworkReachabilityStatusReachableViaWWAN: {
//                NSLog(@"无线网络");
//                break;
//            }
//
//            default:
//                NSLog(@"不明网络");
//                break;
//        }
//
//    }];

    return YES;
}

/**
 *  初始化应用程序的属性
 */
- (void) initProperty
{
    
    self.httpManager = [AFHTTPSessionManager manager];
    
    self.httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
    /**
     * 由于检测网络有一定的延迟, 所以在启动APP的时候如果不设置网络的延迟, 直接调用[AFNetworkReachabilityManager sharedManager].networkReachabilityStatus有可能得到的是status 返回的值是 AFNetworkReachabilityStatusUnknown;
     这个时候虽然有网, 但是也会因为网络的延迟, 直接做出错误的判断.
     一般建议设置延时调用 */
    
    /** 给大家简单举个例子(surveyNetworkConcatenate:是自己写的方法) */
    
    /** 0.35秒后再执行surveyNetworkConcatenate:方法. */
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [PX_TC_SC_HttpTool httpManagerNetworkReachabilityManage];
    
     
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if (whetherHaveNetwork) {
        //[self.view makeToast:@"没有网络"];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionConfirm];
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
        
    }
    
    if ([PX_UserDefaults objectForKey:@"token"] != nil) {
        isLogin = YES;
    }
    
    
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
