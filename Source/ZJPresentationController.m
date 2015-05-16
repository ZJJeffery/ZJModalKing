//
//  ZJPresentationController.m
//  ModalKing
//
//  Created by Jiajun Zheng on 15/5/16.
//  Copyright (c) 2015年 hgProject. All rights reserved.
//

#import "ZJPresentationController.h"

@implementation ZJPresentationController
-(void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    self.presentedView.frame = self.presentFrame;
}




@end
