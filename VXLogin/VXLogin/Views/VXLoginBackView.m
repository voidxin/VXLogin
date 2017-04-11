//
//  VXLoginBackView.m
//  VXLogin
//
//  Created by voidxin on 17/4/11.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXLoginBackView.h"

#define kTextFont [UIFont systemFontOfSize:15.f]
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface VXLoginBackView()
@property(nonatomic,strong)UIView *line;

@end

@implementation VXLoginBackView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
    }
    return self;
}

#pragma mark - addUI 
- (void)addUI {
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.userNameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.line];
    
    self.userNameTextField.frame = CGRectMake(10, 0, kWidth - 2 * 15 - 10, 49);
    self.line.frame = CGRectMake(0, CGRectGetMaxY(self.userNameTextField.frame) + 2, kWidth - 2 * 15, 1);
    self.passwordTextField.frame = CGRectMake(10, CGRectGetMaxY(self.line.frame),kWidth - 2 * 15 - 10, 49);
    
}

#pragma mark - getter
- (UITextField *)userNameTextField {
    if (!_userNameTextField) {
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.placeholder = @"用户名";
        _userNameTextField.font = kTextFont;
       
        
    }
    return _userNameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.secureTextEntry = true;
        _passwordTextField.font = kTextFont;
    }
    return _passwordTextField;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _line;
}

@end
