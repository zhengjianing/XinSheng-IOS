//
//  HVMasterViewController.m
//  HeartVoice
//
//  Created by jianing on 10/14/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "HVMasterViewController.h"
#import "FrequentTermModel.h"

@implementation HVMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[FrequentTermsDataController alloc] initWithContext:self.managedObjectContext];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"termCellIdentifier";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    FrequentTermModel *termModel = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:termModel.content];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end
