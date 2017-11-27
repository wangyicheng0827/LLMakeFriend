//
//  MacroDefinition.h
//  CarAuthentication
//
//  Created by Vampire on 15/8/7.
//  Copyright (c) 2015年 MrXir. All rights reserved.
//

#ifndef CarAuthentication_MacroDefinition_h
#define CarAuthentication_MacroDefinition_h

#pragma mark - 实例对象

#define UIImageNamed(A) [UIImage imageNamed:(A)]

#pragma mark - 计算

#define MRRadian(D) (D) * M_PI / 180.0f

#pragma mark - 系统版本

#define __MRIOSVERSION__    [[UIDevice currentDevice] systemVersion].floatValue*10000

#define MRIOS2          __MRIOSVERSION__  ==  __IPHONE_2_0
#define MRIOS3          __MRIOSVERSION__  ==  __IPHONE_3_0
#define MRIOS4          __MRIOSVERSION__  ==  __IPHONE_4_0
#define MRIOS5          __MRIOSVERSION__  ==  __IPHONE_5_0
#define MRIOS6          __MRIOSVERSION__  ==  __IPHONE_6_0
#define MRIOS7          __MRIOSVERSION__  ==  __IPHONE_7_0
#define MRIOS8          __MRIOSVERSION__  ==  __IPHONE_8_0

#define MRIOS2andLater  __MRIOSVERSION__  >=  __IPHONE_2_0
#define MRIOS3andLater  __MRIOSVERSION__  >=  __IPHONE_3_0
#define MRIOS4andLater  __MRIOSVERSION__  >=  __IPHONE_4_0
#define MRIOS5andLater  __MRIOSVERSION__  >=  __IPHONE_5_0
#define MRIOS6andLater  __MRIOSVERSION__  >=  __IPHONE_6_0
#define MRIOS7andLater  __MRIOSVERSION__  >=  __IPHONE_7_0
#define MRIOS8andLater  __MRIOSVERSION__  >=  __IPHONE_8_0

#define MRLessIOS2      __MRIOSVERSION__  <  __IPHONE_2_0
#define MRLessIOS3      __MRIOSVERSION__  <  __IPHONE_3_0
#define MRLessIOS4      __MRIOSVERSION__  <  __IPHONE_4_0
#define MRLessIOS5      __MRIOSVERSION__  <  __IPHONE_5_0
#define MRLessIOS6      __MRIOSVERSION__  <  __IPHONE_6_0
#define MRLessIOS7      __MRIOSVERSION__  <  __IPHONE_7_0
#define MRLessIOS8      __MRIOSVERSION__  <  __IPHONE_8_0

//数据空类型处理
#define VALUE(obj) [obj isKindOfClass:[NSNull class]]? @"":obj

#pragma mark - 主屏幕宽高
#define kAl_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define kAL_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#endif
