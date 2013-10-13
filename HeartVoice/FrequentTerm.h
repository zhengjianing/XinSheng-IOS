//
//  FrequentTerm.h
//  HeartVoice
//
//  Created by jianing on 10/13/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FrequentTerm : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * type;

@end
