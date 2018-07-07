//
//  PX_MC_BM_RecommendSecondTextCell.h
//  newclubs
//
//  Created by a on 2018/7/7.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PX_MC_BM_RecommendSecondArrayDataModel.h"

@interface PX_MC_BM_RecommendSecondTextCell : UITableViewCell

@property (nonatomic,strong) UIImageView *imgAuthoravatar;

@property (nonatomic,strong) UILabel *labAuthornickname;
@property (nonatomic,strong) UILabel *labContent;
@property (nonatomic,strong) UILabel *labCreattime;
//@property (nonatomic,strong) UILabel *labVisitnum;

@property (nonatomic,strong) PX_MC_BM_RecommendSecondArrayDataModel *model;


@end
