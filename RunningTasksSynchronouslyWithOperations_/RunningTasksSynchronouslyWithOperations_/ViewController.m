//
//  ViewController.m
//  RunningTasksSynchronouslyWithOperations_
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "ViewController.h"
#import "CountingOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) CountingOperation *simpleOperation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.simpleOperation = [[CountingOperation alloc] initWithStartingCount:0
                                                                endingCount:10000];
    self.operationQueue = [[NSOperationQueue alloc] init];
    [self.simpleOperation start];
//    [self.operationQueue addOperation:self.simpleOperation];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(10, 10, 300, 80);
    [button setTitle:@"Cancel" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)cancel:(id)sender
{
    [self.simpleOperation cancel];
    //    [self.operationQueue cancelAllOperations];
}

@end
