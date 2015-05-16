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
- (IBAction)modalClick {
    ModalViewController *modalVC = [[ModalViewController alloc] init];
    CGRect frame = CGRectMake(50, 100, 200, 300);
    [self mk_presentViewController:modalVC WithPresentFrame:frame WithPresentAnimation:^NSTimeInterval(UIView *view) {
        // 动画部分
        view.transform =  CGAffineTransformMakeScale(1, 0);
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:5.0 options:UIViewAnimationOptionTransitionNone animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        } completion:nil];
        return 2;
    } AndDismissAnimation:^NSTimeInterval(UIView *view) {
        view.layer.anchorPoint = CGPointMake(0.5, 0);
        // 动画部分
        [UIView animateWithDuration:1 animations:^{
            view.transform = CGAffineTransformMakeScale(0.001, 0.001);
        } completion:nil];
        return 1.0;
    }];
}

@end
