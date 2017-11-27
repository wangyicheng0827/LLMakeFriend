//
//  MRAPPInfo.h
//  IndustryRegulation
//
//  Created by MrXir on 2016/11/30.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRAPPInfo : NSObject

+ (NSString *)bundleIdentifier;

+ (NSString *)bundleDisplayName;

+ (NSString *)version;

+ (NSString *)build;

@end
