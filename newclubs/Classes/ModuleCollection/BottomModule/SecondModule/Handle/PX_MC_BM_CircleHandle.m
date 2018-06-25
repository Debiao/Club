//
//  PX_MC_BM_CircleHandle.m
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CircleHandle.h"
#import "PX_MC_BM_CircleBaseModel.h"
@implementation PX_MC_BM_CircleHandle

//查找我的圈⼦子(*)
+ (void)performaCircleSuccess:(SucessBlock)success
                      failure:(FailedBlock)failure{
    [PX_TC_SC_HttpTool postWithPath:NEWCLUBSURL(FAMILYMYLIST) params:nil success:^(id json) {
        
        
        PX_MC_BM_CircleBaseModel *data = [PX_MC_BM_CircleBaseModel mj_objectWithKeyValues:json];
        success(data);
    } failure:^(NSError *error) {
        NSLog(@"________________%@",NEWCLUBSURL(FAMILYMYLIST));
         failure(error);
    }];
}
@end
