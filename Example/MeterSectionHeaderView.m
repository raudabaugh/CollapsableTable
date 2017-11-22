//
//  MeterSectionHeaderView.m
//  CollapsableOptions
//
//  Created by Robert Nash on 20/03/2016.
//  Copyright © 2016 Robert Nash. All rights reserved.
//

#import "MeterSectionHeaderView.h"
#import "MeterView.h"

@interface MeterSectionHeaderView ()
@property (weak, nonatomic) IBOutlet UIView *meterContainerView;
@property (weak, nonatomic) MeterView *meterView;
@property (weak, nonatomic) IBOutlet UIView *customContentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation MeterSectionHeaderView

-(void)awakeFromNib {
    [super awakeFromNib];
    self.customContentView.backgroundColor = RGB(87, 122, 190);
    self.meterContainerView.layer.cornerRadius = 5.0f;
    NSString *nibName = NSStringFromClass([MeterView class]);
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    MeterView *meterView = [nib instantiateWithOwner:self options:nil].firstObject;
    meterView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.meterContainerView addSubview:meterView];
    [self.meterContainerView addConstraints:[[self constraintsForMeterView:meterView] allObjects]];
    self.meterView = meterView;
}

-(NSSet *)constraintsForMeterView:(MeterView *)view {
    NSArray *constraints;
    NSDictionary *views = NSDictionaryOfVariableBindings(view);
    NSMutableSet *collector = [NSMutableSet new];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views];
    [collector addObjectsFromArray:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views];
    [collector addObjectsFromArray:constraints];
    return [collector copy];
}

-(void)updateTitle:(NSString *)title {
    self.titleLabel.text = title;
}

-(void)openAnimated:(BOOL)animated {
    [self.meterView lightUpAnimated:animated];
}

-(void)closeAnimated:(BOOL)animated {
    [self.meterView fadeOutAnimated:animated];
}

@end
