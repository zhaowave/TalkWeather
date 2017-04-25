//
//  ViewController.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/4/21.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClicked)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"go" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonItemClicked)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.navigationController.navigationBar setTintColor:[UIColor redColor] ];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGRect rect = self.view.frame;
    rect.size.height = 400;
    _scroll = [[UIScrollView alloc] initWithFrame:rect];
    _scroll.contentSize = CGSizeMake(rect.size.width, 1000);
    _scroll.backgroundColor = [UIColor blackColor];
    _scroll.delegate = self;
    [self.view addSubview:_scroll];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"begin---");
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"end---");
}
- (void) leftBarButtonItemClicked {
    [_scroll setBackgroundColor:[UIColor redColor]];
    NSLog(@"leftBarButtonItemClicked");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_scroll setBackgroundColor:[UIColor redColor]];
    NSLog(@"scrollViewDidScroll");
}

@end
