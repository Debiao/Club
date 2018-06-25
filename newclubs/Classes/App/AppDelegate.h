//
//  AppDelegate.h
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "PX_BC_TabBarViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,strong) PX_BC_TabBarViewController *tabbarVc;

/**
 *  网络请求单例
 */

@property (strong, nonatomic) AFHTTPSessionManager *httpManager;
/**
 *  ReachabilityStatus
 */

@property (nonatomic, assign) AFNetworkReachabilityStatus reachabilityStatus;
@end

