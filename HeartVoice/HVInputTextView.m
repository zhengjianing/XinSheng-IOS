//
//  HVInputTextView.m
//  HeartVoice
//
//  Created by jianing on 10/14/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "HVInputTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation HVInputTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth =1.0;
        self.layer.cornerRadius =5.0;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
