//
//  VXRootPageServiceProvide.m
//  VXRootPage
//
//  Created by voidxin on 17/4/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXRootPageServiceProvide.h"
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXRootPageServiceProtocol/VXRootPageServiceProtocol.h>
#import "VXRootPageViewController.h"
@interface  VXRootPageServiceProvide()<VXRootPageServiceProtocol>

@end

@implementation VXRootPageServiceProvide
+ (void)load
{
    [VXProtocolManager registServiceProvide:[self new] forProtocol:@protocol(VXRootPageServiceProtocol)];
}

- (UIViewController *)rootPageViewControllerWith:(id)Object {
    VXRootPageViewController *rootVC = [[VXRootPageViewController alloc] initWothObjectForRootPageViewController:Object];
    return rootVC;
}
@end
