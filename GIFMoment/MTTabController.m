//
//  MTTabController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MTTabController.h"
#import "ProfileViewController.h"
@interface MTTabController ()

@end

@implementation MTTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.tintColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = [UIColor grayColor];
    
//    ProfileViewController *myViewController = [[ProfileViewController alloc  ]initWithMainImage:@"avatar"];
    
    
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
