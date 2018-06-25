//
//  PX_UM_RegisteredHandle.h
//  newclubs
//
//  Created by sundebiao on 2018/5/31.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_Handle.h"

@interface PX_UM_RegisteredHandle : PX_BC_Handle
//注册
+ (void)performaRegisteredType:(NSInteger)type Code:(NSString *)code UserName:(NSString *)userName Password:(NSString *)password success:(SucessBlock)success
                       failure:(FailedBlock)failure;

@end
