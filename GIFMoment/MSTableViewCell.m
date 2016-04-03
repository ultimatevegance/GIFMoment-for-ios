//
//  MSTableViewCell.m
//  GIFMoment
//
//  Created by MonsterSucker on 4/4/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MSTableViewCell.h"

@implementation MSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.userAvatarImageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.userAvatarImageView.layer setCornerRadius: 5.0];
    self.userAvatarImageView.clipsToBounds = YES;
    [self.userAvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
