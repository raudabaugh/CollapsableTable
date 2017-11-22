//
//  StarsSectionHeaderView.m
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "StarsSectionHeaderView.h"
#import "UILabel+flash.h"

@interface StarsSectionHeaderView ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *starLabels;
@property (weak, nonatomic) IBOutlet UIView *customContentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation StarsSectionHeaderView {
    BOOL _isFlashing;
}

-(void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
}

-(void)openAnimated:(BOOL)animated {
    
    if (animated && !_isFlashing) {
        
        _isFlashing = YES;
        
        [UIView animateWithDuration:.2
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.customContentView.backgroundColor = [UIColor orangeColor];
                         } completion:^(BOOL finished) {
                             for (UILabel *starLabel in self.starLabels) {
                                 starLabel.hidden = NO;
                                 [starLabel blink];
                             }
                         }];
        
    } else {
        self.customContentView.backgroundColor = [UIColor orangeColor];
        for (UILabel *starLabel in self.starLabels) {
            starLabel.hidden = NO;
            [starLabel blink];
        }
        _isFlashing = NO;
    }
}

-(void)closeAnimated:(BOOL)animated {
    
    UIColor *colour = [UIColor colorWithRed:218/255.0 green:0 blue:0 alpha:1];
    
    if (animated && !_isFlashing) {
        
        _isFlashing = YES;
        
        [UIView animateWithDuration:.2
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.customContentView.backgroundColor = colour;
                         } completion:^(BOOL finished) {
                             for (UILabel *starLabel in self.starLabels) {
                                 [starLabel.layer removeAllAnimations];
                                 starLabel.hidden = YES;
                             }
                         }];
        
    } else {
        self.customContentView.backgroundColor = colour;
        for (UILabel *starLabel in self.starLabels) {
            [starLabel.layer removeAllAnimations];
            starLabel.hidden = YES;
        }
        _isFlashing = NO;
        
    }
}

@end
