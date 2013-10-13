//
//  HVRootViewController.h
//  HeartVoice
//
//  Created by jianing on 10/13/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iflyMSC/IFlySynthesizerViewDelegate.h"
#import "iflyMSC/IFlySynthesizerView.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "iflyMSC/IFlyRecognizerView.h"
#import "FrequentTermsTableViewController.h"

#define APPID       @"523e8a23"

@interface HVRootViewController : UIViewController<IFlySynthesizerViewDelegate, IFlyRecognizerViewDelegate, UITextViewDelegate>
{
    IFlySynthesizerView *iFlySynthesizerView;
    IFlyRecognizerView *iFlyRecognizerView;
    
}
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
- (IBAction)rootViewTouchDown:(id)sender;

@end
