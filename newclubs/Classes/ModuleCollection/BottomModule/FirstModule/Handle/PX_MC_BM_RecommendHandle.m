//
//  PX_MC_BM_RecommendHandle.m
//  newclubs
//
//  Created by sundebiao on 2018/6/4.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendHandle.h"
#import "PX_MC_BM_RecommendBaseModel.h"
#import "PX_MC_BM_RecommendSecondBaseModel.h"

@implementation PX_MC_BM_RecommendHandle

//查找话题列列表
+ (void)performaRecommendFamilyid:(NSString *)familyid Page:(NSInteger)page Limit:(NSInteger)limit Success:(SucessBlock)success
                          failure:(FailedBlock)failure{
    
    NSDictionary *dic = @{
                          @"familyid":familyid,
                          @"page":@(page),
                          //@"limit":@(limit)
                          };
    
    [PX_TC_SC_HttpTool getWithPath:NEWCLUBSURL(TOPICLIST) params:dic success:^(id json) {
        
        PX_MC_BM_RecommendBaseModel *data = [PX_MC_BM_RecommendBaseModel mj_objectWithKeyValues:json];
        success(data);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
  

}

//话题详情列表
+ (void)performaRecommendSecondTid:(NSString *)tid Page:(NSInteger)page Success:(SucessBlock)success
                           failure:(FailedBlock)failure{
    NSDictionary *dic = @{
                          @"tid":tid,
                          @"page":@(page)
                          };
    
    [PX_TC_SC_HttpTool getWithPath:NEWCLUBSURL(REPLYINDEX) params:dic success:^(id json) {
        
        PX_MC_BM_RecommendSecondBaseModel *data = [PX_MC_BM_RecommendSecondBaseModel mj_objectWithKeyValues:json];
        success(data);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
