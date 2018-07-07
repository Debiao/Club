//
//  PX_MC_BM_RecommendHandle.h
//  newclubs
//
//  Created by sundebiao on 2018/6/4.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_Handle.h"

@interface PX_MC_BM_RecommendHandle : PX_BC_Handle
//查找话题列列表
+ (void)performaRecommendFamilyid:(NSString *)familyid Page:(NSInteger)page Limit:(NSInteger)limit Success:(SucessBlock)success
                  failure:(FailedBlock)failure;
//话题详情列表
+ (void)performaRecommendSecondTid:(NSString *)tid Page:(NSInteger)page Success:(SucessBlock)success
                          failure:(FailedBlock)failure;
@end
