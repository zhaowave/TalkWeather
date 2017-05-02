//
//  MeTableViewDateSource.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/2.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "MeTableViewDateSource.h"

@implementation MeTableViewDateSource

#pragma mark tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"kCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.textLabel.text = @"海淀区";
    cell.detailTextLabel.text = @"更换地点";
    cell.detailTextLabel.textColor = [UIColor blueColor];
    return cell;
}
#pragma mark tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }
    return 200;
}
@end
