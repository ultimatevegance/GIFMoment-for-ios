//
//  MSTableViewCell.m
//  GIFMoment
//
//  Created by MonsterSucker on 4/4/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MSTableViewCell.h"
#import "UIImage+animatedGIF.h"
@implementation MSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.userAvatarImageView setContentMode:UIViewContentModeScaleAspectFill];
     [_userAvatarImageView.layer setCornerRadius: _userAvatarImageView.bounds.size.width * 0.5];
    self.userAvatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.userAvatarImageView.layer.borderWidth = 1;
    
    self.userAvatarImageView.layer.masksToBounds = YES;
    [self.userAvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
    self.backgroundColor = [UIColor darkGrayColor];
    NSString *filePath = [[NSBundle mainBundle ] pathForResource:@"examplegif" ofType:@"gif"];
    self.statusImageView.image  = [UIImage animatedImageWithAnimatedGIFURL:[NSURL fileURLWithPath:filePath]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
