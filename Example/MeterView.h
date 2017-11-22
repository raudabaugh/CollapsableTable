//
//  MeterView.h
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@interface MeterView : UIView
-(void)lightUpAnimated:(BOOL)animated;
-(void)fadeOutAnimated:(BOOL)animated;
@end
