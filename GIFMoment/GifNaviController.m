//
//  GifNaviController.m
//  GIFMoment
//
//  Created by Monster on 4/27/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "GifNaviController.h"
#import "ModelGIFCapViewController.h"
@interface GifNaviController ()

@end

@implementation GifNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *sto = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    ModelGIFCapViewController *gifCapViewCtrl = [sto instantiateViewControllerWithIdentifier:@"GifCapViewCtrl"];
    [self presentViewController:gifCapViewCtrl animated:YES completion:nil];
    
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
