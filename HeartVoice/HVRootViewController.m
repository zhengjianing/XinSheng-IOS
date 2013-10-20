//
//  HVRootViewController.m
//  HeartVoice
//
//  Created by jianing on 10/13/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "HVRootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "HVMasterViewController.h"

@interface HVRootViewController ()
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (strong, nonatomic) NSMutableArray *frequentTerms;
@end

@implementation HVRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@", APPID];
    iFlySynthesizerView = [[IFlySynthesizerView alloc] initWithOrigin:CGPointMake(10, 60) params:initString];
    iFlySynthesizerView.delegate = self;
    
    iFlyRecognizerView = [[IFlyRecognizerView alloc] initWithOrigin:CGPointMake(10, 60) initParam:initString];
    iFlyRecognizerView.delegate = self;
    
    self.inputTextView.delegate = self;
    self.inputTextView.layer.borderWidth =1.0;
    self.inputTextView.layer.cornerRadius =5.0;
    [self.view addSubview:self.inputTextView];
}

- (IBAction)rootViewTouchDown:(id)sender {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.inputTextView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (IBAction)clearTextView:(UIButton *)sender {
    self.inputTextView.text = @"";
}

- (IBAction)readTextView:(UIButton *)sender {
    [iFlySynthesizerView startSpeaking:self.inputTextView.text];
}

- (IBAction)startSpeak:(UIButton *)sender {
    self.inputTextView.text = @"";
    [iFlyRecognizerView start];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"frequentTermsSegue"]) {
        [segue.destinationViewController setManagedObjectContext:self.managedObjectContext];
    }
}

// IFlySynthesizerViewDelegate
- (void) onBufferProress:(IFlySynthesizerView *)iFlySynthesizerView progress:(int)progress
{
    NSLog(@"bufferProgress: %d",progress);
}

- (void) onEnd:(IFlySynthesizerView *)iFlySynthesizerView error:(IFlySpeechError *)error{}

- (void) onPlayProress:(IFlySynthesizerView *)iFlySynthesizerView progress:(int)progress
{
    NSLog(@"playProgress: %d",progress);
}

// IFlyRecognizerViewDelegate
- (void) onResult:(IFlyRecognizerView *)iFlyRecognizerView theResult:(NSArray *)resultArray
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    for (NSString *key in dic) {
        [result appendFormat:key, [dic objectForKey:key]];
    }
    self.inputTextView.text = [NSString stringWithFormat:@"%@%@", self.inputTextView.text,result];
}

- (void)onEnd:(IFlyRecognizerView *)iFlyRecognizerView theError:(IFlySpeechError *) error
{
    NSLog(@"recognizer end");
}

@end
