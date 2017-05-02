//
//  MeViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "MeViewController.h"
#import "Masonry.h"
#import "MeTableViewDateSource.h"
#import "UIColor+HexString.h"
@interface MeViewController () {
    UITableView *tableView;
    MeTableViewDateSource *dataSource;
    UIView *loginView;
}

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLoginTabView];
    
    [self addTableView];
    
}

- (void) addLoginTabView {
    //login view
    loginView = [[UIView alloc] init];
    //33 a3 dc
    loginView.backgroundColor = [UIColor colorWithHexString:@"33a3dc"];
    [self.view addSubview:loginView];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(44);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
    }];
    //create 4 login button
    UIButton *phoneLoginBtn = [[UIButton alloc] init];
    [phoneLoginBtn setTitle:@"手机" forState:UIControlStateNormal];
    [phoneLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *wxLoginBtn = [[UIButton alloc] init];
    [wxLoginBtn setTitle:@"微信" forState:UIControlStateNormal];
    [wxLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *wbLoginBtn = [[UIButton alloc] init];
    [wbLoginBtn setTitle:@"微博" forState:UIControlStateNormal];
    [wbLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIButton *qqLoginBtn = [[UIButton alloc] init];
    [qqLoginBtn setTitle:@"QQ" forState:UIControlStateNormal];
    [qqLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginView addSubview:phoneLoginBtn];
    [loginView addSubview:wxLoginBtn];
    [loginView addSubview:wbLoginBtn];
    [loginView addSubview:qqLoginBtn];
//手机号登陆
    [phoneLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginView.mas_top).offset(40);
        make.left.equalTo(loginView.mas_left).offset((self.view.bounds.size.width - 300)/2);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    phoneLoginBtn.layer.cornerRadius = 30;
    phoneLoginBtn.backgroundColor = [UIColor whiteColor];
//微信登陆
    [wxLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(phoneLoginBtn.mas_right).offset(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    wxLoginBtn.layer.cornerRadius = 30;
    wxLoginBtn.backgroundColor = [UIColor whiteColor];
//微博登陆
    [wbLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(wxLoginBtn.mas_right).offset(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    wbLoginBtn.layer.cornerRadius = 30;
    wbLoginBtn.backgroundColor = [UIColor whiteColor];
//qq登陆
    [qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(wbLoginBtn.mas_right).offset(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    qqLoginBtn.layer.cornerRadius = 30;
    qqLoginBtn.backgroundColor = [UIColor whiteColor];
    
//登陆查看更多内容
    UILabel *loginMoreInfo = [[UILabel alloc] init];
    loginMoreInfo.text = @"登陆查看更多内容";
    loginMoreInfo.textColor = [UIColor whiteColor];
    
    [loginView addSubview:loginMoreInfo];
    
    [loginMoreInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_bottom).offset(10);
        make.left.equalTo(phoneLoginBtn.mas_right).offset(20);
        make.height.mas_equalTo(20);
    }];

    
    
    
}

-(void) addTableView {
    tableView = [[UITableView alloc] init];
    tableView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    [self.view addSubview:tableView];
    dataSource = [[MeTableViewDateSource alloc] init];
    tableView.dataSource = dataSource;
    tableView.delegate = dataSource;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginView.mas_bottom).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
        make.left.equalTo(loginView.mas_left).offset(0);
        make.right.equalTo(loginView.mas_right).offset(0);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
