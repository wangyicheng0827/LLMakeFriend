//
//  NSObject+Extension.m
//  IndustryRegulation
//
//  Created by MrXir on 2016/10/11.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "NSObject+Extension.h"

#import <objc/runtime.h>


@implementation NSObject (Extension)


@dynamic addition;
- (id)addition
{
    return objc_getAssociatedObject(self, @"addition");
}

- (void)setAddition:(id)addition
{
    objc_setAssociatedObject(self, @"addition", addition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic key;
- (id)key
{
    return objc_getAssociatedObject(self, @"key");
}

- (void)setKey:(NSString *)key
{
    objc_setAssociatedObject(self, @"key", key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hasLength
{
    if ([self respondsToSelector:@selector(length)]) {
        return [self performSelector:@selector(length)] > 0;
    } else {
        return NO;
    }
}

@end
