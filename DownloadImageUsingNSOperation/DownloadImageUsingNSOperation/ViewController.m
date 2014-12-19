//
//  ViewController.m
//  DownloadImageUsingNSOperation
//
//  Created by wildyao on 14/12/19.
//  Copyright (c) 2014年 Wild Yaoyao. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) DownloadOperation *operation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.operationQueue = [[NSOperationQueue alloc] init];
    
    // 1 ------------------------
    DownloadOperation *operation = [[DownloadOperation alloc] initWithURL:[NSURL URLWithString:@"http://ww3.sinaimg.cn/bmiddle/70e0a133gw1enez8l53eoj20cs0tkta7.jpg"] imageView:self.imageView];
    self.operation = operation;

    // 直接调用start,isConcurrent默认为NO,默认在当前线程执行
//    [self.operation start];
    // 添加到NSOperationQueue中，由NSOperationQueue底层维护的线程池自动启动线程的start操作
    [self.operationQueue addOperation:self.operation];
    
    
    // 2 ------------------------
//    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImageOperation:) object:@"http://ww1.sinaimg.cn/bmiddle/6e1068adgw1enexokvig6j20ui1gwn7i.jpg"];
//    [self.operationQueue addOperation:invocationOperation];

    
    
    // 3 ------------------------
//    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
//        
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/a4aae570jw1enf01hj3iwj20aw0gojt9.jpg"]];
//        UIImage *image = [UIImage imageWithData:data];
//        if (image) {
//            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
//        } else {
//            NSLog(@"下载失败");
//        }
//    }];
//    
//    [self.operationQueue addOperation:blockOperation];
    
    
    
    // 4 ------------------------
//    [self.operationQueue addOperationWithBlock:^{
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ww2.sinaimg.cn/bmiddle/7f6fbecdjw1emjmw7uzrlj218g18edjt.jpg"]];
//        UIImage *image = [UIImage imageWithData:data];
//        
//        if (image) {
//            [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
//        } else {
//            NSLog(@"下载失败");
//        }
//
//    }];
    
    
    // 5 ------------------------
//    NSString *urlString = @"http://ww1.sinaimg.cn/bmiddle/599ad67ajw1enezb0ovn5j20hs0hsmzz.jpg";
    // 1 -------------
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadImageOperation:) object:urlString];
    // 线程并没有真正运行，只是表示该进程可以运行了，何时运行取决于系统的调度
//    [thread start];
    // 2 -------------
//    [NSThread detachNewThreadSelector:@selector(downloadImageOperation:) toTarget:self withObject:urlString];
}

- (void)downloadImageOperation:(NSString *)urlString
{
    NSLog(@"current thread: %@", [NSThread currentThread]);
   
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    UIImage *image = [UIImage imageWithData:data];
    if (image) {
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
    } else {
        NSLog(@"下载失败");
    }
}

- (void)updateUI:(UIImage *)image
{
    self.imageView.image = image;
}

@end
