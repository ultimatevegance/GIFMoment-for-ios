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

@interface ProfileViewController ()

@end

@implementation ProfileViewController
{
        MGViewControllerDelegate *myDelegate;
        MGViewControllerDataSource *myDataSource;
    }

- (instancetype)initWithMainImage:(UIImage *)image{
    self = [super initWithMainImage:image tableScrollingType:MGSpotyViewTableScrollingTypeNormal];
    if (self) {
        myDelegate = [MGViewControllerDelegate new];
        myDataSource = [MGViewControllerDataSource new];
        self.overViewUpFadeOut = YES;
        self.blurRadius = 8.f;
        self.tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
    }
    
    
    
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = myDataSource;
    self.delegate = myDelegate ;
    self.view.backgroundColor = [UIColor magentaColor];
   

   

}
- (UIView *)myOverView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.overView.frame.size.width, 300)];
    [self _addElementOnView:view];
    
    return view;
}
- (void)_addElementOnView : (UIView* )view{
    
    
    
    
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
