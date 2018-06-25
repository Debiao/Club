//
//  PX_MC_BM_CircleViewController.m
//  newclubs
//
//  Created by a on 2018/5/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_CircleViewController.h"


#import "PX_BC_NavigationViewController.h"
#import "PX_UM_LoginViewController.h"
#import "SDCycleScrollView.h"
#import "PX_MC_BM_CircleHandle.h"
#import "PX_MC_BM_CircleTextCell.h"
#import "PX_MC_BM_CircleFamilyDetailModel.h"

#import "PX_MC_BM_CircleBaseModel.h"
#import "PX_TC_CG_TopPicDownTextButton.h"
#import "PX_MC_BM_CircleArrayDetailInfoModel.h"

#import "PX_MC_BM_CreateCircleViewController.h"

#import "PX_BC_NavigationViewController.h"


@interface PX_MC_BM_CircleViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView *bannerScrollView;
@property (nonatomic,strong) NSArray *imageUrlArray;

@property (nonatomic,strong) UITableView *circleTableView;
@property (nonatomic,strong) NSMutableArray *dataListArray;
@property (nonatomic,assign) NSInteger pageNo;
@property (nonatomic,assign) BOOL hasMore;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIView *headerView;

@property (nonatomic,strong)  UIView *searchView;

@property (nonatomic,strong)  UIButton *btnTopic;

@property (nonatomic,strong) UIView  *refreshBgV;


@end

@implementation PX_MC_BM_CircleViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_searchView setHidden:NO];
    [_btnTopic setHidden:NO];
  

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_searchView setHidden:YES];
    [_btnTopic setHidden:YES];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.circleTableView reloadData];
    [self PxHandleData];
   
  

}
- (void)delayMethodHideToastActivity{
     [self.view hideToastActivity];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    _imageUrlArray = @[
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529471573380&di=eac0d551398f1b12549cb47d4c7e60e2&imgtype=0&src=http%3A%2F%2Fimage.tianjimedia.com%2FuploadImages%2F2014%2F064%2F459704ZL3VFN.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529471573378&di=186056f35a5e4abddc6728f70b9afdab&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F151006%2F14-151006114S1135.jpg",
                       @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1529471607797&di=c8164d6bc79c0b569ba84ddc169ac110&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Ff9dcd100baa1cd11ecf55a03b312c8fcc3ce2d55.jpg"
                       ];
    
    self.title = @"";
    [self drawView];
    [self bannerScrollView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    
   // NSLog(@"@@@%@",[PX_UserDefaults objectForKey:@"token"]);
  
    [self PxNavInitUI];
    
}


//nav
-(void)PxNavInitUI{
    _searchView = [[UIView alloc]initWithFrame:CGRectMake(MarginSize/2, 5, SCREEN_WIDTH-60, 30)];
    [_searchView setBackgroundColor:HexColorA(0xBEBEBE, 0.5)];
    _searchView.layer.cornerRadius = 8;
    _searchView.layer.masksToBounds = YES;
    [self.navigationController.navigationBar addSubview:_searchView];
    
    UILabel *labText = [PX_TC_CG_UIKitTool lableFont:12 textColor:PXWHITECOLOR text:@"搜索你喜欢的圈子吧"];
    
    [_searchView addSubview:labText];
    
    [labText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchView);
        make.centerX.mas_equalTo(self.searchView);
        make.height.mas_equalTo(self.searchView);
        make.width.mas_equalTo(self.searchView.mas_width).offset(-MarginSize*4);
    }];

   _btnTopic = [PX_TC_CG_TopPicDownTextButton buttonWithType:UIButtonTypeCustom];
    [_btnTopic setTitle:@"创建" forState:UIControlStateNormal];
    _btnTopic.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [_btnTopic setTitleColor:PXMAJORCOLOR forState:UIControlStateNormal];
    [_btnTopic setImage:[UIImage imageNamed:@"my2"] forState:UIControlStateNormal];
    _btnTopic.adjustsImageWhenHighlighted = NO;
    [_btnTopic addTarget:self action:@selector(btnTopicClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationController.navigationBar addSubview:_btnTopic];
    
    [_btnTopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.searchView);
        make.height.mas_equalTo(self.searchView).offset(-MarginSize/2);
        make.right.lessThanOrEqualTo(self.navigationController.navigationBar.mas_right);
    }];
    
    
}

- (void)btnTopicClick:(UIButton *)sender{
    PX_MC_BM_CreateCircleViewController *CreateCircleVc = [[PX_MC_BM_CreateCircleViewController alloc]init];
   // PX_BC_NavigationViewController *CreateCircleNav = [[PX_BC_NavigationViewController alloc]initWithRootViewController:CreateCircleVc];
    [self.navigationController pushViewController:CreateCircleVc animated:NO];
}

