//
//  HVFrequentTerm.m
//  HeartVoice
//
//  Created by jianing on 10/14/13.
//  Copyright (c) 2013 jianing. All rights reserved.
//

#import "FrequentTermsDataController.h"
#import "FrequentTerm.h"

@implementation FrequentTermsDataController

- (id)initWithContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if (self) {
        self.managedObjectContext = context;
        [self initializeDefaultDataList];
    }
    return self;
}


- (void)initializeDefaultDataList
{
    self.frequentTermsList = [[self fetchData] mutableCopy];
    
    if ([self.frequentTermsList count] == 0) {
        FrequentTermModel *term = [[FrequentTermModel alloc] initWithContent:@"hello" type:@"greeting"];
        [self addFrequentTermWithTerm:term];
    }
}

- (void)setFrequentTermList:(NSMutableArray *)newList
{
    if (_frequentTermsList != newList) {
        _frequentTermsList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList
{
    return [self.frequentTermsList count];
}

- (FrequentTerm *)objectInListAtIndex:(NSUInteger)theIndex
{
    return [self.frequentTermsList objectAtIndex:theIndex];
}

- (void)addFrequentTermWithTerm:(FrequentTermModel *)term
{
    [self.frequentTermsList addObject:term];
    [self insertToDBWithTerm:term];
}

- (void)removeFrequentTermWithTerm:(FrequentTermModel *)term
{
    [self.frequentTermsList removeObject:term];
    [self deleteFromDBWithTerm:term];
}


- (void)insertToDBWithTerm:(FrequentTermModel *)term
{
    FrequentTerm *frequentTerm = [NSEntityDescription insertNewObjectForEntityForName:@"FrequentTerm" inManagedObjectContext:self.managedObjectContext];
    frequentTerm.content = term.content;
    frequentTerm.type = term.type;
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

- (void)deleteFromDBWithTerm:(FrequentTermModel *)term
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"FrequentTerm"];
    NSError *error;
    NSArray *fetchResult = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if(!error){
        for(FrequentTerm *frequentTerm in fetchResult) {
            if ([frequentTerm.content isEqualToString:term.content]) {
                [self.managedObjectContext deleteObject:frequentTerm];
            }
        }
    }
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (NSArray *)fetchData
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"FrequentTerm" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

@end
