//
//  HVMasterViewController.h
//  HeartVoice
//
//  Created by jianing on 10/14/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrequentTermsDataController.h"

@interface HVMasterViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) FrequentTermsDataController *dataController;
@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
