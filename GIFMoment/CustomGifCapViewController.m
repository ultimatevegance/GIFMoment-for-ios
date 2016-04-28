//
//  CustomGifCapViewController.m
//  GIFMoment
//
//  Created by Monster on 4/28/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "CustomGifCapViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface CustomGifCapViewController ()
@property(nonatomic,strong)AVCaptureSession *avCapSession;
@property(nonatomic,strong)AVCaptureDeviceInput *videoInput;
@property(nonatomic,strong)AVCaptureMovieFileOutput *movieOutput;
@property(nonatomic,strong)AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

@implementation CustomGifCapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self initCapSession];



}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.avCapSession ) {
        [self.avCapSession startRunning];
    }
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.avCapSession) {
        [self.avCapSession stopRunning];
    }
    
    
}
- (void)initCapSession{
    self.avCapSession = [[AVCaptureSession alloc]init];
//    if ([self.avCapSession canSetSessionPreset:AVCaptureSessionPreset640x480]) {
//        self.avCapSession.sessionPreset = AVCaptureSessionPreset640x480;
//    }
    AVCaptureDevice *capDevice = [self getCameraDeviceWithPosition:AVCaptureDevicePositionBack];
    
    //TODO :error Handler
    AVCaptureDevice *audioDevice = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio] firstObject];
    //TODO :error Handler
    NSError *error = nil;
    self.videoInput = [[AVCaptureDeviceInput alloc]initWithDevice:capDevice error:&error];
    AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice error:&error];
    if ([self.avCapSession canAddInput:self.videoInput]) {
        [ _avCapSession addInput:self.videoInput];
        [_avCapSession addInput:audioInput];
        AVCaptureConnection *capConnection = [_movieOutput connectionWithMediaType:AVMediaTypeVideo];
        if ([capConnection isVideoStabilizationSupported ]) {
            capConnection.preferredVideoStabilizationMode=AVCaptureVideoStabilizationModeAuto;
        }
        
    }
    if ([_avCapSession canAddOutput:_movieOutput]) {
        [_avCapSession addOutput:_movieOutput];
    }
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.avCapSession];
    _videoPreviewLayer.frame = CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height);
    _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _camView.layer.masksToBounds = YES;
    [_camView.layer addSublayer:_videoPreviewLayer];
    

}
- (IBAction)cancel:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (AVCaptureDevice *)getCameraDeviceWithPosition : (AVCaptureDevicePosition *)position{
    NSArray *cameras= [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *camera in cameras) {
        if ([camera position] == position) {
            return camera;
        }
    }
    return nil;
    
    
    
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
