//
//  CustomGifCapViewController.m
//  GIFMoment
//
//  Created by Monster on 4/28/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "CustomGifCapViewController.h"
#import "LLSimpleCamera.h"
#import "PreviewViewController.h"
@interface CustomGifCapViewController ()

@property(nonatomic,strong)LLSimpleCamera *camera;
@end

@implementation CustomGifCapViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds ];
    self.camera = [[LLSimpleCamera alloc] initWithQuality:AVCaptureSessionPresetMedium
                                                 position:LLCameraPositionRear
                                             videoEnabled:YES];
    [self.camera attachToViewController:self withFrame:screenRect];
    [self.capButton setImage:[UIImage imageNamed:@"CameraShot"] forState:UIControlStateNormal];


}
- (IBAction)videoCap :(id)sender{
    NSURL *outputURL =[[[self applicationDocumentsDirectory]
                        URLByAppendingPathComponent:@"videoFile"] URLByAppendingPathExtension:@"mov"];
    if (!self.camera.isRecording) {
        self.camChangeButton.hidden = YES;
        self.lightButton.hidden = YES;
    
        
        [self.capButton setImage:[UIImage imageNamed:@"CapButtonIconSelected"] forState:UIControlStateNormal];
        [self.camera startRecordingWithOutputUrl:outputURL];

        }
    else{
        [self.camera stopRecording:^(LLSimpleCamera *camera, NSURL *outputFileUrl, NSError *error) {
            [self.capButton setImage:[UIImage imageNamed:@"CameraShot"] forState:UIControlStateNormal];
            self.camChangeButton.hidden = NO;
            self.lightButton.hidden = NO;

            PreviewViewController *previewVC = [[PreviewViewController alloc ]initWithVideoURL:outputURL];
            previewVC.view.frame = self.view.frame;
            previewVC.view.backgroundColor = [UIColor whiteColor];
            NSLog(@"%@",outputURL );
            [self presentViewController:previewVC animated:YES completion:nil];

        }];
        
    }
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // start the camera
    [self.camera start];
}
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (IBAction)cancel:(id)sender{
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
