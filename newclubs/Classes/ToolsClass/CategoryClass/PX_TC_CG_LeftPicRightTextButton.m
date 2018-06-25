//
//  PX_TC_CG_LeftPicRightTextButton.m
//  newclubs
//
//  Created by sundebiao on 2018/6/21.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_CG_LeftPicRightTextButton.h"

@implementation PX_TC_CG_LeftPicRightTextButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect titleF = self.titleLabel.frame;
    CGRect imageF = self.imageView.frame;
    titleF.origin.x = 13.0f;
    titleF.origin.y = 5.0f;
    self.titleLabel.frame = titleF;
    imageF.origin.x = CGRectGetMaxX(titleF);
    self.imageView.frame = imageF;
}

@end
