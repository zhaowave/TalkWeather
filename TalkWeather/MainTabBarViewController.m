//
//  MainTabBarViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "MeViewController.h"
#import "WeatherViewController.h"

#define TAB1 @"WeatherViewController"

#define TAB2 @"MeViewController"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTintColor:[[UIColor alloc]initWithRed:228.0/255 green:57.0/255 blue:67.0/255 alpha:1.0]];
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self createViewControllers];
    
    // Do any additional setup after loading the view.
}

- (void) createViewControllers {
    
    _weatherViewcontrller = [[WeatherViewController alloc] init];
    UINavigationController *ncv1 = [[UINavigationController alloc]initWithRootViewController:_weatherViewcontrller];
    _weatherViewcontrller.tabBarItem.title = TAB1;
    
    _meViewcontroller = [[MeViewController alloc] init];
    UINavigationController *ncv2 = [[UINavigationController alloc] initWithRootViewController:_meViewcontroller];
    _meViewcontroller.tabBarItem.title = TAB2;
    self.viewControllers = @[ncv1,ncv2];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
