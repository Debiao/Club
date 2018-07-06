//
//  PX_MC_BM_RecommendSecondArrayDataModel.h
//  newclubs
//
//  Created by a on 2018/7/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PX_MC_BM_RecommendSecondPermissionsModel;

@interface PX_MC_BM_RecommendSecondArrayDataModel : NSObject

@property(nonatomic,strong) NSArray *attachment;
@property(nonatomic,strong) NSString *authoravatar;
@property(nonatomic,strong) NSString *authorhonorname;
@property(nonatomic,strong) NSString *authornickname;
@property(nonatomic,strong) NSString *authoruid;
@property(nonatomic,assign) long buynum;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,strong) NSString *creattime;
@property(nonatomic,strong) NSString *creditname;
@property(nonatomic,strong) NSArray *dlist;
@property(nonatomic,strong) NSString *id_str;
@property(nonatomic,assign) BOOL islimitdeal;
@property(nonatomic,strong) PX_MC_BM_RecommendSecondPermissionsModel *permissions;
@property(nonatomic,strong) NSString *topicid;







@end
