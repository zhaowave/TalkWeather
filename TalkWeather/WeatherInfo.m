//
//  WeatherInfo.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherInfo.h"
#import "AFNetworking.h"

@implementation WeatherInfo
+ (instancetype) weatherInfoBasic {
    WeatherInfo *info = [[super alloc] init];
    if (info) {
        info.city = @"北京";
        info.status = @"晴";
        info.temprature = 26;
        info.maxTmp = 26;
        info.minTmp = 26;
        info.status = @"101";
    }
    return  info;
}
@end
