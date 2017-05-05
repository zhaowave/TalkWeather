//
//  WeatherServer.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/3.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WeatherInfo;

typedef void(^GetHourlyWeatherInfoBlock)(WeatherInfo *info,NSError *error);

@interface WeatherServer : NSObject

+ (instancetype) sharedWeatherServer;
//获取小时之内的天气信息
- (void) getHourlyWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block;
//获取当日基本天气信息
- (void) getTodayBasicWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block;
//获取明日基本天气信息
- (void) getTomorrowBasicWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block;
@end
