//
//  CountingOperation.m
//  RunningTasksSynchronouslyWithOperations_
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "CountingOperation.h"

@interface CountingOperation ()
{
    BOOL executing;
    BOOL finished;
}

@property (nonatomic, assign) NSUInteger startingCount;
@property (nonatomic, assign) NSUInteger endingCount;

@end

@implementation CountingOperation

- (instancetype)init
{
    // 默认初始化函数
    return [self initWithStartingCount:0
                           endingCount:1000];
}

- (instancetype)initWithStartingCount:(NSUInteger)paramStartingCount
                          endingCount:(NSUInteger)paramEndingCount
{
    self = [super init];
    if (self != nil) {
        _startingCount = paramStartingCount;
        _endingCount = paramEndingCount;
    }
    
    return self;
}

- (void)start
{
    if (self.isCancelled) {
        
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        
        return;
    } else {
        [self willChangeValueForKey:@"isExecuting"];
        executing = YES;
        [self didChangeValueForKey:@"isExecuting"];
        
        [self main];
    }
}

- (void)main
{
    @try {
        @autoreleasepool {
            
            BOOL taskIsFinished = NO;
            
            while (!taskIsFinished && !self.isCancelled) {
                
                NSLog(@"Main Thread: %@", [NSThread mainThread]);
                NSLog(@"Current Thread: %@", [NSThread currentThread]);
                
                NSUInteger counter = _startingCount;
                for (counter = _startingCount; counter < _endingCount && !self.isCancelled; counter++) {
                    NSLog(@"Count = %lu", (unsigned long)counter);
                }
                
                taskIsFinished = YES;
            }
            
            [self willChangeValueForKey:@"isFinished"];
            [self willChangeValueForKey:@"isExecuting"];
            
            finished = YES;
            executing = NO;
            
            [self didChangeValueForKey:@"isFinished"];
            [self didChangeValueForKey:@"isExecuting"];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
    }
}

// isConcurrent是标识这个Operation是否是并发执行的，这里曾经是个坑，如果你没有实现isConcurrent，默认是返回NO，那么你的NSOperation就不是并发执行而是串行执行的，不过在iOS5.0和OS X10.6之后，已经会默认忽略这个返回值
- (BOOL)isConcurrent
{
    return NO;
}

- (BOOL)isFinished
{
    return finished;
}

- (BOOL)isExecuting
{
    return executing;
}

@end
