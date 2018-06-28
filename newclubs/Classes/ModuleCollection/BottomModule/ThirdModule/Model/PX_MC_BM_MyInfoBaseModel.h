//
//  PX_MC_BM_MyInfoBaseModel.h
//  newclubs
//
//  Created by a on 2018/6/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PX_MC_BM_MyDetailInfoModel;

@interface PX_MC_BM_MyInfoBaseModel : NSObject
@property (nonatomic,assign) long state;
@property (nonatomic,strong) PX_MC_BM_MyDetailInfoModel *data;
@end
