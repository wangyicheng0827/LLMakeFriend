//
//  UIButton+Extension.m
//  RepairEnterprises
//
//  Created by MrXir on 16/7/21.
//  Copyright © 2016年 MrXir. All rights reserved.
//

#import "UIButton+Extension.h"

#import <objc/runtime.h>

static NSInteger _count = 0;

static NSInteger _index = 0;

static BOOL _isCounting = NO;

static NSTimer *_timer = nil;

@implementation UIButton (Extension)

- (void)setTouchUpInsideBlock:(TouchUpInsideBlock)touchUpInsideBlock
{
    objc_setAssociatedObject(self, @"touchUpInsideBlock", touchUpInsideBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TouchUpInsideBlock)touchUpInsideBlock
{
    return objc_getAssociatedObject(self, @"touchUpInsideBlock");
}

- (void)didTouchUpInsideComplectionBlock:(TouchUpInsideBlock)touchUpInsideBlock
{
    
    [self setTouchUpInsideBlock:touchUpInsideBlock];
    
    if ([[self actionsForTarget:self forControlEvent:UIControlEventTouchUpInside] count] > 0) {
        
        [self removeTarget:self action:@selector(performTouchUpInsideBlock) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self addTarget:self action:@selector(performTouchUpInsideBlock) forControlEvents:UIControlEventTouchUpInside];
}

- (void)performTouchUpInsideBlock
{
    if (self.touchUpInsideBlock) self.touchUpInsideBlock(self);
}

- (BOOL)isCounting
{
    return _isCounting;
}

- (void)countDownAction:(NSTimer *)timer
{
    TimerCycleEndBlock endBlock = objc_getAssociatedObject(self, @"cycleEndBlock");
    
    TimerEveryJumpBlock jumpBlock = objc_getAssociatedObject(self, @"everyJumpBlock");
    
    _index -= 1;
    
    if (_index <= 0) {
        
        _index = _count;
        
        _isCounting = NO;
        [timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
        
        if (endBlock) {
            endBlock(self, timer, _index, _count);
        }
        
    } else {
        
        if (jumpBlock) {
            jumpBlock(self, timer, _index, _count);
        }
        
    }
    
    
}

- (void)dealloc
{
    // 长按 text field 会销毁我，不知为何。

    if (_timer) {
        MRLogn(@"i have timer %@ %@", self, _timer);
        _isCounting = NO;
        [_timer setFireDate:[NSDate distantFuture]];
        [_timer invalidate];
        _timer = nil;
    }
    
}

- (void)timerTicktockWithTimerWithTimeInterval:(NSTimeInterval)ti
                                         count:(NSInteger)count
                                everyJumpBlock:(TimerEveryJumpBlock)jumpBlock
                                 cycleEndBlock:(TimerCycleEndBlock)endBlock
{
    
    
    objc_setAssociatedObject(self, @"everyJumpBlock", jumpBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    objc_setAssociatedObject(self, @"cycleEndBlock", endBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!_timer) {
        
        _count = count;
        
        _index = _count;
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(countDownAction:) userInfo:nil repeats:YES];
        
        _isCounting = YES;
        
    }
}

- (void)beginIndicating
{
    [self setEnabled:NO];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    [indicator startAnimating];
    indicator.hidesWhenStopped = YES;
    [self addSubview:indicator];
    
    if ([self titleForState:UIControlStateNormal] && [self backgroundColor] && indicator) {
        
        objc_setAssociatedObject(self, @"titleAndColor", @{@"title": [self titleForState:UIControlStateNormal],
                                                           @"color": [self backgroundColor],
                                                           @"indicator": indicator},
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    
    
    
    [self setTitle:@"" forState:UIControlStateNormal];
    //[self setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
}

- (void)stopIndicating
{
    [self setEnabled:YES];
    
    NSDictionary *titleAndColor = objc_getAssociatedObject(self, @"titleAndColor");
    [self setTitle:titleAndColor[@"title"] forState:UIControlStateNormal];
    //[self setBackgroundColor:titleAndColor[@"color"]];
    [titleAndColor[@"indicator"] removeFromSuperview];
}

- (void)becomeInactionStateWithColor:(UIColor *)colorOrNil
{
    [self setEnabled:NO];
    
    UIColor *backgroundColor = objc_getAssociatedObject(self, @"bgc");
    
    if (!backgroundColor) {
        objc_setAssociatedObject(self, @"bgc", [self backgroundColor], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    if (!colorOrNil) {
        [self setBackgroundColor:[UIColor colorWithWhite:0.902 alpha:1.000]];
    } else {
        [self setBackgroundColor:colorOrNil];
    }
    
}

- (void)becomeActionState
{
    [self setEnabled:YES];
    
    UIColor *backgroundColor = objc_getAssociatedObject(self, @"bgc");
    
    [self setBackgroundColor:backgroundColor];
    
}

@end
