//
//  WeatherViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherInfo.h"
@interface WeatherViewController ()

@end

@implementation WeatherViewController
WeatherInfo *weatherInfo;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WeatherViewController";
    // Do any additional setup after loading the view.
    weatherInfo = [WeatherInfo weatherInfoBasic];
    [self UIInitialize];
    
    
}

- (void) UIInitialize {
    _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
    _cityLabel.text = weatherInfo.city;
    [self.view addSubview:_cityLabel];
    
    _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    _statusLabel.text = weatherInfo.status;
    [self.view addSubview:_statusLabel];
    [UIColor redColor];
    _tempratureLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    NSString *temp = [NSString stringWithFormat:@"%ld",(long)weatherInfo.temprature];
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor redColor]};
    _tempratureLabel.attributedText = [[NSAttributedString alloc] initWithString:temp attributes:dic];
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
