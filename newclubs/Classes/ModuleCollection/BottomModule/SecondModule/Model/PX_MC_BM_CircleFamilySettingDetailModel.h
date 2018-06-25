//
//  PX_MC_BM_CircleFamilySettingDetailModel.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PX_MC_BM_CircleFamilySettingDetailModel : NSObject

@property(nonatomic,strong) NSString *credit_name;
@property(nonatomic,strong) NSString *spaceurl;

@property(nonatomic,assign) long  exp_datum;
@property(nonatomic,assign) long award_topic;

@property(nonatomic,assign) BOOL limit_deal;
@property(nonatomic,assign) BOOL is_private;

//"credit_name": "积分",
//"is_private": true,
//"exp_datum": 10,
//"limit_deal": false,
//"review_user": 1,
//"award_topic": 0
@end
