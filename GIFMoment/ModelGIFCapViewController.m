//
//  ModelGIFCapViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/22/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "ModelGIFCapViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "NSGIF.h"
#import "UIImage+animatedGIF.h"
#import "MBProgressHUD.h"
#import "SendPostViewController.h"
#import "PreviewViewController.h"
@class NSGIF;
@interface ModelGIFCapViewController ()<UIAlertViewDelegate>
{
    
    __weak IBOutlet UIButton *_cancelButton;
}
@end

@implementation ModelGIFCapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.13 green:0.16 blue:0.19 alpha:0.7];
    _cancelButton.layer.cornerRadius = 10;

    self._previewImageView.hidden = YES;
    // Do any additional setup after loading the view.
    
}
- (IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)cap:(id)sender{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.videoQuality = UIImagePickerControllerQualityTypeMedium;
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = @[(NSString *)kUTTypeMovie];
        // Present the picker
        [self presentViewController:picker animated:YES completion:nil];
        

        
    });
    
    
    
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
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self dismissViewControllerAnimated:YES completion:nil];

    NSURL *url = info[UIImagePickerControllerMediaURL];
    self.pickURL = url;
    if (url) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view  animated:YES];
        hud.labelText = @"Preparing...";
        hud.minSize = CGSizeMake(150.f, 100.f);
         self._capButton.hidden= YES;
        _cancelButton.hidden = YES;
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

    
        [NSGIF optimalGIFfromURL:self.pickURL loopCount:0 completion:^(NSURL *GifURL) {
        NSLog(@"Finished generating GIF: %@",GifURL);
        self._previewImageView.image = [UIImage animatedImageWithAnimatedGIFURL:GifURL];
        self._previewImageView.hidden = NO;
        }];
        dispatch_sync(dispatch_get_main_queue(), ^{
            UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            hud.customView = imageView;
            hud.mode = MBProgressHUDModeCustomView;
            hud.labelText= @"Completed";
        });
    
            sleep(2);
    PreviewViewController *previewViewCtrl = [[ PreviewViewController alloc]initWithNibName:@"PreviewViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController presentViewController:previewViewCtrl animated:YES completion:nil];
     
    
}
@end
