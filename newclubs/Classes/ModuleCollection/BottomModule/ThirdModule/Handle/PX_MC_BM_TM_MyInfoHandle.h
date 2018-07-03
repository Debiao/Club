//
//  PX_MC_BM_TM_MyInfoHandle.h
//  newclubs
//
//  Created by a on 2018/6/28.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_BC_Handle.h"

@interface PX_MC_BM_TM_MyInfoHandle : PX_BC_Handle
//我的⽤用户详情
+ (void)performaMyInfnSuccess:(SucessBlock)success
                          failure:(FailedBlock)failure;

//修改性别
+ (void)performaMyInfoSex:(NSInteger)SexValue Success:(SucessBlock)success
                      failure:(FailedBlock)failure;
//修改生日
+ (void)performaMyInfoBirthday:(NSString *)birthday Success:(SucessBlock)success
                  failure:(FailedBlock)failure;
//修改签名
+ (void)performaMyInfoMood:(NSString *)mood Success:(SucessBlock)success
                       failure:(FailedBlock)failure;
//修改昵称
+ (void)performaMyInfoModnickname:(NSString *)modnickname Success:(SucessBlock)success
                   failure:(FailedBlock)failure;
//历史回复
+ (void)performaTopicHistoryType:(NSInteger)type Page:(NSInteger)page Success:(SucessBlock)success
                      failure:(FailedBlock)failure;

//获取上传图片的信息
+ (void)performaInfoSStokenDatatype:(NSInteger)datatype Success:(SucessBlock)success
                         failure:(FailedBlock)failure;


@end
