//
//  WeatherViewController.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, strong) UILabel *cityLabel;
@property(nonatomic, strong) UILabel *statusLabel;
@property(nonatomic, strong) UILabel *tempratureLabel;
@property(nonatomic, strong) UIImageView *statusImage;

@end
