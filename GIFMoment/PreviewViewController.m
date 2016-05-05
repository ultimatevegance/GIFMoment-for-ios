//
//  PreviewViewController.m
//  GIFMoment
//
//  Created by Monster on 4/27/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "PreviewViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "NSGIF.h"
#import "UIImage+animatedGIF.h"
#import "MBProgressHUD.h"
@interface PreviewViewController ()
@property (strong, nonatomic) NSURL *videoUrl;
@property(strong,nonatomic)UIImageView *imageView;

@end

@implementation PreviewViewController
-(instancetype)initWithVideoURL:(NSURL *)videoURL{
    self = [super init];
    if (self) {
        _videoUrl = videoURL;
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self _setupUI];
    if (self.videoUrl) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
        hud.labelText = @"Preparing...";
        hud.minSize = CGSizeMake(150.f, 100.f);
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            // processing
            [self doSomeWorkWithMixedProgress];
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hide:YES];
            });
        });


    }
    
}
- (void)doSomeWorkWithMixedProgress {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    // Indeterminate mode
    sleep(2);
    // Back to indeterminate mode
    dispatch_async(dispatch_get_main_queue(), ^{
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.labelText =@"Processing...";
    });
    
    
    [NSGIF optimalGIFfromURL:self.videoUrl loopCount:0 completion:^(NSURL *GifURL) {
        NSLog(@"Finished generating GIF: %@",GifURL);
        self.imageView.image = [UIImage animatedImageWithAnimatedGIFURL:GifURL];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.hidden = NO;
    }];
    dispatch_sync(dispatch_get_main_queue(), ^{
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
        hud.labelText= @"Completed";
    });
    
    sleep(2);
//    PreviewViewController *previewViewCtrl = [[ PreviewViewController alloc]initWithNibName:@"PreviewViewController" bundle:[NSBundle mainBundle]];
//    [self.navigationController presentViewController:previewViewCtrl animated:YES completion:nil];
//    
    
}

- (void)_setupUI{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 100)];
    self.imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.imageView];
    UIButton *cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 40, 50, 50)];
    [cancelButton setImage:[UIImage imageNamed:@"CameraClose"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(Cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
}
- (void)Cancel : (UIButton*)cance{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
