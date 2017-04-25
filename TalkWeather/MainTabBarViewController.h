//
//  MainTabBarViewController.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MeViewController;
@class WeatherViewController;

@interface MainTabBarViewController : UITabBarController
@property (strong, nonatomic) WeatherViewController          *weatherViewcontrller;
@property (strong, nonatomic) MeViewController              *meViewcontroller;
@end
