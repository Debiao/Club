//
//  PX_MC_BM_CircleHandle.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PX_MC_BM_CircleHandle : NSObject
//查找我的圈⼦子(*)
+ (void)performaCircleSuccess:(SucessBlock)success
                      failure:(FailedBlock)failure;
@end
