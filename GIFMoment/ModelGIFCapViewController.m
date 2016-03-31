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
@class NSGIF;
@interface ModelGIFCapViewController ()
{
    
    __weak IBOutlet UIButton *_cancelButton;
}
@end

@implementation ModelGIFCapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.13 green:0.16 blue:0.19 alpha:0.7];

    self.activityIndicator.color = [UIColor grayColor];
    self.activityIndicator.hidden = YES;
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
    if (url) {
        
        [self.activityIndicator startAnimating];
        self._capButton.hidden= YES;
        self.activityIndicator.hidden = NO;
        [NSGIF optimalGIFfromURL:url loopCount:0 completion:^(NSURL *GifURL) {
            NSLog(@"Finished generating GIF: %@",GifURL);
            self._previewImageView.image = [UIImage animatedImageWithAnimatedGIFURL:GifURL];
            self._previewImageView.hidden = NO;
            [self.activityIndicator stopAnimating];

            if (GifURL) {
                self.activityIndicator.hidden = YES;
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"success" message:@"gif created successfully!!" preferredStyle:UIAlertControllerStyleAlert];
                // TODO保存到本地
                UIAlertAction *save = [UIAlertAction actionWithTitle:@"save" style:UIAlertActionStyleDefault handler:nil];
                //todo发状态分享
                UIAlertAction *share = [UIAlertAction actionWithTitle:@"share" style:UIAlertActionStyleDefault handler:nil];
                [alert addAction:save];
                [alert addAction:share];
                [self presentViewController:alert animated:YES completion:nil];

            } else {
                UIAlertController *alertF = [UIAlertController alertControllerWithTitle:@"Failed" message:@"something wrong...try again!" preferredStyle:UIAlertControllerStyleAlert];
                // TODO retake
                UIAlertAction *retake = [UIAlertAction actionWithTitle:@"retake" style:UIAlertActionStyleDestructive handler:nil];
                [alertF addAction:retake];
                [self presentViewController:alertF animated:YES completion:nil];

            }
            
        }];
        
      

        
    }


}
@end
