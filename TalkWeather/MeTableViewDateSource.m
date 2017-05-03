//
//  MeTableViewDateSource.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/2.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "MeTableViewDateSource.h"

#import "UIColor+HexString.h"

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
    NSInteger section = indexPath.section;
    if (section == 0) {
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
    static NSString *cellIdentifier = @"kCellIdentifier";
    MeExtentsTableViewCell *meCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    meCell.collectionView.delegate = self;
    meCell.collectionView.dataSource = self;
    if(!meCell){
        meCell = [[MeExtentsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    return meCell;
    
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
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) {
        MeExtentsTableViewCell *meCell = (MeExtentsTableViewCell*)cell;
        meCell.collectionView.delegate = self;
        meCell.collectionView.dataSource = self;
    }
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0.1, 0.1, 0.1, 0.1);
}
#pragma mark UICollection datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //NSLog(@"numberOfItemsInSection");
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //NSLog(@"numberOfSectionsInCollectionView");
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForItemAtIndexPath");
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"kCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICollectionViewCell alloc] init];
    }
    //cell.label.text=[NSString stringWithFormat:@"%ld",indexPath.section*100+indexPath.row];
    if (indexPath.section == 1) {
        cell.backgroundColor = [UIColor yellowColor];
    }else
        cell.backgroundColor=[UIColor redColor];
    return cell;
}

@end
