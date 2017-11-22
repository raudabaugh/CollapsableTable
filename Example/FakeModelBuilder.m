//
//  FakeModelBuilder.m
//  Example
//
//  Created by Robert Nash on 19/09/2015.
//  Copyright © 2015 Robert Nash. All rights reserved.
//

#import "FakeModelBuilder.h"

@implementation FakeModelBuilder

+(NSArray <MenuSection *> *)buildModel {
    NSMutableArray *collector = [NSMutableArray new];
    MenuSection *section;
    for (NSInteger i = 0; i < 50; i++) {
        section = [MenuSection new];
        section.title = [NSString stringWithFormat:@"Option %li", (long)i+1];
        section.isVisible = @(i == 0);
        section.items = [self randomItems];
        [collector addObject:section];
    }
    return [collector copy];
}

+(NSArray *)randomItems {
    NSMutableArray *collector = [@[] mutableCopy];
    NSInteger count = 1 + arc4random() % 5;
    for (NSInteger i = 0; i < count; i++) {
        [collector addObject:[NSString stringWithFormat:@"Item %li", (long)i+1]];
    }
    return [collector copy];
}

@end
