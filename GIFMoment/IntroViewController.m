//
//  IntroViewController.m
//  GIFMoment
//
//  Created by Monster on 4/7/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import "IntroViewController.h"
#import "MYIntroductionPanel.h"
#import "MYBlurIntroductionView.h"
#import "MyCustomPanel.h"
@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setUpIntro];
    
}
- (void)_setUpIntro{
    
    MYIntroductionPanel *panel1 = [[ MYIntroductionPanel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome to GIFMoment" description:@"GIFMoment Is a Fabulus gif Social Community Which Brings People Who Share same Interests Back Together!" image:[UIImage imageNamed:@"intoex.png"]];
    panel1.PanelTitleLabel.textAlignment = NSTextAlignmentCenter;
    panel1.PanelDescriptionLabel.textAlignment = NSTextAlignmentCenter;
    MYIntroductionPanel *panel2 = [[ MYIntroductionPanel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome to GIFMoment" description:@"GIFMoment Is a Fabulus gif Social Community Which Brings People Who Share same Interests Back Together!" image:[UIImage imageNamed:@"intoex2.png"]];
    panel2.PanelTitleLabel.textAlignment = NSTextAlignmentCenter;
    panel2.PanelDescriptionLabel.textAlignment = NSTextAlignmentCenter;

    MYIntroductionPanel *panel3 = [[ MYIntroductionPanel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"Welcome to GIFMoment" description:@"GIFMoment Is a Fabulus gif Social Community Which Brings People Who Share same Interests Back Together!" image:[UIImage imageNamed:@"intoex3.png"]];
    panel3.PanelTitleLabel.textAlignment = NSTextAlignmentCenter;
    panel3.PanelDescriptionLabel.textAlignment = NSTextAlignmentCenter;

    MyCustomPanel *pannel4 = [[MyCustomPanel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) nibNamed:@"CIntro4"];
    
    MYBlurIntroductionView *myIntroView = [[MYBlurIntroductionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    myIntroView.delegate = self;
    NSArray *panelArray = @[panel1,panel2,panel3,pannel4];
    [myIntroView buildIntroductionWithPanels:panelArray];
    
    [self.view addSubview:myIntroView];
    
    
    
    
    
    
    
    
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
