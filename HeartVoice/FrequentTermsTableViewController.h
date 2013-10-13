//
//  FrequentTermsTableViewController.h
//  HeartVoice
//
//  Created by jianing on 10/13/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrequentTermsTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *terms;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
