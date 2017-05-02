//
//  MeExtentsTableViewCell.h
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/2.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeExtentsTableViewCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong, nonatomic) UICollectionView *collectionView;
@end
