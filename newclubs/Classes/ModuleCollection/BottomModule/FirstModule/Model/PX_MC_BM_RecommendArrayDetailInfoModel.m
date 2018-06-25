//
//  PX_MC_BM_RecommendArrayDetailInfoModel.m
//  newclubs
//
//  Created by sundebiao on 2018/6/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendArrayDetailInfoModel.h"

@implementation PX_MC_BM_RecommendArrayDetailInfoModel

//+(NSDictionary *)mj_objectClassInArray{
//    
//    return @{@"value":@"PX_MC_BM_RecommendValueModel"
//             };
//}
+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"id_str" : @"id"
             };
}

@end
