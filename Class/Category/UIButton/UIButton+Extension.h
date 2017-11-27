//
//  UIButton+Extension.h
//  RepairEnterprises
//
//  Created by MrXir on 16/7/21.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TouchUpInsideBlock)(UIButton *button);

typedef void(^TimerCycleStartBlock)(UIButton *button, NSTimer *timer, NSInteger index, NSInteger count);
typedef void(^TimerEveryJumpBlock)(UIButton *button, NSTimer *timer, NSInteger index, NSInteger count);
typedef void(^TimerCycleEndBlock)(UIButton *button, NSTimer *timer, NSInteger index, NSInteger count);

@interface UIButton (Extension)

- (void)didTouchUpInsideComplectionBlock:(TouchUpInsideBlock)touchUpInsideBlock;

- (void)timerTicktockWithTimerWithTimeInterval:(NSTimeInterval)ti
                                         count:(NSInteger)count
                                everyJumpBlock:(TimerEveryJumpBlock)jumpBlock
                                 cycleEndBlock:(TimerCycleEndBlock)endBlock;

- (void)beginIndicating;
- (void)stopIndicating;

- (void)becomeInactionStateWithColor:(UIColor *)colorOrNil;
- (void)becomeActionState;

- (BOOL)isCounting;

@end
