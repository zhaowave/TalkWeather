//
//  WeatherInfo.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject
@property (strong ,nonatomic) NSString *city;
@property (strong ,nonatomic) NSString *status;
@property (nonatomic) NSInteger temprature;

+ (instancetype) weatherInfoBasic;
@end
