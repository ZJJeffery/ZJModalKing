//
//  ModalViewController.m
//  ModalKing
//
//  Created by Jiajun Zheng on 15/5/16.
//  Copyright (c) 2015年 hgProject. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
@property (nonatomic, weak) UIButton *closeBtn;
@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.366 green:0.660 blue:1.000 alpha:1.000];
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"Dismiss" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(closeClick) forControlEvents:UIControlEventTouchUpInside];
    self.closeBtn = btn;
    [self.view addSubview:btn];
}


-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.closeBtn.frame = CGRectMake(40, 80, 80, 40);
}

-(void)closeClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@",self.view);
}


@end
