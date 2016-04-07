//
//  ExploreHeaderView.h
//  GIFMoment
//
//  Created by Monster on 4/7/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreHeaderView : UIView
@property (strong, nonatomic)  UIScrollView *headerScrollView;
@property (strong, nonatomic)  UICollectionView *headerCollectionView;
@property(strong,nonatomic)UILabel *tagLabel;
@property(strong,nonatomic)UILabel *featureLabel;
@end
