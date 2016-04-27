//
//  MineNaviCtrl.m
//  GIFMoment
//
//  Created by MonsterSucker on 4/5/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MineNaviCtrl.h"
#import "ProfileViewController.h"
@interface MineNaviCtrl ()

@end

@implementation MineNaviCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ProfileViewController *mVC = [[ProfileViewController alloc]initWithMainImage:[UIImage imageNamed:@"avatar"]];
    [self pushViewController:mVC animated:YES];
    
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
