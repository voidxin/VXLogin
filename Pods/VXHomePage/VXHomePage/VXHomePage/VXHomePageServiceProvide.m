//
//  VXHomePageServiceProvide.m
//  VXHomePage
//
//  Created by voidxin on 17/4/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXHomePageServiceProvide.h"
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXVXHomePageServiceProtocol/VXVXHomePageServiceProtocol.h>
#import "VXHomePageViewController.h"
@interface VXHomePageServiceProvide()<VXVXHomePageServiceProtocol>
@end
@implementation VXHomePageServiceProvide
+ (void)load {
    [VXProtocolManager registServiceProvide:[[self alloc] init] forProtocol:@protocol(VXVXHomePageServiceProtocol)];
}
- (UIViewController *)homepageViewControllerUserMessage:(id)userModel {
    VXHomePageViewController *homePageVC = [[VXHomePageViewController alloc] initWithHomepageViewControllerUserMessage:@"01110077"];
    return homePageVC;
}

@end
