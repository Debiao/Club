//
//  PX_MC_BM_RecommendSeSecondViewController.m
//  newclubs
//
//  Created by a on 2018/7/6.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_MC_BM_RecommendSeSecondViewController.h"
#import "PX_MC_BM_RecommendSecondTextCell.h"
#import "PX_MC_BM_RecommendSecondArrayDataModel.h"
#import "PX_MC_BM_RecommendSecondBaseModel.h"
#import "PX_MC_BM_RecommendHandle.h"
#import "PX_MC_BM_RecommendSecondTextCell.h"

#import "PX_MC_BM_RecommendSecondZeroTextCell.h"
#import "PX_MC_BM_RecommendSecondZeroTextImgCell.h"



@interface PX_MC_BM_RecommendSeSecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *pxTableView;
@property (nonatomic,strong) NSMutableArray *pxDataListArray,*textCellDataListArray;
@property (nonatomic,assign) NSInteger pageNo;
@property (nonatomic,assign) BOOL hasMore;

@end

@implementation PX_MC_BM_RecommendSeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"话题";
//    NSLog(@"棒槌%@",_id_str);
    self.pageNo = 1;
    [self PxHandleDataPage:self.pageNo];
    
}

- (void)PxHandleDataPage:(NSUInteger)page{
    if (!whetherHaveNetwork) {
        [self.view makeToastActivity:CSToastPositionCenter];
        [PX_MC_BM_RecommendHandle performaRecommendSecondTid:_id_str Page:1 Success:^(id obj) {
            
            PX_MC_BM_RecommendSecondBaseModel *model = obj;
            
            [self.pxDataListArray addObjectsFromArray:model.data];
            [self.pxTableView reloadData];
             [self.view hideToastActivity];
        } failure:^(id obj) {
        [self.view makeToast:@"请求出现问题"];
        }];
       
    }else{
        [self.view makeToast:@"没有网络"];
    }
    
}



- (void)initUI{
    if (!_pxTableView) {
        _pxTableView = [PX_TC_CG_UIKitTool tableDelegate:self dataSource:self classCell:[PX_MC_BM_RecommendSecondTextCell class] ider:@"PX_MC_BM_RecommendSecondTextCell"];
        
        [_pxTableView registerClass:[PX_MC_BM_RecommendSecondZeroTextCell class] forCellReuseIdentifier:@"PX_MC_BM_RecommendSecondZeroTextCell"];
        
        [_pxTableView registerClass:[PX_MC_BM_RecommendSecondZeroTextImgCell class] forCellReuseIdentifier:@"PX_MC_BM_RecommendSecondZeroTextImgCell"];
        
        //_RecommendTableView.separatorColor = [UIColor redColor];
        _pxTableView.separatorInset = UIEdgeInsetsMake(0,MarginSize, 0, MarginSize);
        _pxTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        _pxTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT+44);
        _pxTableView.estimatedRowHeight = 90;
        _pxTableView.rowHeight = UITableViewAutomaticDimension;
        [self.view addSubview:_pxTableView];
    }
    
}

#pragma mark --TableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.pxDataListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        if ([self.strType isEqualToString:@"0"]){
            PX_MC_BM_RecommendSecondZeroTextCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_RecommendSecondZeroTextCell" forIndexPath:indexPath];
            if (!cell) {
                cell = [[PX_MC_BM_RecommendSecondZeroTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_RecommendSecondZeroTextCell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;

            [cell.imgAuthoravatar sd_setImageWithURL:[NSURL URLWithString:self.strLogo]];
            cell.labLastauthorname.text = self.strLastauthorname;
            cell.labTitle.text = self.strTitle;
            cell.labCreattime.text = self.strCreattime;
       
            return cell;
        }else{
            PX_MC_BM_RecommendSecondZeroTextImgCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_RecommendSecondZeroTextImgCell" forIndexPath:indexPath];
            if (!cell) {
                cell = [[PX_MC_BM_RecommendSecondZeroTextImgCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_RecommendSecondZeroTextImgCell"];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.labLastauthorname.text = self.strLastauthorname;
            cell.labTitle.text = self.strTitle;
            cell.labCreattime.text = self.strCreattime;
            [cell.imgAuthoravatar sd_setImageWithURL:[NSURL URLWithString:self.strLogo]];
            [cell.imgValue sd_setImageWithURL:[NSURL URLWithString:self.strPic]];
            return cell;
        }

    }else{
    
        PX_MC_BM_RecommendSecondTextCell * cell=[tableView dequeueReusableCellWithIdentifier:@"PX_MC_BM_RecommendSecondTextCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[PX_MC_BM_RecommendSecondTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PX_MC_BM_RecommendSecondTextCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        PX_MC_BM_RecommendSecondArrayDataModel *dataModel = [[PX_MC_BM_RecommendSecondArrayDataModel alloc]init];
        dataModel = self.pxDataListArray[indexPath.row];
        cell.model = dataModel;
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
}

#pragma mark --Lazy
- (NSMutableArray *)pxDataListArray{
    if (!_pxDataListArray) {
        _pxDataListArray = [NSMutableArray array];
    }
    
    return _pxDataListArray;
}
- (NSMutableArray *)textCellDataListArray{
    if (!_textCellDataListArray) {
        _textCellDataListArray = [NSMutableArray array];
    }
    return _textCellDataListArray;
}


@end
