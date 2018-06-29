//
//  PX_MC_BM_MyTopicTableViewCell.h
//  newclubs
//
//  Created by a on 2018/6/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PX_MC_BM_MyTopicModel.h"
#import "UILablePadding.h"

@interface PX_MC_BM_MyTopicTableViewCell : UITableViewCell

@property (nonatomic,strong) UILablePadding *labTitle;
@property (nonatomic,strong) UILabel *labCreattime;
@property (nonatomic,strong) UILabel *labInstructions;

@property (nonatomic,strong) PX_MC_BM_MyTopicModel *model;

@end
