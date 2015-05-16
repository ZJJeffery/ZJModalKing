//
//  ViewController.m
//  ZJModalKingDemo
//
//  Created by Jiajun Zheng on 15/5/16.
//  Copyright (c) 2015年 hgProject. All rights reserved.
//

#import "ViewController.h"
#import <ZJModalKing/UIViewController+ModalKing.h>
#import "ModalViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 有dumming界面的跳转可以通过点击非跳转界面进行关闭
- (IBAction)modalWithDummingClick {
    UIViewController *modalVc = [[UIViewController alloc] init];
    modalVc.view.backgroundColor = [UIColor blueColor];
    CGRect frame = CGRectMake(50, 100, 200, 300);
    
    [self mk_presentViewControllerWithDummingView:modalVc withPresentFrame:frame withPresentAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 2.0;
        view.transform =  CGAffineTransformMakeScale(1, 0);
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        } completion:nil];
        return time;
    } withDismissAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 1.0;
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time animations:^{
            view.transform =  CGAffineTransformMakeScale(1, 0.01);
        }];
        return time;
    } withCompletion:nil];
}

// 需要点击内部关闭按钮取消显示
- (IBAction)modalClick {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    CGRect frame = CGRectMake(50, 100, 200, 300);
    
    [self mk_presentViewController:modalVC withPresentFrame:frame withPresentAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 2.0;
        view.transform =  CGAffineTransformMakeScale(1, 0);
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        } completion:nil];
        return time;
    } withDismissAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 1.0;
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time animations:^{
            view.transform =  CGAffineTransformMakeScale(1, 0.01);
        }];
        return time;
    } withCompletion:nil];
    
}

@end
