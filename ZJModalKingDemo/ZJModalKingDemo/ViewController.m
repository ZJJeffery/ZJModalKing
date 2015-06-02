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
    modalVc.view.backgroundColor = [UIColor colorWithRed:0.476 green:0.478 blue:1.000 alpha:1.000];
    modalVc.view.layer.cornerRadius = 20;
    modalVc.view.layer.masksToBounds = YES;
    CGRect frame = CGRectMake((self.view.frame.size.width - 250) * 0.5, (self.view.frame.size.height - 350) * 0.5, 250, 350);
    
    [self mk_presentViewControllerWithDummingView:modalVc withPresentFrame:frame withPresentAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 2.0;
        view.transform =  CGAffineTransformMakeTranslation(0, - self.view.frame.size.height + 350);

        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
            view.transform = CGAffineTransformMakeTranslation(0, 0);

        } completion:nil];
        return time;
    } withDismissAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 1;
        [UIView animateWithDuration:time animations:^{
            view.transform =  CGAffineTransformMakeTranslation(0, -3500);
        }];
        return time;
    } withCompletion:nil];
}

// 需要点击内部关闭按钮取消显示
- (IBAction)modalClick {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    
    [self mk_presentViewController:modalVC withPresentFrame:modalVC.view.bounds withPresentAnimation:^NSTimeInterval(UIView *view) {
        NSTimeInterval time = 2.0;
        view.transform = CGAffineTransformMakeTranslation(-view.bounds.size.width, view.bounds.size.height);
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:time delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
            view.transform = CGAffineTransformMakeTranslation(1, 1);
        } completion:nil];
        return time;
    } withDismissAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        NSTimeInterval time = 1;
        [UIView animateWithDuration:time animations:^{
            view.transform =  CGAffineTransformMakeTranslation(0, -3500);
        }];
        return time;
    } withCompletion:nil];
    
}
@end

