//
//  NSDate+Extension.h
//  IndustryRegulation
//
//  Created by MrXir on 2016/10/15.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

+ (NSDate *)fromDate:(NSDate *)date after:(NSInteger)days;

+ (NSDate *)fromDate:(NSDate *)date front:(NSInteger)days;

/**
 *  @author MrXir, 16-09-07 16:09
 *
 *  @brief yyyy-MM-dd
 */
- (NSString *)formattedDateLike:(NSString *)format;

@end
