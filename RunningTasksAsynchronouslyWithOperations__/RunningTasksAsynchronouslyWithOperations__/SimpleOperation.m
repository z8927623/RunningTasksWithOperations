//
//  SimpleOperation.m
//  CustomOperation
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "SimpleOperation.h"

@interface SimpleOperation ()
{
    BOOL executing;
    BOOL finished;
}

@property (nonatomic, strong) NSObject *givenObject;

@end

@implementation SimpleOperation

- (instancetype)init
{
    // 默认初始化函数
    return [self initWithObject:@123];
}

- (instancetype)initWithObject:(NSObject *)paramObject
{
    self = [super init];
    if (self != nil) {
        _givenObject = paramObject;
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
                
                NSLog(@"Parameter Object = %@", _givenObject);
                NSLog(@"Main Thread: %@", [NSThread mainThread]);
                NSLog(@"Current Thread: %@", [NSThread currentThread]);
                
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
    return YES;
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
