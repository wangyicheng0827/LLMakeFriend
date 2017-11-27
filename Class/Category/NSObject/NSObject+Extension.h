//
//  NSObject+Extension.h
//  IndustryRegulation
//
//  Created by MrXir on 2016/10/11.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/*! addition 任意OC类型指针寄存器    */
@property (nonatomic, strong) id addition;

/*! 获取附加属性  */
- (id)addition;

/*! 寄存任意OC类型指针  */
- (void)setAddition:(id)addition;

@property (nonatomic, copy) NSString *key;
- (id)key;
- (void)setKey:(NSString *)key;


- (BOOL)hasLength;

@end
