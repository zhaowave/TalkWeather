//
//  WeatherViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WeatherViewController";
    // Do any additional setup after loading the view.
}

- (void) UIInitialize {
    _cityLabel = [[UILabel alloc] init];
    [self.view addSubview:_cityLabel];
    
    _statusLabel = [[UILabel alloc] init];
    [self.view addSubview:_statusLabel];
    
    _tempratureLabel = [[UILabel alloc] init];
    [self.view addSubview:_tempratureLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
