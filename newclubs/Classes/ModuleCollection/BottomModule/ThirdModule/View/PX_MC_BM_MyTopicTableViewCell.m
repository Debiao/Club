//
//  PX_MC_BM_MyTopicTableViewCell.m
//  newclubs
//
//  Created by a on 2018/6/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyTopicTableViewCell.h"
#import "PX_MC_BM_MyTopicDetailModel.h"



@implementation PX_MC_BM_MyTopicTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self creatUI];
        
    }
    return self;
}

-(void)creatUI{
    
  
    self.labCreattime = [[UILabel alloc]init];
    self.labCreattime.text = @"N天前";
    self.labCreattime.font = [UIFont boldSystemFontOfSize:12];
    self.labCreattime.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labCreattime];
    
    self.labTitle = [[UILablePadding alloc]init];
    self.labTitle.text = @"标题";
    self.labTitle.edgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    self.labTitle.font = [UIFont boldSystemFontOfSize:18];
    self.labTitle.textColor = PXBLACKCOLOR;
    self.labTitle.backgroundColor = HexColorA(0xB3B3B3, 0.4);
    [self.contentView addSubview:self.labTitle];
    

    self.labInstructions = [[UILabel alloc]init];
    self.labInstructions.text = @"我发表了一个话题";
    self.labInstructions.font = [UIFont boldSystemFontOfSize:12];
    self.labInstructions.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labInstructions];
    
    
    [self.labCreattime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
    }];
    

    [self.labInstructions mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labCreattime.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
    }];

    [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labInstructions.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
        make.width.mas_equalTo(self.contentView.mas_width).offset(-MarginSize*2);
        make.height.mas_equalTo(30);
        make.bottom.mas_equalTo(-MarginSize);
    }];
       
}

-(void)setModel:(PX_MC_BM_MyTopicModel *)model{

    self.labCreattime.text = model.topic.creattime;
    
    self.labTitle.text = model.topic.title;
    
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
