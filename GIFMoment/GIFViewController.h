//
//  GIFViewController.h
//  GIFMoment
//
//  Created by MonsterSucker on 3/22/16.
//  Copyright © 2016 MonsterSucker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "LLSimpleCamera.h"
@interface GIFViewController : BaseViewController
@property(nonatomic,strong)UIButton *gifCapButton;
@property(nonatomic,strong)UIButton *screenRecordButton;
@property(nonatomic,strong)UIButton *localButton;
@property(nonatomic,strong)LLSimpleCamera *camera;
@end
