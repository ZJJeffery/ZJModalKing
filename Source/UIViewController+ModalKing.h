//
//  UIViewController+ModalKing.h
//  ModalKing
//
//  Created by Jiajun Zheng on 15/5/16.
//  Copyright (c) 2015年 hgProject. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJAnimationDelegate;
@interface UIViewController (ModalKing)
@property (nonatomic, strong) ZJAnimationDelegate *animationDelegate;
-(void)mk_presentViewController:(UIViewController *)modalVC WithPresentFrame:(CGRect)presentFrame WithPresentAnimation:(NSTimeInterval (^)(UIView *view))presentAnimation AndDismissAnimation:(NSTimeInterval (^)(UIView *view))dismissAnimation;
@end
