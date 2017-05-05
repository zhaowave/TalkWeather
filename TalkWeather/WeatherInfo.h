//
//  WeatherInfo.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject
@property (strong ,nonatomic) NSString *city;//城市
@property (strong ,nonatomic) NSString *status;//阴晴雨雪等状态
@property (strong ,nonatomic) NSString *statusCode;//状态对应的编码，用于获取状态图标
@property (nonatomic) NSInteger temprature;//当前温度
@property (nonatomic) NSInteger maxTmp;//最高温度
@property (nonatomic) NSInteger minTmp;//最低温度



+ (instancetype) weatherInfoBasic;
@end
