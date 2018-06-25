//
//  PX_MC_BM_MySettingViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/20.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MySettingViewController.h"


@interface PX_MC_BM_MySettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *settingTableView;
@end

@implementation PX_MC_BM_MySettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self settingTableView];
}

#pragma mark --lazy
- (UITableView *)settingTableView{
    if (!_settingTableView) {
        
        _settingTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREENH_HEIGHT) style:UITableViewStylePlain];
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        _settingTableView.rowHeight = 44;
        _settingTableView.separatorColor = LineColor;
        _settingTableView.backgroundColor =LineColor ;
        // 解决方法三：添加以下代码关闭估算行高
        _settingTableView.estimatedRowHeight = 0;
        _settingTableView.estimatedSectionHeaderHeight = 0;
        _settingTableView.estimatedSectionFooterHeight = 0;
        self.settingTableView.scrollEnabled = NO;
        [self.view addSubview:self.settingTableView];
    }
    return _settingTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId=@"SettingCell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
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
                cell.textLabel.text=@"绑定支付宝";
                cell.imageView.image=[UIImage imageNamed:@"账户"];
            }
//            } else  if (indexPath.row==1) {
//                cell.textLabel.text=@"申请历史";
//                cell.imageView.image=[UIImage imageNamed:@"卡包"];
//            }
            //            }else{
            //                cell.textLabel.text=@"设置";
            //                cell.imageView.image=[UIImage imageNamed:@"设置"];
            //            }

        }

            break;

        default: {
            cell.accessoryType=UITableViewCellAccessoryNone; //无右侧箭头
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //有箭头
            cell.textLabel.text=@"退出登录";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;//文字居中
            cell.textLabel.textColor = HexColor(0x333333);
           // cell.imageView.image=[UIImage imageNamed:@"setting_tuichu"];

        }

            break;
    }
    
    
    
    
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
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
                    //                    SD_Me_AccountController *accountVc=[[SD_Me_AccountController alloc]init];
                    //                    [self.navigationController pushViewController:accountVc animated:YES];
                }
                    break;
                    
                case 1: {
                    //                    SD_Me_CardInformationController * cardInfo=[[SD_Me_CardInformationController alloc] init];
                    //                    [self.navigationController pushViewController:cardInfo animated:YES];
                }
                    
                    break;
//                case 2: {
//                    //                    SD_Me_SettingController *SettingVc=[[SD_Me_SettingController alloc] init];
//                    //                    [self.navigationController pushViewController:SettingVc animated:YES];
//                }
                    
                    break;
            }
            break;
        }
        default:
        {
            [PX_UserDefaults removeObjectForKey:@"token"];
            [PX_UserDefaults synchronize];
            isLogin = NO;
            [self.navigationController popViewControllerAnimated:YES];
            [self.view makeToast:@"退出成功"];
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 24;
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//
//    return 0.01;
//
//}

@end
