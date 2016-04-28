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
    
}


- (IBAction)gifCap:(id)sender{
    CustomGifCapViewController *customGifCapViewCtrl = [[CustomGifCapViewController alloc ]initWithNibName:@"CustomGifCapViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController presentViewController:customGifCapViewCtrl animated:YES completion:nil];
    
    
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
