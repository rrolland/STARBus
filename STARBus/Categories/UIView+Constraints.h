//
//  UIView+Constraints.h
//  STARBus
//
//  Created by Romain Rolland on 25/06/2015.
//  Copyright (c) 2015 romainrolland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Constraints)

+ (void)setStretchContraintsForParentView:(UIView *)parentView child:(UIView *)childView;

@end
