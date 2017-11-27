//
//  ZYHeader.h
//  taiwubroker
//
//  Created by aliviya on 17/5/22.
//  Copyright © 2017年 房途信息科技. All rights reserved.
//

#ifndef ZYHeader_h
#define ZYHeader_h



#endif /* ZYHeader_h */
//#import "UIView+Extention.h"

#define WeakSelf __weak typeof(self) weakSelf = self;
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || [str isEqualToString: @"(null)"] || str == nil || [str length] < 1 ? YES : NO )
#define FTColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(1)]

#define ButtonHRatio 1/7.0

#define PopViewH MAX(240, self.view.height / 2)

#define textFieldH MAX(45, KSCreenHeight * (50.0/667.0))
#define textFieldW 180
#define FTGlobalBg FTColor(230, 230, 230) // 全局背景 淡灰色

#define FTGrayCover FTColor(163,163,163) // 灰色遮板
#define FTGray FTColor(234,234,234) // 灰色
#define FTCoverBlack [FTBlack colorWithAlphaComponent:0.4] //遮盖颜色


#define FTBlack FTColor(60,60,60) //   黑色
#define FTFontBlack FTColor(51,51,51) //   黑色

#define FTDarkGray FTColor(120,120,120) //  深灰色     未选择字体的颜色
#define FTLightGray FTColor(180,180,180) // 浅灰色   tableview 的背景色
#define FTLightLightGray FTColor(221,221,221) // 很浅灰色
#define FTWhiteGray FTColor(250,250,250)  //白灰色   一搬灰色 通常 按钮的灰色和导航栏灰色
#define FTWhite [UIColor whiteColor]
#define FTGreen  FTColor(97,193,191)   //绿色
#define FTRed  FTColor(225,45,36)   //红色

#define FTBlue FTColor(118,189,255)     //蓝色


#define kFont(x) ([UIFont systemFontOfSize:x])
#define bFont(x) ([UIFont boldSystemFontOfSize:x])

#define FontLargeBig     16.f
#define FontBig    14.6f
#define FontMiddle    13.2f
#define FontSmall     12.5f

#define KScreenWidth    [UIScreen mainScreen].bounds.size.width
#define KSCreenHeight   [UIScreen mainScreen].bounds.size.height


#define KX   KScreenWidth/375
#define KY   KSCreenHeight/667




