//
//  PX_MC_BM_RecommendSecondTextCell.m
//  newclubs
//
//  Created by a on 2018/7/7.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendSecondTextCell.h"

@implementation PX_MC_BM_RecommendSecondTextCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];
        
    }
    return self;
}

-(void)creatUI{
    
    self.imgAuthoravatar = [[UIImageView alloc]init];
    self.imgAuthoravatar.backgroundColor = [UIColor redColor];
    self.imgAuthoravatar.layer.cornerRadius = 15;
    self.imgAuthoravatar.layer.masksToBounds = YES;
    [self.contentView addSubview:self.imgAuthoravatar];
    
    self.labAuthornickname = [[UILabel alloc]init];
    self.labAuthornickname.text = @"damper";
    self.labAuthornickname.font = [UIFont boldSystemFontOfSize:12];
    self.labAuthornickname.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labAuthornickname];
    
    self.labContent = [[UILabel alloc]init];
    self.labContent.text = @"damper";
    self.labContent.font = [UIFont boldSystemFontOfSize:12];
    self.labContent.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labContent];
    
    self.labCreattime = [[UILabel alloc]init];
    self.labCreattime.text = @"damper";
    self.labCreattime.font = [UIFont boldSystemFontOfSize:12];
    self.labCreattime.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labCreattime];
    
    [self.imgAuthoravatar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(TopMarginSize);
        make.left.mas_equalTo(MarginSize);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.labAuthornickname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgAuthoravatar);
        make.left.mas_equalTo(self.imgAuthoravatar.mas_right).offset(MarginSize);
    }];
    
    [self.labContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imgAuthoravatar.mas_bottom).offset(MarginSize*2);
        make.left.mas_equalTo(self.imgAuthoravatar.mas_right).offset(MarginSize);
    }];
    
    [self.labCreattime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labContent.mas_bottom).offset(MarginSize*2);
        make.left.mas_equalTo(MarginSize);
        make.bottom.mas_offset(-MarginSize);
    }];

}

-(void)setModel:(PX_MC_BM_RecommendSecondArrayDataModel *)model{
    [self.imgAuthoravatar sd_setImageWithURL:[NSURL URLWithString:model.authoravatar]];
    self.labAuthornickname.text = model.authornickname;
    self.labContent.text = model.content;
    self.labCreattime.text = model.creattime;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
