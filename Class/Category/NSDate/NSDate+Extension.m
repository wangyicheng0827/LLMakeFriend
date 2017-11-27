//
//  NSDate+Extension.m
//  IndustryRegulation
//
//  Created by MrXir on 2016/10/15.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSDate *)fromDate:(NSDate *)date after:(NSInteger)days
{
    NSTimeInterval interval = 86400 * days;
    
    return [date initWithTimeIntervalSinceNow:+ interval];
}

+ (NSDate *)fromDate:(NSDate *)date front:(NSInteger)days
{
    NSTimeInterval interval = 86400 * days;
    
    return [date initWithTimeIntervalSinceNow:- interval];
}

- (NSString *)formattedDateLike:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    formatter.dateFormat = format;
    
    return [formatter stringFromDate:self];
}

- (void)dateFromString
{
    // eg:
//    NSString *string = @"2016-10-27";
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *date = [dateFormatter dateFromString:string];

}

@end
