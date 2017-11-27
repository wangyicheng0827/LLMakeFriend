//
//  Utilit.h
//  LLMakeFriend
//
//  Created by xiaoqi on 2017/11/25.
//  Copyright © 2017年 佳鹤  陈. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import <UIKit/UIKit.h>

// 普通日志开关
#define MREnable_MRLogn 1

// 详细日志开关
#define MREbable_MRLogc 1

// 错误日志开关
#define MREnable_MRLoge 1

/**
 普通日志
 */
#define MRLogn(format,...) MREnable_MRLogn ? NSLog(@" | [COMMON] %@", [NSString stringWithFormat:(format), ##__VA_ARGS__]) : NULL

/**
 详细日志
 */
#define MRLogd(format,...) MREbable_MRLogd ? NSLog(@"\
\n\
/*================================[DETAIL]===============================\n\
class    : %@\n\
selector : %s\n\
line     : %d\n\
content  : %@\n\
========================================================================*/\n\
\n",\
[self class],\
__FUNCTION__,\
__LINE__,\
[NSString stringWithFormat:(format), ##__VA_ARGS__]) : NULL

/**
 错误日志
 */
#define MRLoge(format,...) MREnable_MRLoge ? NSLog(@" | [ERROR!!] %@", [NSString stringWithFormat:(format), ##__VA_ARGS__]) : NULL

@interface Utilit : NSObject

@end
