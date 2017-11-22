//
//  ArrowSectionHeaderView.m
//  Example
//
//  Created by Robert Nash on 08/09/2015.
//  Copyright (c) 2015 Robert Nash. All rights reserved.
//

#import "ArrowSectionHeaderView.h"

#define DEGREES_TO_RADIANS(x) (M_PI * (x) / 180.0)

@interface ArrowSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation ArrowSectionHeaderView {
    BOOL isRotating;
}

-(void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
}

-(void)openAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.imageView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.imageView.transform = CGAffineTransformIdentity;
        isRotating = NO;
    }
}

-(void)closeAnimated:(BOOL)animated {
    
    if (animated && !isRotating) {
        
        isRotating = YES;
        
        [UIView animateWithDuration:0.2 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            self.imageView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
        } completion:^(BOOL finished) {
            isRotating = NO;
        }];
        
    } else {
        [self.layer removeAllAnimations];
        self.imageView.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180.0f));
        isRotating = NO;
    }
}

@end
