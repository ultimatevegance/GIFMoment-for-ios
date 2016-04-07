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
#import "ExploreHeaderView.h"
#define screenW [UIScreen mainScreen ].bounds.size.width
@interface ExploreViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet MSTableView *tableView;

@end

@implementation ExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupNaviItem];
    [self _setHeaderView];
  
   
}
- (void)_setHeaderView{
    _adImageArray = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"0.png"],
                     [UIImage imageNamed:@"1.png"],
                     [UIImage imageNamed:@"2.png"],
                     [UIImage imageNamed:@"3.png"],
                            nil];
    
    
    ExploreHeaderView  * headerView = [[ExploreHeaderView alloc]init];
    headerView.frame =CGRectMake(0, 0, self.view.frame.size.width, 350);
    headerView.headerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,screenW , 120)];
    headerView.tagLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, headerView.headerScrollView.frame.size.height, screenW, 20)];
    [headerView.tagLabel setText:@"Featured Tag"];
    headerView.tagLabel.textAlignment = NSTextAlignmentCenter;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(80, 80);
//    flowLayout.headerReferenceSize = CGSizeMake(0, 30);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    headerView.headerCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, headerView.headerScrollView.frame.size.height + 20, screenW, 190) collectionViewLayout:flowLayout];
    headerView.featureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,headerView.headerCollectionView.frame.size.height + 140, screenW, 20)];
    [headerView.featureLabel setText:@"Top On GIFMoment And Trending"];
    headerView.featureLabel.textAlignment = NSTextAlignmentCenter;
    
    [headerView addSubview:headerView.headerScrollView];
    [headerView addSubview:headerView.tagLabel];
    [headerView addSubview:headerView.headerCollectionView];
    [headerView addSubview:headerView.featureLabel];
    
    
    
    
    
    headerView.headerScrollView.pagingEnabled = YES;
    headerView.headerScrollView.contentSize = CGSizeMake(screenW * 4, headerView.headerScrollView.frame.size.height);
    for (int i = 0; i <self.adImageArray.count ; i++) {
        UIImageView *adImageView = [[UIImageView alloc]init];
        adImageView.frame = CGRectMake(headerView.frame.size.width * i, 0, screenW,headerView.headerScrollView.frame.size.height);
        adImageView.contentMode = UIViewContentModeScaleAspectFill;
        adImageView.image = _adImageArray[i];

        [headerView.headerScrollView addSubview:adImageView];
    
    
    }
    [self.tableView setTableHeaderView:headerView];
    
    
   
    
    
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
