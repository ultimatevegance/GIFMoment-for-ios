//
//  MGViewControllerDataSource.m
//  MGSpotyView
//
//  Created by Daniele Bogo on 08/08/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGViewControllerDataSource.h"
#import "MGSpotyViewController.h"


@implementation MGViewControllerDataSource


#pragma mark - MGSpotyViewControllerDataSource

- (NSInteger)spotyViewController:(MGSpotyViewController *)spotyViewController
           numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)spotyViewController:(MGSpotyViewController *)spotyViewController
                               tableView:(UITableView *)tableView
                   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"MSCell";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MSCell" owner:nil options:nil]lastObject ];
    }
    return cell;
}

@end
