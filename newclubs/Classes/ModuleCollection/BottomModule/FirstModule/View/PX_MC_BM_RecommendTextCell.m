//
//  PX_MC_BM_RecommendTextCell.m
//  newclubs
//
//  Created by sundebiao on 2018/6/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendTextCell.h"

@implementation PX_MC_BM_RecommendTextCell
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
    
    self.labAuthorname = [[UILabel alloc]init];
    self.labAuthorname.text = @"damper";
    self.labAuthorname.font = [UIFont boldSystemFontOfSize:12];
    self.labAuthorname.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labAuthorname];
    
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
    
    self.labFamiltyname = [[UILabel alloc]init];
    self.labFamiltyname.text = @"信息公布圈";
    self.labFamiltyname.font = [UIFont boldSystemFontOfSize:12];
    self.labFamiltyname.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labFamiltyname];
    
    self.labCreattime = [[UILabel alloc]init];
    self.labCreattime.text = @"1天前";
    self.labCreattime.font = [UIFont boldSystemFontOfSize:12];
    self.labCreattime.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labCreattime];
    
    self.labVisitnum = [[UILabel alloc]init];
    self.labVisitnum.text = @"4阅读";
    self.labVisitnum.font = [UIFont boldSystemFontOfSize:12];
    self.labVisitnum.textColor =  HexColor(0xB3B3B3);
    [self.contentView addSubview:self.labVisitnum];
    

//    self.imgAuthoravatar = [[UIImageView alloc]init];
//    self.imgAuthoravatar.backgroundColor = [UIColor redColor];
//    self.imgAuthoravatar.layer.cornerRadius = 25;
//    self.imgAuthoravatar.layer.masksToBounds = YES;
//    [self.contentView addSubview:self.imgAuthoravatar];
    
    [self.labAuthorname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(TopMarginSize);
        make.left.mas_equalTo(MarginSize);
    }];
    
    [self.labLastauthorname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labAuthorname);
        make.left.mas_equalTo(self.labAuthorname.mas_right).offset(MarginSize);
    }];
    
    [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labAuthorname.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
    }];
    
    
    [self.labFamiltyname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labTitle.mas_bottom).offset(MarginSize);
        make.left.mas_equalTo(MarginSize);
        make.bottom.mas_equalTo(-MarginSize);
    }];
    
    
    [self.labCreattime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labFamiltyname);
        make.left.mas_equalTo(self.labFamiltyname.mas_right).offset(MarginSize);
        make.bottom.mas_equalTo(-MarginSize);
    }];
    
    
    [self.labVisitnum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.labCreattime);
        make.right.lessThanOrEqualTo(self.mas_right).offset(-MarginSize);
        make.bottom.mas_equalTo(-MarginSize);
    }];
    
 
}

-(void)setModel:(PX_MC_BM_RecommendArrayDetailInfoModel *)model
{
    
    self.labAuthorname.text = model.authorname;
    self.labLastauthorname.text = model.lastauthorname;
    self.labTitle.text = model.title;
    self.labFamiltyname.text = model.familtyname;
    self.labCreattime.text = [self compareCurrentTime:[self htcTimeToLocationStr:model.creattime]];
    self.labVisitnum.text = [NSString stringWithFormat:@"%@ %@",model.visitnum,@"阅读"];
    
  

   
    
//    if (model.authoravatar != nil) {
//            [self.imgAuthoravatar mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.mas_equalTo(self.labTitle.mas_bottom).offset(10);
//                make.left.mas_equalTo(self.contentView.mas_left).offset(10);
//                make.width.mas_equalTo(SCREEN_WIDTH-MarginSize*2);
//                make.height.mas_equalTo(100);
//                make.bottom.mas_equalTo(-MarginSize);
//            }];
//         [self.imgAuthoravatar sd_setImageWithURL:[NSURL URLWithString:model.authoravatar]];
//      
//    }
    
    
}


- (NSString *)htcTimeToLocationStr:(NSString*)strM
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    NSDate *dateFormatted = [dateFormatter dateFromString:strM];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *locationTimeString=[dateFormatter stringFromDate:dateFormatted];
    return locationTimeString;
}

- (NSString *) compareCurrentTime:(NSString *)str
{
    //把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    
    //得到与当前时间差
    NSTimeInterval  timeInterval = [timeDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    
    //标准时间和北京时间差8个小时
    //timeInterval = timeInterval - 8*60*60;
    
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30 ){
        
        if (temp==8) {
            result = [NSString stringWithFormat:@"%d周前",1];
        }else if (temp<=15&&temp>8){
            result = [NSString stringWithFormat:@"%d周前",2];
        }else if (temp<=21&&temp>16){
            result = [NSString stringWithFormat:@"%d周前",3];
        }else{
        result = [NSString stringWithFormat:@"%ld天前",temp];
    
        }
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}




//- (void)setFrame:(CGRect)frame{
//    //frame.origin.x += 10;
//    //frame.origin.y += 10;
//    //frame.size.height -= 0.5;
//    //frame.size.width -= 20;
//    [super setFrame:frame];
//}






- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
