//
//  PX_MC_BM_RecommendTextCell.h
//  newclubs
//
//  Created by sundebiao on 2018/6/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PX_MC_BM_RecommendArrayDetailInfoModel.h"

@interface PX_MC_BM_RecommendTextCell : UITableViewCell

@property (nonatomic,strong) UILabel *labAuthorname;
@property (nonatomic,strong) UILabel *labLastauthorname;
@property (nonatomic,strong) UILabel *labTitle;
@property (nonatomic,strong) UILabel *labFamiltyname;
@property (nonatomic,strong) UILabel *labCreattime;
@property (nonatomic,strong) UILabel *labVisitnum;

@property (nonatomic,strong) PX_MC_BM_RecommendArrayDetailInfoModel *model;
@end
