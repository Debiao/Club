//
//  PX_MC_BM_RecommendArrayDetailInfoModel.h
//  newclubs
//
//  Created by sundebiao on 2018/6/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PX_MC_BM_RecommendAttributeModel;

@interface PX_MC_BM_RecommendArrayDetailInfoModel : NSObject

@property(nonatomic,strong) PX_MC_BM_RecommendAttributeModel *attribute;
@property(nonatomic,strong) NSString *authoravatar;
@property(nonatomic,strong) NSString *authorhonorname;
@property(nonatomic,strong) NSString *authorname;
@property(nonatomic,strong) NSString *authoruid;
@property(nonatomic,strong) NSString *creattime;
@property(nonatomic,strong) NSString *familtyname;
@property(nonatomic,strong) NSString *id_str;
@property(nonatomic,strong) NSString *lastauthorname;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *updatetime;
@property(nonatomic,strong) NSString *visitnum;
@property(nonatomic,strong) NSArray   *value;

@end
