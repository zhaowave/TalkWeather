//
//  MeExtentsTableViewCell.m
//  TalkWeather
//
//  Created by kfzx-version on 2017/5/2.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "MeExtentsTableViewCell.h"
#import "Masonry.h"
@implementation MeExtentsTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.contentView.frame.size.width/4, self.contentView.frame.size.width/4);
        layout.minimumLineSpacing = 20;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kCollectionViewCell"];
        [self.contentView addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
