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
        NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:conf];
        NSURL *url = [NSURL URLWithString:@"https://free-api.heweather.com/v5/weather?city=beijing&key=0698c80e890e4d8abfabe047fdcde2b2"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                NSLog(@"API request Error!");
            }else {
                NSLog(@"API Request Success!");
                //info.temprature = [[responseObject objectForKey:@"HeWeather5"] objectForKey:@""];
            }
        }];
        [task resume];
    }
    return  info;
}

@end
