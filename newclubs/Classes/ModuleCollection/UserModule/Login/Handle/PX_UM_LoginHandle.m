//
//  PX_UM_LoginHandle.m
//  newclubs
//
//  Created by sundebiao on 2018/5/31.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_LoginHandle.h"
#import "PX_UM_LoginModel.h"

@implementation PX_UM_LoginHandle
//登录
+ (void)performaLoginType:(NSInteger)type UserName:(NSString *)userName Password:(NSString *)password success:(SucessBlock)success
                  failure:(FailedBlock)failure{
    NSDictionary *dic = @{
                          @"type":@(type),
                          @"username":userName,
                          @"password":password
                          };
    [PX_TC_SC_HttpTool postWithPath:NEWCLUBSURL(ORDINARYACCOUNTLOGIN) params:dic success:^(id json) {
        PX_UM_LoginModel *data = [PX_UM_LoginModel mj_objectWithKeyValues:json];
        success(data);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
