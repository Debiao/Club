//
//  UIBarButtonItem+PXBarButtonItem.h
//  newclubs
//
//  Created by a on 2018/5/24.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PXBarButtonItem)
+ (instancetype)barItem:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action;
@end
