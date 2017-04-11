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
#import "VXLoginBackView.h"
#define kTextFont [UIFont systemFontOfSize:15.f]
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kBorderW 15
#define kTextFieldHeight 49
#define COLOR_WITH_RGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]


@interface VXLoginViewController ()
@property(nonatomic,strong)VXLoginBackView *backView;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIImageView *imageView;
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
    [self.view addSubview:self.backView];
    [self.view addSubview:self.imageView];
    
    self.backView.frame = CGRectMake(0, 0, kWidth - 2 * kBorderW, 101);
    self.backView.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5 - kTextFieldHeight);
    
    self.imageView.frame = CGRectMake(0, 0, 80, 80);
    self.imageView.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.25);
    
    self.loginBtn.frame = CGRectMake(kBorderW, CGRectGetMaxY(self.backView.frame) + 44, kWidth - 2 * kBorderW, kTextFieldHeight);
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
- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = kTextFont;
        [_loginBtn setBackgroundColor:[UIColor orangeColor]];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _loginBtn.layer.cornerRadius = 7;
    }
    return _loginBtn;
}

- (VXLoginBackView *)backView {
    if (!_backView) {
        _backView = [[VXLoginBackView alloc] init];
        _backView.layer.cornerRadius = 7;
        
    }
    return _backView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"Icon120"]];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
