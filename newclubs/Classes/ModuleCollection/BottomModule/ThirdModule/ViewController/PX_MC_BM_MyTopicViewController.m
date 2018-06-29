//
//  PX_MC_BM_MyTopicViewController.m
//  newclubs
//
//  Created by sundebiao on 2018/6/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_MyTopicViewController.h"
#import "PX_MC_BM_MyTopicTableViewCell.h"
#import "PX_MC_BM_TM_MyInfoHandle.h"
#import "PX_MC_BM_MyTopicBaseModel.h"

@interface PX_MC_BM_MyTopicViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *pxTableView;
@property (nonatomic,strong) NSMutableArray *dataListArray;
@end

@implementation PX_MC_BM_MyTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"历史话题";
    [self PxHandleData];
   
    // Do any additional setup after loading the view.
}

-(void)PxHandleData{
    if (!whetherHaveNetwork) {
        [PX_MC_BM_TM_MyInfoHandle performaTopicHistoryType:3 Page:1 Success:^(id obj) {
            [self.view makeToastActivity:CSToastPositionCenter];
            PX_MC_BM_MyTopicBaseModel *model = obj;
            [self.dataListArray removeAllObjects];
            [self.dataListArray addObjectsFromArray:model.data];
            [self.pxTableView reloadData];
            [self performSelector:@selector(delayMethodHideToastActivity) withObject:nil afterDelay:0.5];
        } failure:^(id obj) {
            [self.view makeToast:@"请求出错"];
        }];
        
    }else{
        [self.view makeToast:@"没有网络"];
    }
    
}

- (void)delayMethodHideToastActivity{
    [self.view hideToastActivity];
}
- (void)initUI{
    if (!_pxTableView) {
        
        _pxTableView = [PX_TC_CG_UIKitTool tableDelegate:self dataSource:self classCell:[PX_MC_BM_MyTopicTableViewCell class] ider:@"nil"];
        [_pxTableView registerClass:[PX_MC_BM_MyTopicTableViewCell class] forCellReuseIdentifier:@"PX_MC_BM_MyTopicTableViewCell"];
        _pxTableView.separatorInset = UIEdgeInsetsMake(0,MarginSize, 0, MarginSize);
        _pxTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _pxTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT);
        _pxTableView.estimatedRowHeight = 90;
        _pxTableView.rowHeight = UITableViewAutomaticDimension;
         self.pxTableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:_pxTableView];
    }
    
}

#pragma mark --TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataListArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PX_MC_BM_MyTopicTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_MyTopicTableViewCell" forIndexPath:indexPath];
    
        if (!cell) {
            cell = [[PX_MC_BM_MyTopicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_MyTopicTableViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        PX_MC_BM_MyTopicModel *TopicModel = [[PX_MC_BM_MyTopicModel alloc]init];
        TopicModel = self.dataListArray[indexPath.row];
        cell.model = TopicModel;
        return cell;
}

#pragma mark --Lazy
- (NSMutableArray *)dataListArray{
    
    if (!_dataListArray) {
        _dataListArray = [NSMutableArray array];
    }
    
    return _dataListArray;
}


@end
