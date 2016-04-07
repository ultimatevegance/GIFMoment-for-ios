//
//  MineHeaderView.m
//  GIFMoment
//
//  Created by Monster on 4/7/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView


//// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self.userAvatarImageView setContentMode:UIViewContentModeScaleAspectFill];
    [_userAvatarImageView.layer setCornerRadius: _userAvatarImageView.bounds.size.width * 0.5];
    self.userAvatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.userAvatarImageView.layer.borderWidth = 1;
    
    self.userAvatarImageView.layer.masksToBounds = YES;
    [self.userAvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
    self.backgroundColor = [UIColor darkGrayColor];
}


@end
