//
//  PX_TC_TB_TabBarView.m
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_TB_TabBarView.h"

@interface PX_TC_TB_TabBarView()

@property (nonatomic, strong) UIImageView *tabbarBackImageView;

@property (nonatomic, strong) NSArray *dataListArray;

@property (nonatomic, strong) NSArray *seletedListArray;

@property (nonatomic, strong) NSArray *dataListTxetArray;

@property (nonatomic, strong) UIButton *lastItemButton;


@end


@implementation PX_TC_TB_TabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        // 背景图片
       //[self addSubview:self.tabbarBackImageView];
        
        for (int i = 0; i < self.dataListArray.count; i++) {
            
            UIButton *item = [self creatBtnImage:self.dataListArray[i] seletedImage:self.seletedListArray[i] titleText:self.dataListTxetArray[i] action:@selector(itemClick:)];
            
            item.tag = 100 + i;
            
            if (i == 0){
                item.selected = YES;
                self.lastItemButton = item;
                self.firstButton = item;
            }
            [self addSubview:item];
        }
    }
    return  self;
}


#pragma mark - event
#pragma mark 点击事件
- (void)itemClick:(UIButton *)sender
{
        if ([self.delegate respondsToSelector:@selector(tabbar:seletexIndex:)]) {
            [self.delegate tabbar:self seletexIndex:sender.tag];
        }
    
        !self.block?:self.block(self,sender.tag);
    
        if (sender.tag == 10) {
            return;
        }

        // 改变按钮状态
        self.lastItemButton.selected = NO;
        sender.selected = YES;
        self.lastItemButton = sender;
  
}

#pragma mark - method
#pragma mark creatBnt
- (UIButton *)creatBtnImage:(NSString *)iamge seletedImage:(NSString *)seleImage titleText:(NSString *)title action:(SEL)action
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:iamge] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:seleImage] forState:UIControlStateSelected];
    [btn setImage:[UIImage imageNamed:seleImage] forState:UIControlStateSelected | UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:PXBLACKCOLOR forState:UIControlStateNormal];
    [btn setTitleColor:PXMAJORCOLOR forState:UIControlStateSelected];
    [btn setTitleColor:PXMAJORCOLOR forState:UIControlStateSelected | UIControlStateHighlighted];
     btn.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
//    btn.backgroundColor = [UIColor redColor];
//    btn.layer.cornerRadius = btn.bounds.size.width / 2;
//    btn.layer.masksToBounds = YES;
//    btn.center = self.center;
    
    return btn;
}


// 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
  
    CGFloat w = self.bounds.size.width / self.dataListArray.count;
    self.tabbarBackImageView.frame = self.bounds;    
    for (NSInteger i = 0; i < [self subviews].count; i ++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]){
            
            btn.frame = CGRectMake((btn.tag - 100) * w, 0, w, self.height);
            CGSize imageSize = ((UIButton *)btn).imageView.frame.size;
            CGSize titleSize = ((UIButton *)btn).titleLabel.frame.size;
            ((UIButton *)btn).titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -imageSize.height, 0.0);
            ((UIButton *)btn).imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height,0.0,0.0 ,-titleSize.width);
        }
    }
    
}

- (CGFloat)height {
    return self.frame.size.height;
}

#pragma mark - lazy
- (UIImageView *)tabbarBackImageView
{
    if (!_tabbarBackImageView) {
        _tabbarBackImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_back"]];
    }
    return _tabbarBackImageView;
}

- (NSArray *)dataListArray
{
    if (!_dataListArray) {
        _dataListArray = @[@"recommend1",@"family1",@"my1"];
    }
    return  _dataListArray;
}

- (NSArray *)seletedListArray
{
    if (!_seletedListArray) {
        _seletedListArray = @[@"recommend2",@"family2",@"my2"];
    }
    return _seletedListArray;
}

- (NSArray *)dataListTxetArray{
    if (!_dataListTxetArray) {
        _dataListTxetArray = @[@"推荐",@"圈子",@"我的"];
        
    }
    return _dataListTxetArray;
}

@end
