//
//  HomeViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "HomeViewController.h"
#import "MSTableView.h"
#import <AVOSCloud/AVOSCloud.h>
#import "DetailPostViewController.h"
@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet MSTableView *tableView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];
    [self _setHeaderView];
    //test AVOSCloud
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
    
}
- (void)_setHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 0.5)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    
}

- (void)_setupNaviItem{
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locationButton.frame = CGRectMake(0, 0, 20, 20);
    [locationButton setImage:[UIImage imageNamed:@"LLocation"] forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(location :) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *locationItem = [[UIBarButtonItem alloc]initWithCustomView:locationButton];
    self.navigationItem.leftBarButtonItem = locationItem;
    
    UIButton *layoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    layoutButton.frame = CGRectMake(0, 0, 20, 20);
    [layoutButton setImage:[UIImage imageNamed:@"StreamLayout"] forState:UIControlStateNormal];
    [layoutButton addTarget:self action:@selector(layoutSelect :) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *layoutItem = [[UIBarButtonItem alloc]initWithCustomView:layoutButton];
    self.navigationItem.rightBarButtonItem = layoutItem;
    
    
}
- (void)location : (UIBarButtonItem * )location{
    
    
    
    
}
- (void)layoutSelect : (UIBarButtonItem *)layoutSelect{
    
    
    
    
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
#pragma mark -UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 364;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 20;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"MSCell";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MSCell" owner:nil options:nil]lastObject ];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailPostViewController *detailPostViewCtrl = [[DetailPostViewController alloc]init];
    detailPostViewCtrl.hidesBottomBarWhenPushed = YES;
    [self.navigationController setModalPresentationStyle:UIModalPresentationPopover];
}
@end
