//
//  WeatherViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherInfo.h"
#import "WeatherServer.h"
#import "Masonry.h"
#import "MBProgressHUD.h"

@interface WeatherViewController ()

@end

@implementation WeatherViewController
WeatherInfo *weatherInfo;
MBProgressHUD *MBHud;
- (void)viewDidLoad {
    [super viewDidLoad];
    //weatherInfo = [WeatherInfo weatherInfoBasic];


    [[WeatherServer sharedWeatherServer] getHourlyWeatherInfoWithBlock:^(WeatherInfo *info,NSError *error) {
        weatherInfo = info;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                //弹出提示框，网络数据返回异常
                MBHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                [MBHud showAnimated:YES];
                MBHud.label.text = @"天气数据加载中";
                [MBHud hideAnimated:YES afterDelay:3];
            } else {
                [MBHud hideAnimated:YES];
                _statusLabel.text = weatherInfo.status;
                _statusLabel.textColor = [UIColor whiteColor];
                
                NSString *temp = [NSString stringWithFormat:@"%ld°",(long)weatherInfo.temprature];
                NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"TimesNewRomanPSMT" size:70]};
                _tempratureLabel.attributedText = [[NSAttributedString alloc] initWithString:temp attributes:dic];
                NSString *imgURL = [NSString stringWithFormat:@"https://cdn.heweather.com/cond_icon/%@.png",weatherInfo.status];
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
                [_statusImage setImage:[UIImage imageWithData:imageData]];
                [_statusLabel setNeedsDisplay];
                [_tempratureLabel setNeedsDisplay];
            }

        });
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"天气";
    // Do any additional setup after loading the view.
    UILabel *leftBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    leftBarLabel.textColor = [UIColor redColor];
    leftBarLabel.text = @"北京";
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
    
}

- (void) addCity {
    NSLog(@"addVity");
}

- (void) UIInitialize {
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(44 + 22);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(self.view.mas_height);

    }];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    //_scrollView.backgroundColor = [UIColor redColor];
    UIColor *color = [UIColor whiteColor];
    color = [color colorWithAlphaComponent:0];
    _scrollView.backgroundColor = color;
    //_scrollView.alpha = 0.1;
    
    _tempratureLabel = [[UILabel alloc] init];
    _tempratureLabel.alpha = 1;
    [self.scrollView addSubview:_tempratureLabel];

    _statusLabel = [[UILabel alloc] init];
//    [self.view addSubview:_statusLabel];
    
    _statusImage = [[UIImageView alloc] init];
    _statusImage.alpha = 1;
    [self.scrollView addSubview:_statusImage];
    
    [_tempratureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView.mas_left).offset(20);
        make.top.equalTo(self.scrollView.mas_top).offset(20 + 20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
//    [_statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_tempratureLabel.mas_right).offset(2);
//        make.top.equalTo(_tempratureLabel.mas_top).offset(0);
//        make.width.mas_equalTo(40);
//        make.height.mas_equalTo(20);
//    }];
    
    [_statusImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tempratureLabel.mas_right).offset(2);
        make.top.equalTo(self.tempratureLabel.mas_top).offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
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
