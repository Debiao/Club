//
//  PX_MC_BM_CircleArrayDetailInfoModel.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PX_MC_BM_CircleFamilyDetailModel;
@class PX_MC_BM_CircleMemberDetailModel;


@interface PX_MC_BM_CircleArrayDetailInfoModel : NSObject

@property(nonatomic,strong) PX_MC_BM_CircleFamilyDetailModel *family;
@property(nonatomic,strong) PX_MC_BM_CircleMemberDetailModel *member;
@end
