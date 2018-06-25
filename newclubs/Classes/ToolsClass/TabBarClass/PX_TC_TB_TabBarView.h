//
//  PX_TC_TB_TabBarView.h
//  newclubs
//
//  Created by a on 2018/5/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PX_TC_TB_TabBarView;

typedef void(^PX_TabBarBlock)(PX_TC_TB_TabBarView *tab,NSUInteger inde);

@protocol PX_TC_TB_TabBarViewDelegate <NSObject>

-(void)tabbar:(PX_TC_TB_TabBarView *)tabbar seletexIndex:(NSUInteger)index;

@end

@interface PX_TC_TB_TabBarView : UIView

@property(nonatomic, weak) id<PX_TC_TB_TabBarViewDelegate>delegate;
@property (nonatomic, copy) PX_TabBarBlock block;
@property (nonatomic, strong) UIButton *firstButton;
- (void)itemClick:(id)sender;
@end








