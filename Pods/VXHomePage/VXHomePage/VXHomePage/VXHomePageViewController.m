//
//  VXHomePageViewController.m
//  VXHomePage
//
//  Created by voidxin on 17/4/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXHomePageViewController.h"

@interface VXHomePageViewController ()

@end

@implementation VXHomePageViewController
- (instancetype)initWithHomepageViewControllerUserMessage:(id)userModel {
    self = [super init];
    if (self) {
         [self addUI];
    }
    return  self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)addUI {
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"this is home page";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, 200, 100);
    label.backgroundColor = [UIColor orangeColor];
    label.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
