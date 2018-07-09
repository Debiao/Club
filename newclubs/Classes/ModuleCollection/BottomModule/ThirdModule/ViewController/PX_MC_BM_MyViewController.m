//
//  PX_MC_BM_MyViewController.m
//  newclubs
//
//  Created by a on 2018/5/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyViewController.h"
#import "PX_BC_NavigationViewController.h"
#import "PX_UM_LoginViewController.h"
#import "PX_BC_TabBarViewController.h"
#import "PX_TC_CG_TopPicDownTextButton.h"
#import "PX_MC_BM_MySettingViewController.h"

#import "PX_MC_BM_MyTopicViewController.h"
#import "PX_MC_BM_MyFavoriteViewController.h"
#import "PX_MC_BM_MyResponseViewController.h"
#import "PX_MC_BM_MyFootprintViewController.h"

#import "PX_MC_BM_MyIntegralViewController.h"
#import "PX_MC_BM_MyApplyHistoryViewController.h"

#import "PX_MC_BM_MyInfoViewController.h"

@interface PX_MC_BM_MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIImageView *logoImgv;
@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UIButton *btnTopic;
@property (nonatomic, strong) NSArray *dataListTxetArray;
@property (nonatomic, strong) NSArray *btnImgArray;

@property (nonatomic,strong) UIButton *btnInfo;

@end

@implementation PX_MC_BM_MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawView];
    [self myTableView];
    [self createBtnTopic];
    
    NSLog(@"棒槌%@",[PX_UserDefaults objectForKey:@"token"]);
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(drawView) name:@"ModifyUsernformation" object:nil];
    
}

- (void)createBtnTopic{

    CGFloat w = self.view.bounds.size.width / self.dataListTxetArray.count;
    
    for (int i = 0; i < self.dataListTxetArray.count; i++) {
        _btnTopic = [PX_TC_CG_TopPicDownTextButton buttonWithType:UIButtonTypeCustom];
        [_btnTopic setTitle:self.dataListTxetArray[i] forState:UIControlStateNormal];
        [_btnTopic setTitleColor:PXBLACKCOLOR forState:UIControlStateNormal];
        [_btnTopic setImage:[UIImage imageNamed:self.btnImgArray[i]] forState:UIControlStateNormal];
        _btnTopic.adjustsImageWhenHighlighted = NO;
        _btnTopic.tag = 1000 + i;
        [_btnTopic addTarget:self action:@selector(btnTopicClick:) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:_btnTopic];
        
        [_btnTopic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.topView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(w, 80));
            make.left.mas_equalTo(self.topView.mas_left).offset(i*w);
        }];
     
    }
    
}

