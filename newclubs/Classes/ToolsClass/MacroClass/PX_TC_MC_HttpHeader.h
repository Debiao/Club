//
//  PX_TC_MC_HttpHeader.h
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#ifndef PX_TC_MC_HttpHeader_h
#define PX_TC_MC_HttpHeader_h

//正式
#define BASEURL @"http://www.ingx.net"   //http://47.106.175.99"
#define NEWCLUBSURL(a)  [NSString stringWithFormat:@"%@%@",BASEURL,a]

//用户协议
#define USERAGREEMENT @"/public/privacy.html"

//普通账号登录
#define ORDINARYACCOUNTLOGIN @"/api/user/login"
//注册
#define REGISTERED @"/api/user/reg"
//我的⽤用户详情
#define MYUSERDETAILS @"/api/user/info"

//其他⽤用户详情
// OTHERUSERDETAILS

//17查找我的圈⼦子(*)
#define FAMILYMYLIST @"/api/family/mylist"

//18查找话题列列表
#define TOPICLIST @"/api/topic/index"

#endif /* PX_TC_MC_HttpHeader_h */
