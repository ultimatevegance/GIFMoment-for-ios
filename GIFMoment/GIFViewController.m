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
    self.view.backgroundColor = [UIColor colorWithRed:0.13 green:0.16 blue:0.19 alpha:1];
    self.title = @"GIF";
    CGRect screenRect = [[UIScreen mainScreen] bounds ];
    self.camera = [[LLSimpleCamera alloc] initWithQuality:AVCaptureSessionPresetMedium
                                                 position:LLCameraPositionRear
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
    self.gifCapButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 100)];
    [self.gifCapButton setImage:[UIImage imageNamed:@"GifCapIcon@2x.png"] forState:UIControlStateNormal];
    [self.gifCapButton setTitle:@"GIFCapture" forState:UIControlStateNormal];
    [self.gifCapButton addTarget:self action:@selector(GifCapAction:) forControlEvents:UIControlEventTouchUpInside];
    [blurEffectView.contentView addSubview:self.gifCapButton];
    

    
    
    
}
- (void)GifCapAction:(id)sender{
    CustomGifCapViewController *customGifCapViewCtrl = [[CustomGifCapViewController alloc ]initWithNibName:@"CustomGifCapViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController presentViewController:customGifCapViewCtrl animated:YES completion:nil];
    
    
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
