//
//  PX_MC_BM_CircleTextCell.h
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PX_MC_BM_CircleFamilyDetailModel.h"

#import "PX_MC_BM_CircleArrayDetailInfoModel.h"

@interface PX_MC_BM_CircleTextCell : UITableViewCell


@property (nonatomic,strong) UIView *cardBgView;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UIImageView *imgAvatar;
@property (nonatomic,strong) UILabel *labname;
@property (nonatomic,strong) UILabel *labnotice;
@property (nonatomic,strong) UILabel *labMembernum;
@property (nonatomic,strong) UILabel *labTopicnum;
@property (nonatomic,strong) UILabel *labTextNotice;

@property (nonatomic,strong) PX_MC_BM_CircleArrayDetailInfoModel *model;


@end

