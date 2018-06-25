//
//  PX_UM_LoginHandle.h
//  newclubs
//
//  Created by sundebiao on 2018/5/31.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_Handle.h"

@interface PX_UM_LoginHandle : PX_BC_Handle
//登录
+ (void)performaLoginType:(NSInteger)type UserName:(NSString *)userName Password:(NSString *)password success:(SucessBlock)success
                       failure:(FailedBlock)failure;
@end
