//
//  PX_MC_BM_RecommendSecondZeroTextImgCell.m
//  newclubs
//
//  Created by a on 2018/7/7.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendSecondZeroTextImgCell.h"

@implementation PX_MC_BM_RecommendSecondZeroTextImgCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];
        
    }
    return self;
}

-(void)creatUI{
    
    //    self.backgroundColor = MAJORCOLOR;
    
    
    self.imgAuthoravatar = [[UIImageView alloc]init];
    self.imgAuthoravatar.backgroundColor = [UIColor redColor];
    self.imgAuthoravatar.layer.cornerRadius = 15;
    self.imgAuthoravatar.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgAuthoravatar];
    
    self.labLastauthorname = [[UILabel alloc]init];
    self.labLastauthorname.text = @"damper";
    self.labLastauthorname.font = [UIFont boldSystemFontOfSize:12];
    self.labLastauthorname.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labLastauthorname];
    
    self.labTitle = [[UILabel alloc]init];
    self.labTitle.text = @"新圈话题";
    self.labTitle.font = [UIFont boldSystemFontOfSize:12];
    self.labTitle.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labTitle];
    
    self.labCreattime = [[UILabel alloc]init];
    self.labCreattime.text = @"1天前";
    self.labCreattime.font = [UIFont boldSystemFontOfSize:12];
    self.labCreattime.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labCreattime];
    

    self.imgValue = [[UIImageView alloc]init];
    self.imgValue.backgroundColor = [UIColor redColor];
    self.imgValue.layer.cornerRadius = 5;
    self.imgValue.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgValue];
    
    [self.imgAuthoravatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(TopMarginSize);
        make.left.mas_equalTo(MarginSize);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.labLastauthorname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgAuthoravatar);
        make.left.mas_equalTo(self.imgAuthoravatar.mas_right).offset(MarginSize);
    }];
    
    [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgAuthoravatar.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
    }];
    
    [self.imgValue mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labTitle.mas_bottom).offset(TopMarginSize);
        make.left.mas_equalTo(self.contentView.mas_left).offset(TopMarginSize);
        make.width.mas_equalTo(SCREEN_WIDTH-TopMarginSize*2);
        make.height.mas_equalTo(200);
    }];
    

    [self.labCreattime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgValue.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
        make.bottom.mas_equalTo(-MarginSize);
    }];
    
    
    
}

@end
