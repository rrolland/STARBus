//
//  UIView+Constraints.m
//  STARBus
//
//  Created by Romain Rolland on 25/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import "UIView+Constraints.h"

@implementation UIView (Constraints)

+ (void)setStretchContraintsForParentView:(UIView *)parentView child:(UIView *)childView {
    
    UIView *theSuperview = parentView;
    UIView *theChildView = childView;
    
    theChildView.translatesAutoresizingMaskIntoConstraints = NO;
    // align childview from the left and right
    [theSuperview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[theChildView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(theChildView)]];
    
    // align childview from the top and bottom
    [theSuperview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[theChildView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(theChildView)]];
}

@end