- (void)PxHandleData{
 if (!whetherHaveNetwork) {
    [self.view makeToastActivity:CSToastPositionCenter];
    [PX_MC_BM_CircleHandle performaCircleSuccess:^(id obj) {
        PX_MC_BM_CircleBaseModel *model = obj;
        [self.dataListArray removeAllObjects];
        [self.dataListArray addObjectsFromArray:model.data];
        [self.circleTableView reloadData];
         [self performSelector:@selector(delayMethodHideToastActivity) withObject:nil afterDelay:0.5];
    } failure:^(id obj) {
       [self.view makeToast:@"请求出错"];
    }];
 }else{
     [self.view makeToast:@"没有网络"];
 }
}


- (void)drawView
{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT/4)];
    _topView.backgroundColor = [UIColor redColor];
    
    self.headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT/4)];
    self.circleTableView.tableHeaderView = _topView;
}


- (void)initUI{
    
    if (!_circleTableView) {
        _circleTableView = [PX_TC_CG_UIKitTool tableDelegate:self dataSource:self classCell:[PX_MC_BM_CircleTextCell class] ider:@"PX_MC_BM_CircleTextCell"];

        _circleTableView.backgroundColor = PXWHITECOLOR;
        //
//        _circleTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        _circleTableView.delegate = self;
//        _circleTableView.dataSource = self;
//
//        [_circleTableView registerClass:[PX_MC_BM_CircleTextCell class] forCellReuseIdentifier:@"PX_MC_BM_CircleTextCell"];
        
        _circleTableView.separatorInset = UIEdgeInsetsMake(0,MarginSize, 0, MarginSize);
        _circleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _circleTableView.frame = CGRectMake(0, -64, SCREEN_WIDTH, SCREENH_HEIGHT-49);
        _circleTableView.estimatedRowHeight = 90;
        _circleTableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_circleTableView];
    }
    
}
#pragma mark --TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataListArray.count;

}

// 设置分区头部文字
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(MarginSize/2, MarginSize/2, SCREEN_WIDTH, 20)];
    lab.font = [UIFont fontWithName:@"PingFangSC-Light" size:12.f];
    lab.text = @"我创建的圈子";
    lab.textColor = PXTEXTCOLOR;
    [view addSubview:lab];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PX_MC_BM_CircleTextCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_CircleTextCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[PX_MC_BM_CircleTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_CircleTextCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    PX_MC_BM_CircleArrayDetailInfoModel *CircleDetailmodel= [[PX_MC_BM_CircleArrayDetailInfoModel alloc]init];
    CircleDetailmodel = self.dataListArray[indexPath.row];
    cell.model = CircleDetailmodel;
   
    return cell;
   
}
#pragma mark -- Banner
- (SDCycleScrollView *)bannerScrollView {
    if (!_bannerScrollView) {
        [_bannerScrollView clearCache];
        _bannerScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT/4) delegate:self placeholderImage:[UIImage imageNamed:@"bg-login@4x"]];
        _bannerScrollView.imageURLStringsGroup = _imageUrlArray;
        _bannerScrollView.showPageControl = YES;//显示pageControl控件
        _bannerScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _bannerScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _bannerScrollView.currentPageDotColor = PXMAJORCOLOR;
        _bannerScrollView.pageDotColor = PXWHITECOLOR;
        _bannerScrollView.autoScrollTimeInterval = 3;
        _bannerScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;//防止图片变形
        [self.topView addSubview:_bannerScrollView];
    }
    return _bannerScrollView;
}

#pragma mark - 滑动隐藏导航栏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>0) {
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        float currentAlpha = (scrollView.contentOffset.y + 64) / (float)(52 + 64);
        UIColor *color = PXWHITECOLOR;
        UIImage *image = [self imageWithColor:[color colorWithAlphaComponent:currentAlpha]];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:image];
    }else{
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

        UIColor *color = PXWHITECOLOR;
        UIImage *image = [self imageWithColor:[color colorWithAlphaComponent:0]];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:image];
    }
        if (self.circleTableView.contentOffset.y <= 0) {
            self.circleTableView.bounces = NO;
    
            NSLog(@"禁止下拉");
        }
        else
            if (self.circleTableView.contentOffset.y >= 0){
                self.circleTableView.bounces = YES;
                NSLog(@"允许上拉");
    
            }
    
}
#pragma mark --Lazy
- (NSMutableArray *)dataListArray{
    if (!_dataListArray) {
        _dataListArray = [NSMutableArray array];
    }
    return _dataListArray;
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
