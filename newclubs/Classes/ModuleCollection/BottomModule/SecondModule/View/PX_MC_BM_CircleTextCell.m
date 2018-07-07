//
//  PX_MC_BM_CircleTextCell.m
//  newclubs
//
//  Created by sundebiao on 2018/6/13.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CircleTextCell.h"
#import "PX_MC_BM_RecommendArrayDetailInfoModel.h"

@implementation PX_MC_BM_CircleTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];
        
    }
    return self;
}

-(void)creatUI{
    
    self.backgroundColor = LineColor;
    
    self.cardBgView = [[UIView alloc]init];
    self.cardBgView.backgroundColor = PXWHITECOLOR ;
    self.cardBgView.layer.masksToBounds = NO;
    self.cardBgView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardBgView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.cardBgView.layer.shadowOpacity = 0.2f;
    [self.contentView addSubview:self.cardBgView];
    
  
    
        self.imgAvatar = [[UIImageView alloc]init];
        self.imgAvatar.backgroundColor = [UIColor redColor];
        self.imgAvatar.layer.cornerRadius = 5;
        self.imgAvatar.layer.masksToBounds = YES;
        [self.cardBgView addSubview:self.imgAvatar];
    
    
    
    
    self.labTextNotice = [[UILabel alloc]init];
    self.labTextNotice.text = @"公告 :";
    self.labTextNotice.font = [UIFont boldSystemFontOfSize:12];
    self.labTextNotice.textColor =  HexColor(0xB3B3B3);
    [self.cardBgView addSubview:self.labTextNotice];
    
        self.labname = [[UILabel alloc]init];
        self.labname.text = @"damper";
        self.labname.font = [UIFont boldSystemFontOfSize:ContentTextSize];
        self.labname.textColor =  HexColor(0xB3B3B3);
        [self.cardBgView addSubview:self.labname];
   
    
        self.labnotice = [[UILabel alloc]init];
        self.labnotice.text = @"圈内暂无异事和传文";
        self.labnotice.font = [UIFont boldSystemFontOfSize:12];
        self.labnotice.textColor =  HexColor(0xB3B3B3);
        [self.cardBgView addSubview:self.labnotice];
    
    

    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = HexColor(0xf2f2f2) ;
    [self.cardBgView addSubview:self.lineView];
    
    
    
        self.labMembernum = [[UILabel alloc]init];
        self.labMembernum.text = @"damper";
        self.labMembernum.font = [UIFont boldSystemFontOfSize:ContentTextSize];
        self.labMembernum.textColor =  HexColor(0xB3B3B3);
        [self.cardBgView addSubview:self.labMembernum];
    
        self.labTopicnum = [[UILabel alloc]init];
        self.labTopicnum.text = @"damper";
        self.labTopicnum.font = [UIFont boldSystemFontOfSize:ContentTextSize];
        self.labTopicnum.textColor =  HexColor(0xB3B3B3);
        [self.cardBgView addSubview:self.labTopicnum];
    
    
    
    [self.cardBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(MarginSize/2);
        make.height.mas_equalTo(130);
        make.width.mas_equalTo(SCREEN_WIDTH-MarginSize);
        make.centerX.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-MarginSize/3);
    }];
    
        [self.imgAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.cardBgView.mas_top).offset(MarginSize/1.5);
            make.left.mas_equalTo(self.cardBgView.mas_left).offset(MarginSize/1.5);
            make.size.mas_equalTo(CGSizeMake(35, 35));
        }];
    
    
    
    [self.labTextNotice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.imgAvatar);
        make.top.mas_equalTo(self.imgAvatar.mas_bottom).offset(MarginSize);
    }];
    
    
    
        [self.labname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.imgAvatar);
            make.left.mas_equalTo(self.imgAvatar.mas_right).offset(MarginSize*2);
        }];
    
    
    
    
        [self.labnotice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.labTextNotice);
            make.left.mas_equalTo(self.labname.mas_left);
        }];
    
    
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labname.mas_left);
        make.height.mas_equalTo(0.5);
        make.width.mas_equalTo(self.cardBgView.mas_width).offset(-MarginSize*6);
        make.bottom.mas_equalTo(self.labTopicnum.mas_top).offset(-MarginSize/2);
    }];
    
        [self.labMembernum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.labname.mas_left);
            make.bottom.mas_equalTo(-MarginSize);
        }];
  
    
        [self.labTopicnum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.lessThanOrEqualTo(self.cardBgView.mas_right).offset(-MarginSize*6);
            make.bottom.mas_equalTo(-MarginSize);
        }];
    
    
}

-(void)setModel:(PX_MC_BM_CircleArrayDetailInfoModel *)model{
    
    
    self.labname.text = model.family.name;
    
    
    if (model.family.notice.length == 0) {
        self.labnotice.text = @"圈内暂无异事和传文";
    }else{
        self.labnotice.text = model.family.notice;
    }
    
    if ([model.family.avatar isEqualToString:@"http://cdnclub.test.upcdn.net/default.png"]) {
         [self.imgAvatar sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2875259951,2765812962&fm=27&gp=0.jpg"]];
    }else{
        [self.imgAvatar sd_setImageWithURL:[NSURL URLWithString:model.family.avatar]];
    }
    
    self.labTopicnum.text = [NSString stringWithFormat:@"%@ %ld",@"话题",model.family.topicnum];
    self.labMembernum.text = [NSString stringWithFormat:@"%@ %ld",@"人数",model.family.membernum] ;


//    self.labname.text = @"符启月";
//    self.labnotice.text = @"圈内暂无异事和传文";
//    self.labTopicnum.text = @"huatishu";
//    self.labMembernum.text = @"jiazhushu";
    
}


@end
