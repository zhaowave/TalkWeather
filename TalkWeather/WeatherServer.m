//
//  WeatherServer.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/3.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "WeatherServer.h"
#import "WeatherInfo.h"
#import "AFNetWorking.h"

@implementation WeatherServer
+ (instancetype) sharedWeatherServer {
    static WeatherServer *sharedServer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedServer = [[WeatherServer alloc] init];
    });
    return sharedServer;
}

- (void) getHourlyWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block{
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:conf];
    NSURL *url = [NSURL URLWithString:@"https://free-api.heweather.com/v5/now?city=beijing&key=0698c80e890e4d8abfabe047fdcde2b2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"API request Error!");
            block(nil,error);
        }else {
            NSLog(@"API Request Success!");
            WeatherInfo *weatherInfo = [WeatherInfo weatherInfoBasic];
            NSDictionary *dict = [[responseObject objectForKey:@"HeWeather5"] objectAtIndex:0];
            NSDictionary *nowForecast = [dict objectForKey:@"now"];
            weatherInfo.temprature = [[nowForecast objectForKey:@"tmp"] integerValue];
            weatherInfo.statusCode = [[nowForecast objectForKey:@"cond"] objectForKey:@"code"];
            weatherInfo.status = [[nowForecast objectForKey:@"cond"] objectForKey:@"txt"];
        

            
            if (block) {
                block(weatherInfo,error);
            }
            //return  info;
        }
    }];
    [task resume];
}

- (void) getTodayBasicWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block {
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:conf];
    NSURL *url = [NSURL URLWithString:@"https://free-api.heweather.com/v5/weather?city=beijing&key=0698c80e890e4d8abfabe047fdcde2b2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"API request Error!");
            block(nil,error);
        }else {
            WeatherInfo *weatherInfo = [WeatherInfo weatherInfoBasic];
            NSDictionary *dict = [[responseObject objectForKey:@"HeWeather5"] objectAtIndex:0];
            NSArray *dailyForecast = [dict objectForKey:@"daily_forecast"];
            weatherInfo.maxTmp = [[[[dailyForecast objectAtIndex:0] objectForKey:@"tmp"] objectForKey:@"max"] integerValue];
            weatherInfo.minTmp =  [[[[dailyForecast objectAtIndex:0] objectForKey:@"tmp"] objectForKey:@"min"] integerValue];
            weatherInfo.statusCode = [[[dailyForecast objectAtIndex:0] objectForKey:@"cond"] objectForKey:@"code_d"];
            weatherInfo.status = [[[dailyForecast objectAtIndex:0] objectForKey:@"cond"] objectForKey:@"txt_d"];
            
            
            if (block) {
                block(weatherInfo,error);
            }
        }
    }];
    [task resume];
}

- (void) getTomorrowBasicWeatherInfoWithBlock:(GetHourlyWeatherInfoBlock)block {
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:conf];
    NSURL *url = [NSURL URLWithString:@"https://free-api.heweather.com/v5/forecast?city=beijing&key=0698c80e890e4d8abfabe047fdcde2b2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"API request Error!");
            block(nil,error);
        }else {
            WeatherInfo *weatherInfo = [WeatherInfo weatherInfoBasic];
            NSDictionary *dict = [[responseObject objectForKey:@"HeWeather5"] objectAtIndex:0];
            NSArray *dailyForecast = [dict objectForKey:@"daily_forecast"];
            weatherInfo.maxTmp = [[[[dailyForecast objectAtIndex:0] objectForKey:@"tmp"] objectForKey:@"max"] integerValue];
            weatherInfo.minTmp =  [[[[dailyForecast objectAtIndex:0] objectForKey:@"tmp"] objectForKey:@"min"] integerValue];
            weatherInfo.statusCode = [[[dailyForecast objectAtIndex:0] objectForKey:@"cond"] objectForKey:@"code_d"];
            weatherInfo.status = [[[dailyForecast objectAtIndex:0] objectForKey:@"cond"] objectForKey:@"txt_d"];
            
            
            if (block) {
                block(weatherInfo,error);
            }
        }
    }];
    [task resume];
}

@end
