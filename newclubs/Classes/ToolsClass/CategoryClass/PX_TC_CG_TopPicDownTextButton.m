//
//  PX_TC_CG_TopPicDownTextButton.m
//  newclubs
//
//  Created by sundebiao on 2018/6/11.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#import "PX_TC_CG_TopPicDownTextButton.h"

@implementation PX_TC_CG_TopPicDownTextButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if(self.titleLabel.text && self.imageView.image)
    {
        CGFloat marginH = (self.frame.size.height - self.imageView.frame.size.height - self.titleLabel.frame.size.height)/2.5;
        
        //图片
        CGPoint imageCenter = self.imageView.center;
        imageCenter.x = self.frame.size.width/2;
        imageCenter.y = self.imageView.frame.size.height/2 + marginH;
        self.imageView.center = imageCenter;
        
        //文字
        CGRect newFrame = self.titleLabel.frame;
        newFrame.origin.x = 0;
        newFrame.origin.y = self.frame.size.height - newFrame.size.height - marginH;
        newFrame.size.width = self.frame.size.width;
        self.titleLabel.frame = newFrame;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}


@end
