//
//  PX_MC_BM_MyFootprintViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyFootprintViewController.h"

#import "PX_MC_BM_RecommendHandle.h"

#import "PX_MC_BM_RecommendBaseModel.h"
#import "PX_MC_BM_RecommendArrayDetailInfoModel.h"

#import "PX_MC_BM_RecommendTextCell.h"
#import "PX_MC_BM_RecommendTextImgCell.h"


@interface PX_MC_BM_MyFootprintViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *RecommendTableView;
@property (nonatomic,strong) NSMutableArray *dataListArray;
@property (nonatomic,assign) NSInteger pageNo;
@property (nonatomic,assign) BOOL hasMore;

@end

@implementation PX_MC_BM_MyFootprintViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的足迹";
//    //下拉
//    self.RecommendTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(makeTheTabDown:)];
    //上拉加载
    self.RecommendTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(makeTheTabUp:)];
    self.RecommendTableView.mj_footer.alpha = 0;
    self.pageNo = 1;
    [self PxHandleDataPage:self.pageNo];
}


#pragma mark --Drop-upLoadData
-(void)makeTheTabUp:(id)sender{
    if (self.hasMore) {
        [self.RecommendTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [self.RecommendTableView.mj_footer endRefreshing];
        [self PxHandleDataPage:++self.pageNo];
    }
}

- (void)PxHandleDataPage:(NSUInteger)page{
    if (!whetherHaveNetwork) {
        [self.view makeToastActivity:CSToastPositionCenter];
        [PX_MC_BM_RecommendHandle performaRecommendFamilyid:@"" Page:self.pageNo Limit:3 Success:^(id obj) {
            
            PX_MC_BM_RecommendBaseModel *model = obj;
            //            if (model.data.count == 0) {
            //                self.hasMore = YES;
            //            }
            if (model.data.count < 5) {
                self.hasMore = YES;
            }
            if (self.pageNo == 1) {
                [self.dataListArray removeAllObjects];
            }
            [self.dataListArray addObjectsFromArray:model.data];
            [self.RecommendTableView reloadData];
            [self.view hideToastActivity];
        } failure:^(id obj) {
            
        }];
    }else{
        [self.view makeToast:@"没有网络"];
    }
    
}


- (void)initUI{
    if (!_RecommendTableView) {
        _RecommendTableView = [PX_TC_CG_UIKitTool tableDelegate:self dataSource:self classCell:[PX_MC_BM_RecommendTextCell class] ider:@"PX_MC_BM_RecommendTextCell"];
        
        [_RecommendTableView registerClass:[PX_MC_BM_RecommendTextImgCell class] forCellReuseIdentifier:@"PX_MC_BM_RecommendTextImgCell"];
        
        //_RecommendTableView.separatorColor = [UIColor redColor];
        _RecommendTableView.separatorInset = UIEdgeInsetsMake(0,MarginSize, 0, MarginSize);
        _RecommendTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _RecommendTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT+44);
        _RecommendTableView.estimatedRowHeight = 90;
        _RecommendTableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_RecommendTableView];
    }
    
}

#pragma mark --TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataListArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PX_MC_BM_RecommendArrayDetailInfoModel * model = self.dataListArray[indexPath.item];
    
    if ([model.type isEqualToString:@"0"]){
        PX_MC_BM_RecommendTextCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_RecommendTextCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[PX_MC_BM_RecommendTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_RecommendTextCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        PX_MC_BM_RecommendArrayDetailInfoModel *RecommendArrayDetailInfoModel = [[PX_MC_BM_RecommendArrayDetailInfoModel alloc]init];
        RecommendArrayDetailInfoModel = self.dataListArray[indexPath.row];
        
        cell.model = RecommendArrayDetailInfoModel;
        return cell;
    }else{
        PX_MC_BM_RecommendTextImgCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_RecommendTextImgCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[PX_MC_BM_RecommendTextImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_RecommendTextImgCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        PX_MC_BM_RecommendArrayDetailInfoModel *RecommendArrayDetailInfoModel = [[PX_MC_BM_RecommendArrayDetailInfoModel alloc]init];
        RecommendArrayDetailInfoModel = self.dataListArray[indexPath.row];
        cell.model = RecommendArrayDetailInfoModel;
        return cell;
    }
    
}

//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//点击删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //在这里实现删除操作
    
    //删除数据，和删除动画
    [self.dataListArray removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
}





#pragma mark --Lazy
- (NSMutableArray *)dataListArray{
    
    if (!_dataListArray) {
        _dataListArray = [NSMutableArray array];
    }
    
    return _dataListArray;
}


@end
