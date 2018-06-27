//
//  HSChooseWhetherVC.h
//  newclubs
//
//  Created by a on 2018/6/27.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "HSBasePickerVC.h"
@class HSChooseWhetherVC;

@protocol HSChooseWhetherVCDelegate <NSObject>
-(void)ChooseWhether:(HSChooseWhetherVC*)choosewhether
    selectedIs:(NSString*)is State:(NSInteger)state;
@end

@interface HSChooseWhetherVC : HSBasePickerVC
@property (nonatomic, weak) id<HSChooseWhetherVCDelegate> delegate;
@end
