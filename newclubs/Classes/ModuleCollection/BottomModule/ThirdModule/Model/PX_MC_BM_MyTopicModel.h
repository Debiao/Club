//
//  PX_MC_BM_MyTopicModel.h
//  newclubs
//
//  Created by a on 2018/6/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PX_MC_BM_MyTopicDetailModel;

@interface PX_MC_BM_MyTopicModel : NSObject

@property (nonatomic,strong) PX_MC_BM_MyTopicDetailModel *topic;
@property (nonatomic,assign) long type;

@end
