//
//  FrequentTermModel.m
//  HeartVoice
//
//  Created by jianing on 10/20/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "FrequentTermModel.h"

@implementation FrequentTermModel

-(id)initWithContent:(NSString *)content type:(NSString *)type
{
    self = [super init];
    if (self) {
        _content = content;
        _type = type;
        return self;
    }
    return nil;
}

@end
