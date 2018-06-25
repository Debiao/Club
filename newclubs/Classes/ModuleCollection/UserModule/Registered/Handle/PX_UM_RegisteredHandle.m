//
//  PX_UM_RegisteredHandle.m
//  newclubs
//
//  Created by sundebiao on 2018/5/31.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_UM_RegisteredHandle.h"

#import "PX_UM_RegisteredModel.h"

@implementation PX_UM_RegisteredHandle

//注册
+ (void)performaRegisteredType:(NSInteger)type Code:(NSString *)code UserName:(NSString *)userName Password:(NSString *)password success:(SucessBlock)success
                       failure:(FailedBlock)failure{
    NSDictionary *dic = @{
                          @"type":@(type),
                          @"username":userName,
                          @"password":password,
                          @"code":code
                          };
    [PX_TC_SC_HttpTool postWithPath:NEWCLUBSURL(REGISTERED) params:dic success:^(id json) {
      
        PX_UM_RegisteredModel * data = [PX_UM_RegisteredModel mj_objectWithKeyValues:json];
        success(data);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
