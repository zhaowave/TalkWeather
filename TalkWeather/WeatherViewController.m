//
//  WeatherViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherInfo.h"
#import "Masonry.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController
WeatherInfo *weatherInfo;
- (void)viewDidLoad {
    [super viewDidLoad];
    weatherInfo = [WeatherInfo weatherInfoBasic];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"天气";
    // Do any additional setup after loading the view.
    UILabel *leftBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    leftBarLabel.textColor = [UIColor redColor];
    leftBarLabel.text = weatherInfo.city;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarLabel];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    //self.navigationItem.rightBarButtonItem = rightItem;
    [self.navigationController.navigationBar setTintColor:[UIColor redColor] ];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgimg"]];
    bgView.frame = self.view.bounds;
    
    [self.view addSubview:bgView];
    
    
    [self UIInitialize];
    UIGestureRecognizer *ges = [[UIGestureRecognizer alloc] init];
    [ges addTarget:self action:@selector(tapGes)];
    [self.view addGestureRecognizer:ges];
    
}

- (void) addCity {
    NSLog(@"addVity");
}

- (void) tapGes {
    NSLog(@"...");
}

- (void) UIInitialize {
    _tempratureLabel = [[UILabel alloc] init];
    NSString *temp = [NSString stringWithFormat:@"%ld°C",(long)weatherInfo.temprature];
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:50]};
    _tempratureLabel.attributedText = [[NSAttributedString alloc] initWithString:temp attributes:dic];
    [self.view addSubview:_tempratureLabel];
    //
    //    WithFrame:CGRectMake(180, 30, 50, 50)
    _statusLabel = [[UILabel alloc] init];
    _statusLabel.text = weatherInfo.status;
    _statusLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_statusLabel];
    
    [_tempratureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.top.equalTo(self.view.mas_top).offset(30 + 20 + 20 + 20);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(50);
    }];
    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tempratureLabel.mas_right).offset(2);
        make.top.equalTo(_tempratureLabel.mas_top).offset(0);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) leftBarButtonItemClicked {
    NSLog(@"leftBarButtonItemClicked");
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
