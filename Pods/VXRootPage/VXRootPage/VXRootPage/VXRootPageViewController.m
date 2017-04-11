//
//  VXRootPage.m
//  VXRootPage
//
//  Created by voidxin on 17/4/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXRootPageViewController.h"

@interface VXRootPageViewController ()

@end
@implementation VXRootPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (instancetype)initWothObjectForRootPageViewController:(id)Object {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        NSArray *arr = (NSArray *)Object;
        for (UIViewController *vc in arr) {
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            nav.tabBarItem.title = vc.title;
            [self addChildViewController:vc];
        }
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
