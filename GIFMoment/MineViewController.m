//
//  MineViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MineViewController.h"
#import "SettingTableViewController.h"
#import "MSTableView.h"
@interface MineViewController ()
@property (strong, nonatomic) IBOutlet MSTableView *tableView;
@end

@implementation MineViewController

- (void)awakeFromNib{
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];
//    [self _setHeaderView];

}
//- (void)_setHeaderView{
//    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 300)];
//    headerView.backgroundColor = [UIColor blackColor];
//    UIImageView *userAvatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
//    userAvatarImageView.backgroundColor = [UIColor clearColor];
//    userAvatarImageView.center = headerView.center;
//    
//    [userAvatarImageView setContentMode:UIViewContentModeScaleAspectFit];
//    [userAvatarImageView.layer setCornerRadius: userAvatarImageView.bounds.size.width * 0.5];
//    
//    userAvatarImageView.clipsToBounds = YES;
//    [userAvatarImageView setImage:[UIImage imageNamed:@"avatar"]];
//
//    [headerView addSubview:userAvatarImageView];
//    self.tableView.tableHeaderView = headerView;
//    
//    
//}
-(void)_setupNaviItem{
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.frame = CGRectMake(0, 0, 20, 20);
    [settingButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(setting :) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
    self.navigationItem.rightBarButtonItem = settingItem;
    

}
-(void)setting : (UIBarButtonItem *)settingButton{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    SettingTableViewController *settingViewCtrl = [storyBoard instantiateViewControllerWithIdentifier:@"Setting"];
    [self.navigationController pushViewController:settingViewCtrl animated:YES];
    
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
//#pragma mark -UITableView Delegate
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 300;
//}
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    
//    return 20;
//    
//    
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    
//    return 1;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *identifier = @"MSCell";
//    
//    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"MSCell" owner:nil options:nil]lastObject ];
//    }
//    
//    return cell;
//}
@end
