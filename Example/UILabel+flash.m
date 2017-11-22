//
//  UILabel+flash.m
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "UILabel+flash.h"

@implementation UILabel (flash)

-(void)blink {
    
    self.alpha = 0;
    
    [UIView animateWithDuration:.3
                          delay:0
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                     animations:^{
                         self.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         self.alpha = 0.0;
                     }];
    
}

@end
