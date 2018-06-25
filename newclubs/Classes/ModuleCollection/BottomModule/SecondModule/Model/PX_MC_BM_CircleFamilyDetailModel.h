//
//  PX_MC_BM_CircleFamilyDetailModel.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PX_MC_BM_CircleFamilySettingDetailModel;

@interface PX_MC_BM_CircleFamilyDetailModel : NSObject

@property(nonatomic,strong) NSString *id_str;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *avatar;
@property(nonatomic,strong) NSString *notice;
@property(nonatomic,strong) NSString *brief;
@property(nonatomic,strong) NSString *spaceurl;
@property(nonatomic,assign) long membernum;
@property(nonatomic,assign) long topicnum;
@property(nonatomic,assign) BOOL isdisable;

@property(nonatomic,strong) PX_MC_BM_CircleFamilySettingDetailModel *setting;

//
//"family": {
//    "id": "5b20730654cd8a08a901bde4",
//    "name": "听哦听你听哦mix",
//    "avatar": "http://cdnclub.test.upcdn.net/default.png",
//    "notice": "",
//    "brief": "郭敬格子兮名字一种",
//    "spaceurl": "about:blank",
//    "membernum": 1,
//    "topicnum": 0,
//    "isdisable": false,
//    "setting": {
//        "credit_name": "积分",
//        "is_private": true,
//        "exp_datum": 10,
//        "limit_deal": false,
//        "review_user": 1,
//        "award_topic": 0
//    }











@end
