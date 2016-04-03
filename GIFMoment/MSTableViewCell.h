//
//  MSTableViewCell.h
//  GIFMoment
//
//  Created by MonsterSucker on 4/4/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userAvatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *userLocationLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *statusImageView;
@property (strong, nonatomic) IBOutlet UILabel *statusTextLabel;

@end
