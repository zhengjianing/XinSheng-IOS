//
//  HVAddTermViewController.h
//  HeartVoice
//
//  Created by jianing on 10/20/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FrequentTermModel.h"

@interface HVAddTermViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *termContentInput;
@property (weak, nonatomic) IBOutlet UITextField *termTypeInput;
@property (strong, nonatomic) FrequentTermModel *frequentTermModel;

@end
