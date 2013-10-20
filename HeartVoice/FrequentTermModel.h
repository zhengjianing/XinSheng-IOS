//
//  FrequentTermModel.h
//  HeartVoice
//
//  Created by jianing on 10/20/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FrequentTermModel : NSObject

@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *type;

-(id)initWithContent:(NSString *)content type:(NSString *)type;

@end
