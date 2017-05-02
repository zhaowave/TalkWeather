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
#define LOGINBUTTONSIZE 40
#define SPACEBETWEENBTN 20
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
    //[self.navigationController setNavigationBarHidden:YES];
    
    [self addLoginTabView];
    
    [self addMainTableView];
    
}

- (void) addLoginTabView {
    //login view
    loginView = [[UIView alloc] init];
    loginView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:loginView];
    [loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(44);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.equalTo(self.view.mas_width);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.2);
    }];
    //create 4 login button
    UIButton *phoneLoginBtn = [[UIButton alloc] init];
    UIButton *wxLoginBtn = [[UIButton alloc] init];
    UIButton *wbLoginBtn = [[UIButton alloc] init];
    UIButton *qqLoginBtn = [[UIButton alloc] init];
    [loginView addSubview:phoneLoginBtn];
    [loginView addSubview:wxLoginBtn];
    [loginView addSubview:wbLoginBtn];
    [loginView addSubview:qqLoginBtn];
//手机号登陆
    [phoneLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginView.mas_top).offset(50);
        make.left.equalTo(loginView.mas_left).offset((self.view.bounds.size.width - (LOGINBUTTONSIZE*4 + SPACEBETWEENBTN*3))/2);
        make.width.mas_equalTo(LOGINBUTTONSIZE);
        make.height.mas_equalTo(LOGINBUTTONSIZE);
    }];
    phoneLoginBtn.layer.cornerRadius = LOGINBUTTONSIZE/2;
    phoneLoginBtn.backgroundColor = [UIColor greenColor];
//微信登陆
    [wxLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(phoneLoginBtn.mas_right).offset(SPACEBETWEENBTN);
        make.width.mas_equalTo(LOGINBUTTONSIZE);
        make.height.mas_equalTo(LOGINBUTTONSIZE);
    }];
    wxLoginBtn.layer.cornerRadius = LOGINBUTTONSIZE/2;
    wxLoginBtn.backgroundColor = [UIColor redColor];
//微博登陆
    [wbLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(wxLoginBtn.mas_right).offset(SPACEBETWEENBTN);
        make.width.mas_equalTo(LOGINBUTTONSIZE);
        make.height.mas_equalTo(LOGINBUTTONSIZE);
    }];
    wbLoginBtn.layer.cornerRadius = LOGINBUTTONSIZE/2;
    wbLoginBtn.backgroundColor = [UIColor whiteColor];
//qq登陆
    [qqLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_top).offset(0);
        make.left.equalTo(wbLoginBtn.mas_right).offset(SPACEBETWEENBTN);
        make.width.mas_equalTo(LOGINBUTTONSIZE);
        make.height.mas_equalTo(LOGINBUTTONSIZE);
    }];
    qqLoginBtn.layer.cornerRadius = LOGINBUTTONSIZE/2;
    qqLoginBtn.backgroundColor = [UIColor yellowColor];
    
//登陆查看更多内容
    UILabel *loginMoreInfo = [[UILabel alloc] init];
    loginMoreInfo.text = @"登陆查看更多内容";
    loginMoreInfo.textColor = [UIColor whiteColor];
    
    [loginView addSubview:loginMoreInfo];
    
    [loginMoreInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneLoginBtn.mas_bottom).offset(15);
        make.left.equalTo(phoneLoginBtn.mas_right).offset(5);
        make.height.mas_equalTo(20);
    }];

    
    
    
}

-(void) addMainTableView {
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
