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
- (void) getHourlyWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block;
@end
