//
//  PX_MC_BM_MyTopicDetailModel.h
//  newclubs
//
//  Created by a on 2018/6/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PX_MC_BM_MyTopicAttributeModel;

@interface PX_MC_BM_MyTopicDetailModel : NSObject

@property(nonatomic,strong) PX_MC_BM_MyTopicAttributeModel *attribute;
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
