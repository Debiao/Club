//
//  PX_MC_BM_CircleMemberDetailModel.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PX_MC_BM_CirclePermissionsDetailModel;

@interface PX_MC_BM_CircleMemberDetailModel : NSObject


@property(nonatomic,strong) NSString *id_str;
@property(nonatomic,strong) NSString *altname;
@property(nonatomic,strong) NSString *honorname;

@property(nonatomic,assign) long status;
@property(nonatomic,assign) long experience;
@property(nonatomic,assign) long creditnum;

@property(nonatomic,strong) PX_MC_BM_CirclePermissionsDetailModel *permissions;




//"member": {
//    "id": "5b2072b654cd8a08a901bde3",
//    "status": 2,
//    "experience": 1,
//    "altname": "哇哇",
//    "honorname": "暂无荣誉称号",
//    "creditnum": 0,
//    "permissions": {
//        "review_user": 0,
//        "review_content": 0,
//        "mod_member": 0,
//        "mod_details": 0,
//        "mod_setting": 0
//    }
//}
@end
