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
#import "UIImage+Tint.h"

#define TAB1 @"天气"

#define TAB2 @"我"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
    // Do any additional setup after loading the view.
}

- (void) createViewControllers {
    
    _weatherViewcontrller = [[WeatherViewController alloc] init];
    //_weatherViewcontrller.title = @"AAFDSAFDA";
    //UINavigationController *ncv1 = [[UINavigationController alloc]initWithRootViewController:_weatherViewcontrller];
    _weatherViewcontrller.title = TAB1;
    
    _meViewcontroller = [[MeViewController alloc] init];
    _meViewcontroller.title = TAB2;
    //UINavigationController *ncv2 = [[UINavigationController alloc] initWithRootViewController:_meViewcontroller];
    _meViewcontroller.tabBarItem.title = TAB2;
    self.viewControllers = @[
                            [self initialNaviControllerWithViewController:_weatherViewcontrller andImage:@"" andSelectImage:@""],
                            [self initialNaviControllerWithViewController:_meViewcontroller andImage:@"tabbar_me" andSelectImage:@"tabbar_me"]
                            ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  返回取消渲染的image
 */
- (UIImage*)removeRendering:(NSString*)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UINavigationController *) initialNaviControllerWithViewController:(UIViewController *)viewController andImage:(NSString *)image andSelectImage:(NSString*)selectImgName{
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    naviController.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:viewController.title
                                  image:[self removeRendering:image]
                          selectedImage:[[self removeRendering:selectImgName] imageWithTintColor:[UIColor blueColor]]];
    return naviController;
}

@end
