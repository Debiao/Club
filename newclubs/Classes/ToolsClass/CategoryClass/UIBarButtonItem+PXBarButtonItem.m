//
//  UIBarButtonItem+PXBarButtonItem.m
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "UIBarButtonItem+PXBarButtonItem.h"

@implementation UIBarButtonItem (PXBarButtonItem)

+ (instancetype)barItem:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn = [PX_TC_CG_UIKitTool buttonImage:image title:title font:TextSize action:action titleColor:[UIColor blackColor] target:target];
    [btn sizeToFit];
    return [[self alloc] initWithCustomView:btn];
}

@end

