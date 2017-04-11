//
//  VXLoginViewController.m
//  VXLogin
//
//  Created by voidxin on 17/4/10.
//  Copyright © 2017年 voidxin. All rights reserved.
//

#import "VXLoginViewController.h"
#import <VXVXHomePageServiceProtocol/VXVXHomePageServiceProtocol.h>
#import <VXProtocolManager/VXProtocolManager.h>
#import <VXDataPageServiceProcotol/VXDataPageServiceProcotol.h>
#import <VXRootPageServiceProtocol/VXRootPageServiceProtocol.h>

#define kTextFont [UIFont systemFontOfSize:15.f]
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kBorderW 15
#define kTextFieldHeight 49
#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


@interface VXLoginViewController ()
@property(nonatomic,strong)UITextField *userNameTextField;
@property(nonatomic,strong)UITextField *passwordTextField;
@property(nonatomic,strong)UIButton *loginBtn;
@end

@implementation VXLoginViewController

- (instancetype)initLoginVC {
    self = [super init];
    if (self) {
        [self addUI];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   // [self addUI];
}


#pragma mark - addUI
- (void)addUI {
    self.view.backgroundColor = COLOR_WITH_RGB(240, 240, 240, 1);
    self.userNameTextField.frame = CGRectMake(0, 0, kWidth - 2 * kBorderW, kTextFieldHeight);
    self.userNameTextField.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5 - kTextFieldHeight);
    [self.view addSubview:self.userNameTextField];
    
    self.passwordTextField.frame = CGRectMake(kBorderW, CGRectGetMaxY(self.userNameTextField.frame) + 1, kWidth - 2 * kBorderW, kTextFieldHeight);
    [self.view addSubview:self.passwordTextField];
    
    self.loginBtn.frame = CGRectMake(kBorderW, CGRectGetMaxY(self.passwordTextField.frame) + 44, kWidth - 2 * kBorderW, kTextFieldHeight);
    [self.view addSubview:self.loginBtn];
}

#pragma mark - btnAction
- (void)loginBtnAction:(UIButton *)btn {
    
    id <VXVXHomePageServiceProtocol> homeProvide = [VXProtocolManager serviceProvideForProtocol:@protocol(VXVXHomePageServiceProtocol)];
    UIViewController *homePageVC = [homeProvide homepageViewControllerUserMessage:@"0110073"];
    homePageVC.title = @"homePage";
    homePageVC.tabBarItem.image = [UIImage imageNamed:@"tab_homePage_backimage_sl"];
    
    id <VXDataPageServiceProcotol> dataProvide = [VXProtocolManager serviceProvideForProtocol:@protocol(VXDataPageServiceProcotol)];
    UIViewController *dataPageVC = [dataProvide dataPageViewControllerWith:@"this is a title"];
    dataPageVC.title = @"dataPage";
    dataPageVC.tabBarItem.image = [UIImage imageNamed:@"business_select"];
    
    id <VXRootPageServiceProtocol> rootProvide = [VXProtocolManager serviceProvideForProtocol:@protocol(VXRootPageServiceProtocol)];
    NSArray *vcArr = @[homePageVC,dataPageVC];
    UIViewController *tabbarVC = [rootProvide rootPageViewControllerWith:vcArr];
    
    if (tabbarVC) {
        [self presentViewController:tabbarVC animated:YES completion:nil];
    }
    
}

#pragma mark - getter
- (UITextField *)userNameTextField {
    if (!_userNameTextField) {
        _userNameTextField = [[UITextField alloc] init];
        _userNameTextField.placeholder = @"用户名";
        _userNameTextField.font = kTextFont;
        _userNameTextField.backgroundColor = [UIColor whiteColor];
        _userNameTextField.layer.cornerRadius = 6;
        
    }
    return _userNameTextField;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.secureTextEntry = true;
        _passwordTextField.font = kTextFont;
        _passwordTextField.backgroundColor = [UIColor whiteColor];
        _passwordTextField.layer.cornerRadius = 6;
    }
    return _passwordTextField;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = kTextFont;
        [_loginBtn setBackgroundColor:[UIColor orangeColor]];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
