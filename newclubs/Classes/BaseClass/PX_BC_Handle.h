//
//  PX_BC_Handle.h
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

// 处理完成事件
typedef void(^CompleteBlock)(void);
// 处理成功返回数据
typedef void(^SucessBlock)(id obj);
// 失败
typedef void(^FailedBlock)(id obj);


@interface PX_BC_Handle : NSObject

@end
