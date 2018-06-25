//
//  HSAddressPickerVC.h
//  HSPickerViewDemo
//
//  Created by husong on 2017/10/27.
//  Copyright © 2017年 husong. All rights reserved.
//

#import "HSBasePickerVC.h"
@class HSAddressPickerVC;

@protocol HSAddressPickerVCDelegate <NSObject>
-(void)addressPicker:(HSAddressPickerVC*)addressPicker
         selectedProvince:(NSString*)province
                     city:(NSString*)city
                     area:(NSString*)area;

@end

@interface HSAddressPickerVC : HSBasePickerVC
@property (nonatomic, weak) id<HSAddressPickerVCDelegate> delegate;
@end
