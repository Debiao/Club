//
//  PX_MC_BM_TM_MyInfoHandle.h
//  newclubs
//
//  Created by a on 2018/6/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_Handle.h"

@interface PX_MC_BM_TM_MyInfoHandle : PX_BC_Handle
//我的⽤用户详情
+ (void)performaMyInfnSuccess:(SucessBlock)success
                          failure:(FailedBlock)failure;
@end
