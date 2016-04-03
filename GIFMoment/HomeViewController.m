//
//  HomeViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];

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
    
    return 300;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
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
