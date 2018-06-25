//
//  PX_TC_MC_BaseHeader.h
//  newclubs
//
//  Created by a on 2018/5/22.
//  Copyright © 2018年 angelo.px. All rights reserved.
//

#ifndef PX_TC_MC_BaseHeader_h
#define PX_TC_MC_BaseHeader_h


// 屏幕宽高
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
// TabBar高度
#define TabBar_Height 49


// NavBar高度
#define NavBar_State_Height 64
// State
#define State_Height 22
//边距
#define MarginSize 15
//上边距
#define TopMarginSize 10

//\字体大小
#define TextFont(a) [UIFont systemFontOfSize:a]


//输入框字大小
#define TextSize 17.f
#define ContentTextSize 14.f
#define TFHEIGH SCREENH_HEIGHT*0.07
#define CONTENTWIDTH SCREEN_WIDTH - 30

//本地存
#define PX_UserDefaults [NSUserDefaults standardUserDefaults]

//获取单利
#define PX_ApplicationDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])


//十六进制颜色值
#define HexColor(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1]

#define HexColorA(hexColor,a) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:a]

#define RGBCOLOR(HEX)   [UIColor colorWithRed:((((HEX)>>16)&0xFF))/255. green:((((HEX)>>8)&0xFF))/255.  blue:((((HEX)>>0)&0xFF))/255. alpha:1]

// 注册cell
#define REGISCLASSCELL(view,cell,ide) [view registerClass:[cell class] forCellReuseIdentifier:ide];
#define REGISNIBCELL(view,cell,ide) [view registerNib:[UINib nibWithNibName:cell bundle:nil] forCellReuseIdentifier:ide];

/**
 Synthsize a weak or strong reference.
 
 Example:
 @weakify(self)
 [self doSomething^{
 @strongify(self)
 if (!self) return;
 ...
 }];
 
 */
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif


#endif /* PX_TC_MC_BaseHeader_h */
