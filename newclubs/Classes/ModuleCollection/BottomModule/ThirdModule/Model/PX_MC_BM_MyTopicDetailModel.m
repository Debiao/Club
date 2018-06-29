//
//  PX_MC_BM_MyTopicDetailModel.m
//  newclubs
//
//  Created by a on 2018/6/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyTopicDetailModel.h"

@implementation PX_MC_BM_MyTopicDetailModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"id_str" : @"id"
             };
}
@end