- (NSArray *)dataListTxetArray{
    if (!_dataListTxetArray) {
        _dataListTxetArray = @[@"我的话题",@"我的回复",@"我喜欢的",@"我的足迹"];
        
    }
    return _dataListTxetArray;
}
- (NSArray *)btnImgArray{
    if (!_btnImgArray) {
        _btnImgArray = @[@"ic_image_me_topic",@"ic_image_me_reply",@"ic_image_me_like",@"ic_image_me_read"];
        
    }
    return _btnImgArray;
}
- (void)btnTopicClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1000:
        {
            PX_MC_BM_MyTopicViewController *MyTopicVc = [[PX_MC_BM_MyTopicViewController alloc]init];
            [self.navigationController pushViewController:MyTopicVc animated:YES];
            
        }
            break;
            
        case 1001:
        {
            PX_MC_BM_MyFavoriteViewController *MyFavoriteVc = [[PX_MC_BM_MyFavoriteViewController alloc]init];
            [self.navigationController pushViewController:MyFavoriteVc animated:YES];
        }
            break;
        case 1002:
        {
            PX_MC_BM_MyResponseViewController *MyResponseVc = [[PX_MC_BM_MyResponseViewController alloc]init];
            [self.navigationController pushViewController:MyResponseVc animated:YES];
        }

            break;
        default:
        {
            PX_MC_BM_MyFootprintViewController *MyFootprintVc = [[PX_MC_BM_MyFootprintViewController alloc]init];
            [self.navigationController pushViewController:MyFootprintVc animated:YES];
        }
            break;
    }
    
    
}
- (void)drawView
{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT/3)];
    _topView.backgroundColor = PXWHITECOLOR;
    

    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT/3)];
    self.myTableView.tableHeaderView = _topView;


    _logoImgv = [[UIImageView alloc]init];

    NSData *imageData;
    imageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"image"] == nil) {
        
        [self.logoImgv sd_setImageWithURL:[NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/h%3D300/sign=1cde79857e0e0cf3bff748fb3a47f23d/adaf2edda3cc7cd9019ce04e3501213fb90e91f0.jpg"]];
    }else{
        [_logoImgv setImage:[NSKeyedUnarchiver unarchiveObjectWithData:imageData]];
        
    }
    
    _logoImgv.layer.cornerRadius = 56/2;
    _logoImgv.layer.masksToBounds = YES;
    [_topView addSubview:_logoImgv];
    [_logoImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.topView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(56, 56));
        make.left.mas_equalTo(self.topView.mas_left).offset(16);
    }];
    
    
    _nameLab = [[UILabel alloc]init];
    _nameLab.textColor = PXMAJORCOLOR;
    _nameLab.text = @"樱花树";
    _nameLab.font = [UIFont systemFontOfSize:18];
    
    [_topView addSubview:_nameLab];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.topView).offset(-15);
        make.left.mas_equalTo(self.logoImgv.mas_right).offset(12);
    }];

    
    _btnInfo  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnInfo addTarget:self action:@selector(logoImgvBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:_btnInfo];
    [_btnInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.bottom.mas_equalTo(self.logoImgv.mas_bottom).offset(20);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId=@"SettingCell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.font=TextFont(16);
    cell.textLabel.textColor=ZhengWenColor;
    
    switch (indexPath.section) {
        case 0: {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.font = TextFont(14);
            cell.detailTextLabel.backgroundColor = HexColor(0x333333);
            
            if (indexPath.row==0) {
                cell.textLabel.text=@"我的积分";
                cell.imageView.image=[UIImage imageNamed:@"账户"];
            } else  if (indexPath.row==1) {
                cell.textLabel.text=@"申请历史";
                cell.imageView.image=[UIImage imageNamed:@"卡包"];
            }
//            }else{
//                cell.textLabel.text=@"设置";
//                cell.imageView.image=[UIImage imageNamed:@"设置"];
//            }
            
        }
            
            break;
            
        default: {
//            cell.accessoryType=UITableViewCellAccessoryNone; 无右侧箭头
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text=@"设置";
            cell.textLabel.textColor = HexColor(0x333333);
            cell.imageView.image=[UIImage imageNamed:@"setting_tuichu"];
        }
            
            break;
    }
    
    
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            
            switch (indexPath.row) {
                case 0:  {
                    PX_MC_BM_MyIntegralViewController *MyIntegralVc=[[PX_MC_BM_MyIntegralViewController alloc]init];
                    [self.navigationController pushViewController:MyIntegralVc animated:YES];
                }
                    break;
                    
                case 1: {
                    PX_MC_BM_MyApplyHistoryViewController * MyApplyHistoryVc = [[PX_MC_BM_MyApplyHistoryViewController alloc] init];
                    [self.navigationController pushViewController:MyApplyHistoryVc animated:YES];
                }
                    
                    break;
                case 2: {
//                    SD_Me_SettingController *SettingVc=[[SD_Me_SettingController alloc] init];
//                    [self.navigationController pushViewController:SettingVc animated:YES];
                }
                    
                    break;
            }
            break;
        }
        default:
        {
            //            //初始化提示框；
            //            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定要退出登录" preferredStyle:  UIAlertControllerStyleAlert];
            //
            //            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //                [self logoutAction];
            //            }]];
            //
            //
            //            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //
            //
            //            }]];
            //            //弹出提示框；
            //            [self presentViewController:alert animated:true completion:nil];
            
            
            PX_MC_BM_MySettingViewController * MySettingVc = [[PX_MC_BM_MySettingViewController alloc] init];
            [self.navigationController pushViewController:MySettingVc animated:YES];
        }
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 24;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat sectionHeaderHeight = 50;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y> 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }else
        if(scrollView.contentOffset.y >= sectionHeaderHeight){
            
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
}


#pragma mark --lazy
- (UITableView *)myTableView{
    if (!_myTableView) {
        
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,-44, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.rowHeight = 44;
        _myTableView.separatorColor = LineColor;
        _myTableView.backgroundColor = LineColor ;
        // 解决方法三：添加以下代码关闭估算行高
        _myTableView.estimatedRowHeight = 0;
        _myTableView.estimatedSectionHeaderHeight = 0;
        _myTableView.estimatedSectionFooterHeight = 0;
        self.myTableView.scrollEnabled = NO;
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}

- (void)logoImgvBtnClick{
    
    PX_MC_BM_MyInfoViewController *MyInfoVc = [[PX_MC_BM_MyInfoViewController alloc]init];

    [self.navigationController pushViewController:MyInfoVc animated:YES];
    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imgae;
}

@end


