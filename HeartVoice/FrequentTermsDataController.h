//
//  HVFrequentTerm.h
//  HeartVoice
//
//  Created by jianing on 10/14/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FrequentTermModel.h"

@interface FrequentTermsDataController : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *frequentTermsList;

- (id)initWithContext:(NSManagedObjectContext *)managedObjectContext;

- (NSUInteger)countOfList;
- (FrequentTermModel *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addFrequentTermWithTerm:(FrequentTermModel *)term;
- (void)removeFrequentTermWithTerm:(FrequentTermModel *)term;

@end
