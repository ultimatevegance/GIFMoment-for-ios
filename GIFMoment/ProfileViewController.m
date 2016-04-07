//
//  ViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 4/4/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "ProfileViewController.h"
#import "MGViewControllerDelegate.h"
#import "MGViewControllerDataSource.h"
#import "SettingTableViewController.h"
#import "MineHeaderView.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController
{
        MGViewControllerDelegate *myDelegate;
        MGViewControllerDataSource *myDataSource;
        MineHeaderView *headerView ;
    }

- (instancetype)initWithMainImage:(UIImage *)image{
    self = [super initWithMainImage:image tableScrollingType:MGSpotyViewTableScrollingTypeNormal];
    if (self) {
        myDelegate = [MGViewControllerDelegate new];
        myDataSource = [MGViewControllerDataSource new];
        self.overViewUpFadeOut = YES;
        self.blurRadius = 9.f;
        self.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
    }
    
    
    
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];
    self.dataSource = myDataSource;
    self.delegate = myDelegate ;
    self.view.backgroundColor = [UIColor clearColor];
   
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithWhite:0.1 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.title = @"Mine";
    [self setOverView:self.myOverView];

}
- (UIView *)myOverView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.overView.frame.size.width, 300)];
    [self _addElementOnView:view];
    
    return view;
}
- (void)_addElementOnView : (UIView* )view{
   NSArray *  nibView = [[NSBundle mainBundle]loadNibNamed:@"MineHeaderView" owner:self options:nil];
    headerView = [nibView objectAtIndex:0];
    headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    
    [view addSubview:headerView];
    
}
- (void)_setupNaviItem{
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(0, 0, 20, 20);
    [settingButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(setting :) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = settingItem;
}
- (void)setting : (UITabBarItem *)setting{
    UIStoryboard *sto = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SettingTableViewController *settingTVC = [sto instantiateViewControllerWithIdentifier:@"Setting"];
    [self.navigationController pushViewController:settingTVC animated:YES];
    
    
    
    
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
