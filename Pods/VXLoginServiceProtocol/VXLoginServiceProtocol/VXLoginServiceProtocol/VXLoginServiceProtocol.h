//
//  VXLoginServiceProtocol.h
//  VXLoginServiceProtocol
//
//  Created by voidxin on 17/4/11.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol VXLoginServiceProtocol <NSObject>
- (UIViewController *)loginPageWithObject:(id)object;
@end
