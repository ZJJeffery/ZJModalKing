//
//  UIViewController+ModalKing.m
//  ModalKing
//
//  Created by Jiajun Zheng on 15/5/16.
//  Copyright (c) 2015年 hgProject. All rights reserved.
//

#import "UIViewController+ModalKing.h"

#import <objc/runtime.h>
#import "ZJAnimationDelegate.h"

@implementation UIViewController (ModalKing)

const void *animationDelegateKey = "animationDelegate";

- (void)setAnimationDelegate:(ZJAnimationDelegate *)animationDelegate {
    
    /**
     参数：
     1. 属性的持有者
     2. 属性的键值
     3. 属性的数值
     4. 属性的引用类型
     */
    objc_setAssociatedObject(self, animationDelegateKey, animationDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZJAnimationDelegate *)animationDelegate {
    return objc_getAssociatedObject(self, animationDelegateKey);
}

-(void)mk_presentViewController:(UIViewController *)modalVC WithPresentFrame:(CGRect)presentFrame WithPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation AndDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation{
    self.animationDelegate = [ZJAnimationDelegate new];
    modalVC.transitioningDelegate = self.animationDelegate;
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animationDelegate.presentFrame = presentFrame;
    self.animationDelegate.presentAnimation = presentAnimation;
    self.animationDelegate.dismissAnimation = dismissAnimation;
    [self presentViewController:modalVC animated:YES completion:nil];
}

@end
