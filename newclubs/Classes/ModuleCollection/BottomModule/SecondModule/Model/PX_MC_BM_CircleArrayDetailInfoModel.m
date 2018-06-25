//
//  PX_MC_BM_CircleArrayDetailInfoModel.m
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CircleArrayDetailInfoModel.h"

@implementation PX_MC_BM_CircleArrayDetailInfoModel
+(NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"family" : @"PX_MC_BM_CircleFamilyDetailModel",
             @"member" : @"PX_MC_BM_CircleMemberDetailModel"
             };
    
}

@end
