//
//  GIFViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/22/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "GIFViewController.h"
#import "CustomGifCapViewController.h"
#import <Photos/Photos.h>
@interface GIFViewController ()

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:0.13 green:0.16 blue:0.19 alpha:1];
    CGRect screenRect = [[UIScreen mainScreen] bounds ];
    self.camera = [[LLSimpleCamera alloc] initWithQuality:AVCaptureSessionPresetMedium
                                                 position:LLCameraPositionFront
                                             videoEnabled:YES];

    [self.camera attachToViewController:self withFrame:screenRect];
    [self _setupLayerUI];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self setNeedsStatusBarAppearanceUpdate];
    
    
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)_setupLayerUI{
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    [blurEffectView setFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:blurEffectView];
    //logo
    CGPoint logoCenter = CGPointMake(self.view.frame.size.width / 2, 100);
    UIImageView *logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    logoImage.image = [UIImage imageNamed:@"LogoStart"];
    logoImage.center = logoCenter;
    [blurEffectView.contentView addSubview:logoImage];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 10)];
    line.image = [UIImage imageNamed:@"line1"];
    line.center = CGPointMake(self.view.frame.size.width / 2, 180);
    [blurEffectView.contentView addSubview:line];
    
    //gif cap button
    self.gifCapButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    [self.gifCapButton setImage:[UIImage imageNamed:@"gifcapIconff@2x"] forState:UIControlStateNormal];
    [self.gifCapButton setTitle:@"GIF Capture From Camera" forState:UIControlStateNormal];
    [self.gifCapButton addTarget:self action:@selector(GifCapAction:) forControlEvents:UIControlEventTouchUpInside];
    [blurEffectView.contentView addSubview:self.gifCapButton];
    //screen record button
    self.screenRecordButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 280, self.view.frame.size.width, 100)];
    [self.screenRecordButton setImage:[UIImage imageNamed:@"device"] forState:UIControlStateNormal];
    self.screenRecordButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0) ;
    [self.screenRecordButton setTitle:@"Screen Recorder for IPhone" forState:UIControlStateNormal];
    [self.screenRecordButton addTarget:self action:@selector(ScreenRecord:) forControlEvents:UIControlEventTouchUpInside];
    [blurEffectView.contentView addSubview:self.screenRecordButton];
    //local video convert button
    self.localButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 360, self.view.frame.size.width, 100)];
    [self.localButton setImage:[UIImage imageNamed:@"localContent@2x"] forState:UIControlStateNormal];
    self.localButton.imageEdgeInsets = UIEdgeInsetsMake(0, -33, 0, 0) ;
    [self.localButton setTitle:@"Local Video Converter" forState:UIControlStateNormal];
    [self.localButton addTarget:self action:@selector(LocalVideoConvert:) forControlEvents:UIControlEventTouchUpInside];
    [blurEffectView.contentView addSubview:self.localButton];
    
}
- (void)GifCapAction:(id)sender{
    CustomGifCapViewController *customGifCapViewCtrl = [[CustomGifCapViewController alloc ]initWithNibName:@"CustomGifCapViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController presentViewController:customGifCapViewCtrl animated:YES completion:nil];
    
    
}
// todo : VideoConvert
- (void)LocalVideoConvert : (UIButton*)convert{
    
    
}
//todo : ScreenRecord
- (void)ScreenRecord :(UIButton*)recordButton{
    
    
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // start the camera
    [self.camera start];
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
