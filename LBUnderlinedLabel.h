//
//  LBUnderlinedLabel.h
//  LBUnderlinedLabel
//
//  Created by Laurin Brandner on 21.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBUnderlinedLabel : UILabel {
    CGFloat underlineThickness;
    UIColor* underlineColor;
    CGFloat underlinePosition; //NEGATIVE! distance between baseline and underline
}

@property (nonatomic) CGFloat underlineWidth;
@property (nonatomic) CGFloat underlinePosition;
@property (nonatomic, retain) UIColor* underlineColor;

@end
