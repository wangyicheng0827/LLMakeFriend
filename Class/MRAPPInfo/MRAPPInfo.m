//
//  MRAPPInfo.m
//  IndustryRegulation
//
//  Created by MrXir on 2016/11/30.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "MRAPPInfo.h"

@implementation MRAPPInfo

+ (NSDictionary *)information
{
    return [[NSBundle mainBundle] infoDictionary];
}

+ (NSString *)bundleIdentifier
{
    return [self information][@"CFBundleIdentifier"];
}

+ (NSString *)bundleDisplayName
{
    return [self information][@"CFBundleDisplayName"];
}

+ (NSString *)version
{
    return [self information][@"CFBundleShortVersionString"];
}

+ (NSString *)build
{
    return [self information][@"CFBundleVersion"];
}

@end
