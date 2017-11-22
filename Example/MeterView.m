//
//  MeterView.m
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "MeterView.h"

#define LIGHT_GREY RGB(170, 170, 170)
#define DARK_GREY RGB(120, 120, 120)
#define ORANGE RGB(255, 127, 0)
#define WHITE RGB(200, 200, 200)
#define DURATION .1

@interface MeterView ()
@property (weak, nonatomic) IBOutlet UIView *top;
@property (weak, nonatomic) IBOutlet UIView *middle;
@property (weak, nonatomic) IBOutlet UIView *bottom;
@property (strong, nonatomic) dispatch_queue_t sleepQueue;
@end

@implementation MeterView

-(dispatch_queue_t)sleepQueue {
    
    if (_sleepQueue == nil) {
        _sleepQueue = dispatch_queue_create("rrn_sleepQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return _sleepQueue;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.top.backgroundColor = WHITE;
    self.middle.backgroundColor = LIGHT_GREY;
    self.bottom.backgroundColor = DARK_GREY;
}

-(void)lightUpAnimated:(BOOL)animated {
    
    CGFloat middleAlpha = 1;
    CGFloat bottomAlpha = 1;
    
    if (animated) {
        [self lightUpAnimatedWithMiddleAlpha:middleAlpha
                             withBottomAlpha:bottomAlpha];
    } else {
        self.middle.alpha = middleAlpha;
        self.bottom.alpha = bottomAlpha;
    }
}

-(void)fadeOutAnimated:(BOOL)animated {
    
    CGFloat middleAlpha = 41/100.0;
    CGFloat bottomAlpha = 5/100.0f;
    
    if (animated) {
        [self fadeOutAnimatedWithMiddleAlpha:middleAlpha
                             withBottomAlpha:bottomAlpha];
    } else {
        self.middle.alpha = middleAlpha;
        self.bottom.alpha = bottomAlpha;
    }
}

-(void)lightUpAnimatedWithMiddleAlpha:(CGFloat)middleAlpha
                      withBottomAlpha:(CGFloat)bottomAlpha {
    
    [UIView animateWithDuration:DURATION
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.middle.alpha = middleAlpha;
                     } completion:^(BOOL finished) {
                         dispatch_async(self.sleepQueue, ^{
                             sleep(.3);
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 self.bottom.alpha = bottomAlpha;
                             });
                         });
                     }];
}

-(void)fadeOutAnimatedWithMiddleAlpha:(CGFloat)middleAlpha
                      withBottomAlpha:(CGFloat)bottomAlpha {
    
    [UIView animateWithDuration:DURATION
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.bottom.alpha = bottomAlpha;
                     } completion:^(BOOL finished) {
                         dispatch_async(self.sleepQueue, ^{
                             sleep(.3);
                             dispatch_async(dispatch_get_main_queue(), ^{
                                 self.middle.alpha = middleAlpha;
                             });
                         });
                     }];
}

@end
