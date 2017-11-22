//
//  MenuSection.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "MenuSection.h"

@implementation MenuSection

@synthesize title = _title;
@synthesize isVisible = _isVisible;
@synthesize items = _items;

-(instancetype)initWithTitle:(NSString *)title withOptionVisible:(NSNumber *)isVisible withItems:(NSArray *)items {
    self = [super init];
    if (self) {
        _title = title;
        _isVisible = isVisible;
        _items = items;
    }
    return self;
}

@end
