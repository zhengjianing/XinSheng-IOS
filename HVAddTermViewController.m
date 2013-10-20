//
//  HVAddTermViewController.m
//  HeartVoice
//
//  Created by jianing on 10/20/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "HVAddTermViewController.h"
#import "FrequentTermModel.h"

@interface HVAddTermViewController ()

@end

@implementation HVAddTermViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.termContentInput) || (textField == self.termTypeInput)) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        if ([self.termTypeInput.text length] || [self.termTypeInput.text length]) {
            self.frequentTermModel = [[FrequentTermModel alloc] initWithContent:self.termContentInput.text type:self.termTypeInput.text];
        }
    }
}

@end
