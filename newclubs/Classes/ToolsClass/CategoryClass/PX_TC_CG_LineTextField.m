//
//  PX_TC_CG_LineTextField.m
//  newclubs
//
//  Created by sundebiao on 2018/5/29.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_CG_LineTextField.h"

@implementation PX_TC_CG_LineTextField

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, PXLINECOLOR.CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 1 , CGRectGetWidth(self.frame), 1));
}

@end
