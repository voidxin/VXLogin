//
//  VXVXLoginServiceProvide.m
//  VXLogin
//
//  Created by voidxin on 17/4/11.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXLoginServiceProvide.h"
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXLoginServiceProtocol/VXLoginServiceProtocol.h>
#import "VXLoginViewController.h"
@interface VXLoginServiceProvide()<VXLoginServiceProtocol>
@end

@implementation VXLoginServiceProvide

+ (void)load {
    [VXProtocolManager registServiceProvide:[self new] forProtocol:@protocol(VXLoginServiceProtocol)];
}

- (UIViewController *)loginPageWithObject:(id)object {
    VXLoginViewController *loginVC = [[VXLoginViewController alloc] initLoginVC];
    return loginVC;
}
@end
