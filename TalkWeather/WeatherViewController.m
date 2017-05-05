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

#define FRAMEWIDTH self.view.frame.size.width
#define FRAMEHEIGHT self.view.frame.size.height
@interface WeatherViewController ()

@end

@implementation WeatherViewController
WeatherInfo *weatherInfo;
WeatherInfo *todayWeatherInfo;

MBProgressHUD *MBHud;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"天气";
    UIButton *leftBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    [leftBarButton addTarget:self action:@selector(refreshWeatherInfo) forControlEvents:UIControlEventTouchUpInside];
    [leftBarButton setTitle:@"刷新" forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.navigationItem.leftBarButtonItem setEnabled:YES];
    [self.navigationController.navigationBar setTintColor:[UIColor redColor] ];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self UIInitialize];
    [self refreshWeatherInfo];
    
}

- (void) refreshWeatherInfo {
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
                //[MBHud hideAnimated:YES];
                _statusLabel.text = weatherInfo.status;
                _statusLabel.textColor = [UIColor whiteColor];
                
                NSString *temp = [NSString stringWithFormat:@"%ld°",(long)weatherInfo.temprature];
                NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"TimesNewRomanPSMT" size:70]};
                _tempratureLabel.attributedText = [[NSAttributedString alloc] initWithString:temp attributes:dic];
                NSString *imgURL = [NSString stringWithFormat:@"https://cdn.heweather.com/cond_icon/%@.png",weatherInfo.statusCode];
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
                [_statusImage setImage:[UIImage imageWithData:imageData]];
                [_statusLabel setNeedsDisplay];
                [_tempratureLabel setNeedsDisplay];
            }
            
        });
    }];
    
    [[WeatherServer sharedWeatherServer] getTodayBasicWeatherInfoWithBlock:^(WeatherInfo *info, NSError *error) {
        if (error) {
            NSLog(@"获取今日天气基本信息失败");
        }else {
            
        }
    }];
}

- (void) addCity {
    NSLog(@"addVity");
}

- (void) UIInitialize {
    //添加背景图
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgimg"]];
    bgView.frame = self.view.bounds;
    [self.view addSubview:bgView];
    //添加 透明 scrollView
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(44 + 22);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(self.view.mas_height);

    }];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    UIColor *color = [UIColor whiteColor];
    color = [color colorWithAlphaComponent:0];
    _scrollView.backgroundColor = color;
    //温度
    _tempratureLabel = [[UILabel alloc] init];
    _tempratureLabel.alpha = 1;
    [self.scrollView addSubview:_tempratureLabel];

    _statusLabel = [[UILabel alloc] init];
//    [self.view addSubview:_statusLabel];
    //天气状态图标
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
    
    [self todayAndTomorrowBasicWeatherInfoUI];
    
}

-(void) todayAndTomorrowBasicWeatherInfoUI {
    UIView *todayAndTomorrowInfoView = [[UIView alloc] init];
//    UIColor *color = [UIColor lightGrayColor];
//    color = [color colorWithAlphaComponent:0.5];
//    todayAndTomorrowInfoView.backgroundColor = color;
    todayAndTomorrowInfoView.alpha = 0.8;
    
    [_scrollView addSubview:todayAndTomorrowInfoView];
    [todayAndTomorrowInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_scrollView.mas_left).offset(0);
        make.top.equalTo(_scrollView.mas_top).offset(self.view.frame.size.height - 80 - 44 -44 -5);
        make.width.mas_equalTo(self.view.frame.size.width);
        make.height.mas_equalTo(80);
    }];
    //调用接口返回数据
    [[WeatherServer sharedWeatherServer] getTodayBasicWeatherInfoWithBlock:^(WeatherInfo *info, NSError *error) {
        todayWeatherInfo = info;
        
        UIView *todayView = [self basicWeatherInfoUI:@"今天"];
        [todayAndTomorrowInfoView addSubview:todayView];
        [todayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(todayAndTomorrowInfoView.mas_left).offset(0.2);
            make.top.equalTo(todayAndTomorrowInfoView.mas_top).offset(0);
            make.width.mas_equalTo(FRAMEWIDTH/2);
            make.height.mas_equalTo(60);
        }];
    }];
    
    
    [[WeatherServer sharedWeatherServer] getTomorrowBasicWeatherInfoWithBlock:^(WeatherInfo *info, NSError *error) {
        UIView *tomorrowView = [self basicWeatherInfoUI:@"明天"];
        [todayAndTomorrowInfoView addSubview:tomorrowView];
        [tomorrowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(todayAndTomorrowInfoView.mas_left).offset(1 + FRAMEWIDTH/2);
            make.top.equalTo(todayAndTomorrowInfoView.mas_top).offset(0);
            make.width.mas_equalTo(FRAMEWIDTH/2);
            make.height.mas_equalTo(60);
        }];
    }];  
    
}
-(UIView*) basicWeatherInfoUI:(NSString *)dayName {
    UIView *basicWeatherInfo = [[UIView alloc] init];
    basicWeatherInfo.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    basicWeatherInfo.backgroundColor = [UIColor lightGrayColor];
    //今天 或 明天
    UILabel *day = [[UILabel alloc] init];
    day.text = dayName;
    
    [basicWeatherInfo addSubview:day];
    [day mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(basicWeatherInfo.mas_left).offset(0);
        make.top.equalTo(basicWeatherInfo.mas_top).offset(0);
        make.width.mas_equalTo(FRAMEWIDTH/4);
        make.height.mas_equalTo(30);
    }];
    
    //最高/最低气温
    UILabel *highAndLowTmp = [[UILabel alloc] init];
    [basicWeatherInfo addSubview:highAndLowTmp];
    if ([dayName isEqual:@"今天"]) {
        highAndLowTmp.text = [NSString stringWithFormat:@"%ld/%ld°C",(long)todayWeatherInfo.maxTmp,(long)todayWeatherInfo.minTmp];
        highAndLowTmp.textAlignment = NSTextAlignmentRight;
    } else {
    
    }
    
    
    [highAndLowTmp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(day.mas_right).offset(0);
        make.top.equalTo(day.mas_top);
        make.width.mas_equalTo(FRAMEWIDTH/4);
        make.height.equalTo(day.mas_height);
    }];
    //天气状况
    UILabel *status = [[UILabel alloc] init];
    if ([dayName isEqual:@"今天"]) {
        status.text = todayWeatherInfo.status;
    } else {
        
    }
    [basicWeatherInfo addSubview:status];
    
    [status mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(day.mas_left);
        make.top.equalTo(day.mas_bottom);
        make.width.mas_equalTo(day.mas_width);
        make.height.mas_equalTo(day.mas_height);
    }];
    //状况图标
    UIImageView *statusImgView = [[UIImageView alloc] init];
    [basicWeatherInfo addSubview:statusImgView];
    if ([dayName isEqual:@"今天"]) {
        NSString *imgURL = [NSString stringWithFormat:@"https://cdn.heweather.com/cond_icon/%@.png",todayWeatherInfo.statusCode];
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
        [statusImgView setImage:[UIImage imageWithData:imageData]];
    } else {
    
    }
    [statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(highAndLowTmp.mas_right);
        make.top.mas_equalTo(highAndLowTmp.mas_bottom);
        make.width.mas_equalTo(day.mas_height);
        make.height.mas_equalTo(day.mas_height);
    }];
    return basicWeatherInfo;
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
