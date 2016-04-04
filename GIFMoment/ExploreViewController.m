//
//  ExploreViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "ExploreViewController.h"
#import "SearchViewController.h"
#import "MSTableView.h"
@interface ExploreViewController ()
@property (strong, nonatomic) IBOutlet MSTableView *tableView;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];
    [self _setHeaderView];

}
- (void)_setHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 360)];
    headerView.backgroundColor = [UIColor magentaColor];
   
    self.tableView.tableHeaderView = headerView;
    
   
    
    
}

- (void)_setupNaviItem{
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, 20, 20);
    [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(search :) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    self.navigationItem.leftBarButtonItem = searchItem;

    
    
    
}
- (void)search : (UIBarButtonItem *)searchItem{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    SearchViewController*searchViewCtrl = [storyBoard instantiateViewControllerWithIdentifier:@"Search"];
    [self.navigationController pushViewController:searchViewCtrl animated:YES];

    
    
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
    
    return 300;
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
@end
