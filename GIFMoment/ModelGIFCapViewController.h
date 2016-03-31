//
//  ModelGIFCapViewController.h
//  GIFMoment
//
//  Created by MonsterSucker on 3/22/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelGIFCapViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIButton *_capButton;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIImageView *_previewImageView;
@end
