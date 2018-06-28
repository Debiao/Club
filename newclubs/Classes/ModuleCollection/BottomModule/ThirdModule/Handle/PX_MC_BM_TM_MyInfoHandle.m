//
//  PX_MC_BM_TM_MyInfoHandle.m
//  newclubs
//
//  Created by a on 2018/6/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_TM_MyInfoHandle.h"
#import "PX_MC_BM_MyInfoBaseModel.h"
@implementation PX_MC_BM_TM_MyInfoHandle

//我的⽤用户详情
+ (void)performaMyInfnSuccess:(SucessBlock)success
                      failure:(FailedBlock)failure{
    
    [PX_TC_SC_HttpTool postWithPath:NEWCLUBSURL(MYUSERDETAILS)  params:nil success:^(id json) {
        PX_MC_BM_MyInfoBaseModel *data = [PX_MC_BM_MyInfoBaseModel mj_objectWithKeyValues:json];
        success(data);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
    

}
@end
