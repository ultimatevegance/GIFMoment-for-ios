//
//  MessageViewController.m
//  GIFMoment
//
//  Created by MonsterSucker on 3/19/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setHeaderView];
}
- (void)_setHeaderView{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 0.5)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    
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
    
    return 120;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 20;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"MessageCell";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MessageCell" owner:nil options:nil]lastObject ];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    return cell;
}

@end
