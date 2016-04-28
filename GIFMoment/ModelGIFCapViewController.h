//
//  ModelGIFCapViewController.h
//  GIFMoment
//
//  Created by MonsterSucker on 3/22/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ModelGIFCapViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,MBProgressHUDDelegate>


@property (strong, nonatomic) IBOutlet UIButton *_capButton;
@property(strong,nonatomic)NSURL *gifURL;
@property(strong,nonatomic)NSURL *pickURL;
@property (strong, nonatomic) IBOutlet UIImageView *_previewImageView;
@end
